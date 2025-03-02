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

  def start
    show_header('🛒 Bem-vindo à Leroy Marlin')
    load_history

    loop do
      product = request_input('🏷️ Nome do Produto:', :yellow) { |input| !input.empty? }
      price = request_price
      price = apply_discount(price) { |p| p >= DISCOUNT_THRESHOLD }

      @products << product
      @prices << price

      break unless continue_shopping?
    end

    finalize_purchase
  end

  private

  def show_header(text)
    puts '=' * 70
    puts text.center(70).colorize(:magenta).bold
    puts '=' * 70
  end

  def request_input(prompt_text, color)
    loop do
      print "#{prompt_text} ".colorize(color)
      input = gets.chomp.strip.capitalize
      return input if block_given? ? yield(input) : true

      show_message('⚠️ Entrada inválida! Tente novamente.', :red)
    end
  end

  def format_currency(value)
    "R$#{'%.2f' % value}".gsub('.', ',')
  end

  def request_price
    request_input('💰 Preço:', :green) do |input|
      input.match?(/^\d+(\.\d{1,2})?$/) && input.to_f.positive?
    end.to_f
  end

  def continue_shopping?
    @prompt.yes?('➕ Deseja registrar outro produto?')
  end

  def apply_discount(price)
    return price unless block_given? && yield(price)

    discounted_price = (price * (1 - DISCOUNT_RATE)).round(2)
    show_message("🎯 Desconto de 5% aplicado! Novo valor: R$#{'%.2f' % discounted_price}", :green)
    discounted_price
  end

  def finalize_purchase
    save_to_json
    show_summary
    generate_pdf
  end

  def show_message(text, color = :cyan)
    puts text.colorize(color)
    sleep(0.5)
  end

  def show_summary
    @spinner.auto_spin
    sleep(2)
    @spinner.success('✅ Concluído!')

    show_header("📋 Orçamento da Compra - #{Time.now.strftime('%d/%m/%Y %H:%M:%S')} - Vendedor: Carlos")

    puts "🛒 Produtos Orçados (#{@products.size} itens):".colorize(:blue)
    @products.each_with_index { |product, index| puts "#{index + 1}. #{product} - R$#{'%.2f' % @prices[index]}".colorize(:cyan) }

    total = @prices.sum
    cheapest, = @prices.minmax

    puts "💵 Valor total: R$#{'%.2f' % total}".colorize(:green)
    puts "🔥 Produto mais barato #{@products[@prices.index(cheapest)]} custando R$#{'%.2f' % cheapest}".colorize(:yellow)
    puts "💪 Produtos acima de R$100: #{@prices.count { |price| price >= DISCOUNT_THRESHOLD }}".colorize(:light_red)
    puts '=' * 70

    show_message('🎯 Obrigado pela preferência! * Tudo para Obras * Whatzap 21 998742626', :blue)
  end

  def save_to_json
    data = {
      date: Time.now.strftime('%d/%m/%Y %H:%M:%S'),
      products: @products,
      prices: @prices
    }

    File.open(FILE_PATH, 'a') { |file| file.puts(JSON.pretty_generate(data)) }
    show_message('💾 Orçamento de Produtos salvo com sucesso!', :green)
  end

  def load_history
    return unless File.exist?(FILE_PATH)

    show_message('📄 Processando Orçamento...', :yellow)

    File.foreach(FILE_PATH) do |line|
      purchase = JSON.parse(line)
      puts "🗓️ #{purchase['date']}"
      purchase['products'].zip(purchase['prices']).each_with_index do |(product, price), index|
        puts "#{index + 1}. #{product} - R$#{'%.2f' % price}"
      end
      puts '-' * 70
    end
  rescue JSON::ParserError
    show_message('❌ Erro ao carregar orçamento. Arquivo corrompido.', :red)
  end

  def generate_pdf
    return show_message('❌ Nenhum produto registrado para gerar PDF!', :red) if @products.empty?

    @products ||= [] # Se a variável for nil, ele cria um array vazio
    @prices ||= [] # Se já estiver preenchida, ele apenas usa o valor existente

    file_name = "orcamento_compra_#{Time.now.strftime('%Y%m%d')}.pdf"
    Prawn::Fonts::AFM.hide_m17n_warning = true
    Prawn::Document.generate(file_name) do
      text 'Orçamento da Compra', size: 20, style: :bold
      move_down 20
      text 'Produtos Registrados:', size: 15, style: :bold
      text '-' * 100

      if @products&.any?
        @products.each_with_index do |product, index|
          text "#{index + 1}. #{product} - R$#{'%.2f' % @prices[index]}"
        end
      else
        text 'Nenhum produto registrado.'
      end

      move_down 20
      text "Valor Total: #{format_currency(@prices.sum)}", size: 15, color: :green

      text "Data do Orçamento: #{Time.now.strftime('%d/%m/%Y %H:%M:%S')}"
    end

    show_message("📄 PDF '#{file_name}' gerado com sucesso!", :green)
  end
end

cart = ShoppingCart.new
cart.start
