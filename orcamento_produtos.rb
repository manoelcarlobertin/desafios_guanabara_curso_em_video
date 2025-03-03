require 'colorize'
require 'io/console'
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
    @products = []
    @prices = []
    @spinner = TTY::Spinner.new('🌟 Carregando: [:spinner]', format: :pulse_2)
    @prompt = TTY::Prompt.new
  end

  # Apaga o arquivo JSON se ele existir
  def clear_history_file
    if File.exist?(FILE_PATH)
      File.delete(FILE_PATH)
      show_message('🗑️ Arquivo de histórico apagado com sucesso!', :yellow)
    else
      show_message('⚠️ Nenhum arquivo de histórico encontrado.', :light_yellow)
    end
  end

  def start
    show_header('🛒 Bem-vindo à Leroy Marlin')
    clear_history_file # 🔥 Chamando a função para apagar o arquivo
    load_history
    process_products
    finalize_purchase
  end

  private

  # Exibe o cabeçalho
  def show_header(text)
    puts '=' * 70
    puts text.center(70).colorize(:magenta).bold
    puts '=' * 70
  end

  # Loop para registrar produtos
  def process_products
    loop do
      product = request_product
      price = request_price
      price = apply_discount(price)

      add_product(product, price)

      break unless continue_shopping?
    end
  end

  # Adiciona produto e preço nos arrays
  def add_product(product, price)
    @products << product
    @prices << price
  end

  # Solicita o nome do produto
  def request_product
    request_input('🏷️ Nome do Produto:', :yellow) { |input| !input.empty? }
  end

  # Solicita o preço
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

  # Pergunta se deseja continuar
  def continue_shopping?
    @prompt.yes?('➕ Deseja registrar outro produto?')
  end

  # Aplica desconto de 5% se necessário
  def apply_discount(price)
    return price unless price >= DISCOUNT_THRESHOLD

    discounted_price = (price * (1 - DISCOUNT_RATE)).round(2)
    show_message("🎯 Desconto de 5% aplicado! Novo valor: #{format_currency(discounted_price)}", :green)
    discounted_price
  end

  # Formata valor para R$
  def format_currency(value)
    return 'R$0,00' if value.nil?

    "R$#{'%.2f' % value}".gsub('.', ',')
  end

  # Retorna o valor total da compra
  def total_sum
    @prices.sum
  end

  # Salva os dados no arquivo JSON
  def save_to_json
    data = {
      date: Time.now.strftime('%d/%m/%Y %H:%M:%S'),
      products: @products,
      prices: @prices
    }

    File.open(FILE_PATH, 'a') { |file| file.puts(JSON.pretty_generate(data)) }
    show_message('💾 Orçamento de Produtos salvo com sucesso!', :green)
  end

  # Carrega o histórico de compras
  def load_history
    return unless File.exist?(FILE_PATH)

    show_message('📄 Processando Orçamento...', :yellow)

    File.foreach(FILE_PATH) do |line|
      purchase = JSON.parse(line)
      display_history(purchase)
    end
  rescue JSON::ParserError
    show_message('❌ Erro ao carregar orçamento. Arquivo corrompido.', :red)
  end

  # Exibe histórico
  def display_history(purchase)
    puts "🗓️ #{purchase['date']}"
    purchase['products'].zip(purchase['prices']).each_with_index do |(product, price), index|
      puts "#{index + 1}. #{product} - #{format_currency(price)}"
    end
    puts '-' * 70
  end

  # Mostra mensagens
  def show_message(text, color = :cyan)
    puts text.colorize(color)
    sleep(0.5)
  end

  # Finaliza compra
  def finalize_purchase
    save_to_json
    show_summary
    generate_pdf
  end

  # Resumo da compra
  def show_summary
    show_header("📋 Orçamento da Compra - #{Time.now.strftime('%d/%m/%Y %H:%M:%S')} - Vendedor: Carlos")

    @products.each_with_index do |product, index|
      puts "#{index + 1}. #{product} - #{format_currency(@prices[index])}".colorize(:cyan)
    end

    puts "💵 Valor Total: #{format_currency(total_sum)}".colorize(:green)
    puts "🔥 Produto mais barato: #{@products[@prices.index(@prices.min)]}".colorize(:yellow)
    puts "💪 Produtos acima de R$100: #{@prices.count { |p| p >= DISCOUNT_THRESHOLD }}".colorize(:light_red)
  end

  # Gera PDF
  def generate_pdf
    file_name = "orcamento_#{Time.now.strftime('%Y%m%d')}.pdf"
    Prawn::Fonts::AFM.hide_m17n_warning = true

    Prawn::Document.generate(file_name) do
      text 'Orçamento da Compra', size: 20, style: :bold
      move_down 20

      @products.each_with_index do |product, index|
        text "#{index + 1}. #{product} - #{format_currency(@prices[index])}"
      end

      move_down 20
      text "Valor Total: #{format_currency(total_sum)}", size: 15, color: '009900'
    end

    show_message("📄 PDF '#{file_name}' gerado com sucesso!", :green)
  end
end

cart = ShoppingCart.new
cart.start
