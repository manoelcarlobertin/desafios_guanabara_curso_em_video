require 'colorize'
require 'tty-spinner'
require 'tty-prompt'
require 'json'
require 'prawn'
require 'date'
require 'active_support'
require 'active_support/core_ext'

class ShoppingCart
  FILE_PATH = 'shopping_history.json'.freeze
  DISCOUNT_THRESHOLD = 100
  DISCOUNT_RATE = 0.05

  attr_accessor :products, :prices

  def initialize
    @products ||= [] # Garante que o Array nunca será nil.
    @prices ||= []
    @spinner = TTY::Spinner.new('🌟 Carregando: [:spinner]', format: :pulse_2)
    @prompt = TTY::Prompt.new
  end

  def start
    show_header('🛒 Bem-vindo à Leroy Marlin')
    clear_history_file
    process_products
    finalize_purchase
  end

  private

  # Limpa o arquivo JSON antes de iniciar
  def clear_history_file
    if File.exist?(FILE_PATH)
      File.delete(FILE_PATH)
      show_message('🗑️ Histórico apagado com sucesso!', :yellow)
    else
      show_message('⚠️ Nenhum histórico encontrado.', :light_yellow)
    end
  end

  # Mostra cabeçalhos no terminal
  def show_header(text)
    puts '=' * 70
    puts text.center(70).colorize(:magenta).bold
    puts '=' * 70
  end

  # Loop para cadastrar produtos
  def process_products
    loop do
      product = request_product
      price = request_price
      price = apply_discount(price)

      add_product(product, price)
      break unless continue_shopping?
    end
  end

  # Adiciona produto e preço às listas
  def add_product(product, price)
    @products << product
    @prices << price
  end

  # Pergunta ao usuário se deseja continuar
  def continue_shopping?
    @prompt.yes?('➕ Deseja adicionar outro produto?')
  end

  # Solicita o nome do produto
  def request_product
    request_input('🏷️ Nome do Produto:', :yellow) { |input| !input.empty? }
  end

  # Solicita o preço do produto
  def request_price
    request_input('💰 Preço:', :green) do |input|
      input.match?(/^\d+(\.\d{1,2})?$/) && input.to_f.positive?
    end.to_f
  end

  # Entrada de dados com validação
  def request_input(prompt_text, color)
    loop do
      print "#{prompt_text} ".colorize(color)
      input = gets.chomp.strip.capitalize
      return input if block_given? ? yield(input) : true

      show_message('⚠️ Entrada inválida! Tente novamente.', :red)
    end
  end

  # Aplica desconto se necessário
  def apply_discount(price)
    if price >= DISCOUNT_THRESHOLD
      price *= (1 - DISCOUNT_RATE)
      show_message("🎯 Desconto de 5% aplicado! Novo valor: #{format_currency(price)}", :green)
    end
    price.round(2)
  end

  # Salva dados no arquivo JSON
  def save_to_json
    data = {
      date: Time.now.strftime('%d/%m/%Y %H:%M:%S'),
      products: @products,
      prices: @prices
    }

    File.open(FILE_PATH, 'a') { |file| file.puts(JSON.pretty_generate(data)) }
    show_message('💾 Orçamento salvo com sucesso!', :green)
  end

  # Formata valores monetários para R$
  def format_currency(value)
    return 'R$0,00' if value.nil?
    "R$#{'%.2f' % value}".gsub('.', ',')
  end

  # Exibe mensagens no terminal
  def show_message(text, color = :cyan)
    puts text.colorize(color)
    sleep(0.3)
  end

  # Retorna o valor total
  def total_sum
    @prices.sum
  end

  # Mostra o resumo da compra
  def show_summary
    show_header("📋 Orçamento da Compra - #{Time.now.strftime('%d/%m/%Y %H:%M:%S')} - Vendedor: Carlos")

    @products.each_with_index do |product, index|
      puts "#{index + 1}. #{product} - #{format_currency(@prices[index])}".colorize(:cyan)
    end

    puts "💵 Valor Total: #{format_currency(total_sum)}".colorize(:green)
    puts "🔥 Produto mais barato: #{@products[@prices.index(@prices.min)]}".colorize(:yellow)
    puts "💪 Produtos acima de R$100: #{@prices.count { |p| p >= DISCOUNT_THRESHOLD }}".colorize(:light_red)
  end

  # Finaliza o orçamento
  def finalize_purchase
    save_to_json
    show_summary
  end
end

cart = ShoppingCart.new
cart.start
