require 'colorize'
require 'io/console'
require 'tty-spinner'

class ShoppingCart
  def initialize
    @products = []
    @prices = []
    @spinner = TTY::Spinner.new("🌟 Carregando: [:spinner]", format: :pulse_2)
  end

  def start
    show_header('🛒 Bem-vindo à Leroy Marlin')
    loop do
      product = load_product
      price = load_price

      @products << product
      @prices << price

      break unless continue_shopping?
    end

    show_summary
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
    loop do
      print '➕ Deseja registrar outro produto? [S/N]: '.colorize(:blue)
      choice = gets.chomp.strip.upcase

      case choice
      when 'S' then return true
      when 'N' then return false
      else
        show_message('⚠️ Opção inválida! Use [S]im ou [N]ão.', :red)
      end
    end
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
end

# Instância do Carrinho
cart = ShoppingCart.new
cart.start
