require 'colorize'
require 'io/console'
require 'tty-spinner'
require 'tty-prompt'
require 'json'
require 'prawn'
require 'date'

class ShoppingCart
  attr_accessor :products, :prices

  FILE_PATH = 'shopping_history.json'.freeze

  def initialize
    @products = []
    @prices = []
    @spinner = TTY::Spinner.new('🌟 Carregando: [:spinner]', format: :pulse_2)
    @prompt = TTY::Prompt.new
  end

  def start
    show_header('🛒 Bem-vindo à Leroy Marlin')

    load_history if File.exist?(FILE_PATH)

    loop do
      product = load_product
      price = load_price
      apply_discount(price, product)

      @products << product
      @prices << price

      break unless continue_shopping?
    end

    save_to_json
    show_summary
    generate_pdf
  end

  private

  def show_header(text)
    puts '=' * 60
    puts text.center(60).colorize(:magenta).bold
    puts '=' * 60
  end

  def show_message(text, color = :cyan)
    puts text.colorize(color)
    sleep(0.5)
  end

  def load_product
    loop do
      print '🏷️ Nome do Produto: '.colorize(:yellow)
      product = gets.chomp.strip.capitalize
      return product unless product.empty?

      show_message('⚠️ O nome do produto não pode estar vazio!', :red)
    end
  end

  def load_price
    loop do
      print '💰 Preço: '.colorize(:green)
      input = gets.chomp

      if input.match?(/^\d+(\.\d{1,2})?$/) && input.to_f.positive?
        return input.to_f
      else
        show_message('❌ Apenas preços positivos são permitidos.', :red)
      end
    end
  end

  def continue_shopping?
    choices = { 'Sim' => true, 'Não' => false }
    @prompt.select('➕ Deseja registrar outro produto?', choices)
  end

  def apply_discount(price, product)
    if price >= 1000
      show_message("🎯 Desconto de 10% aplicado para #{product}!", :green)
      price *= 0.9
    end
    price
  end

  def show_summary
    @spinner.auto_spin
    sleep(2)
    @spinner.success('✅ Concluído!')

    show_header("📋 Resumo da Compra - #{Time.now.strftime('%d/%m/%Y %H:%M:%S')}")

    puts "🛒 Produtos Comprados (#{@products.size} itens):".colorize(:blue)
    @products.sort.each_with_index do |product, index|
      puts "#{index + 1}. #{product}".colorize(:cyan)
    end

    puts "💵 Valor total: R$#{'%.2f' % @prices.sum}".colorize(:green)
    cheapest = @products[@prices.index(@prices.min)]
    puts "🔥 Produto mais barato: #{cheapest} custando R$#{'%.2f' % @prices.min}".colorize(:yellow)
    puts "💪 Produtos acima de R$1000: #{@prices.count { |price| price >= 1000 }}".colorize(:light_red)

    puts '=' * 60
    show_message('🎯 Obrigado pela preferência! Até logo!', :blue)
  end

  def save_to_json
    data = {
      date: Time.now,
      products: @products,
      prices: @prices
    }

    File.open(FILE_PATH, 'a') do |file|
      file.puts(JSON.generate(data))
    end
    show_message('💾 Compra salva com sucesso!', :green)
  end

  def load_history
    show_message('📄 Carregando Histórico...', :yellow)
    file = File.read(FILE_PATH)
    history = JSON.parse(file)

    history.each do |purchase|
      puts "🗓️ #{purchase['date']}"
      purchase['products'].each_with_index do |product, index|
        puts "#{index + 1}. #{product} - R$#{purchase['prices'][index]}"
      end
      puts '-' * 40
    end
  end

  def generate_pdf
    Prawn::Document.generate("resumo_compra_#{Time.now.strftime('%Y%m%d')}.pdf") do
      text 'Resumo da Compra', size: 20, style: :bold
      move_down 20

      @products.each_with_index do |product, index|
        text "#{index + 1}. #{product} - R$#{'%.2f' % @prices[index]}"
      end

      move_down 20
      text "Valor Total: R$#{'%.2f' % @prices.sum}", size: 15, color: '009900'
      text "Data da Compra: #{Time.now.strftime('%d/%m/%Y %H:%M:%S')}"
    end

    show_message('📄 PDF gerado com sucesso!', :green)
  end
end

cart = ShoppingCart.new
cart.start
