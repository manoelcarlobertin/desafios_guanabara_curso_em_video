require 'colorize'
require 'securerandom'

# Função para exibir cabeçalhos decorados
def header(text)
  puts '=' * 46
  puts text.center(46).colorize(:magenta).bold
  puts '=' * 46
end

# Função para gerar emojis aleatórios
def random_emoji
  ['🔥', '🚀', '🎯', '💪', '🤓'].sample
end

# Função para exibir o menu de opções
def menu
  puts "\n#{random_emoji} What would you like to do?".colorize(:yellow)
  puts "1 - Discover the Largest Value".colorize(:blue)
  puts "2 - Add the Values".colorize(:green)
  puts "3 - Multiply the Values".colorize(:cyan)
  puts "4 - Enter New Values".colorize(:light_red)
  puts "5 - Factorial of the 1st Value".colorize(:green)
  puts "6 - Exit".colorize(:red)
  print "\nYour Option: ".colorize(:light_yellow)
  input = gets.chomp
  input.match?(/^\d+$/) ? input.to_i : -1
end

# Função para calcular o fatorial usando loop
def factorial(n1)
  (1..n1).reduce(1, :*)
end

# Função para solicitar números com validação
def get_numbers
  n1, n2 = nil, nil
  ["FIRST", "SECOND"].each_with_index do |order, index|
    loop do
      print "Enter the #{order} value: ".colorize(:green)
      input = gets.chomp
      if input.match?(/^\d+$/)
        index.zero? ? n1 = input.to_i : n2 = input.to_i
        break
      else
        puts 'Invalid input! Please enter a valid number.'.colorize(:red)
      end
    end
  end
  [n1, n2]
end

# Exibe mensagem e espera 1 segundo para melhor experiência
def show_message(message, color)
  puts message.colorize(color)
  sleep(1)
end

# Início do Programa
header("VALUE ANALYSIS #{random_emoji}")
n1, n2 = get_numbers

loop do
  option = menu

  case option
  when 1
    greater = [n1, n2].max
    show_message("The greater value between * #{n1} and #{n2} * is #{greater}.", :green)
  when 2
    sum = n1 + n2
    show_message("The sum of * #{n1} and #{n2} * is #{sum}.", :green)
  when 3
    product = n1 * n2
    show_message("The product of * #{n1} and #{n2} * is #{product}.", :green)
  when 4
    n1, n2 = get_numbers
    show_message('New values entered successfully!', :cyan)
  when 5
    if n1&.is_a?(Integer) && n1 >= 0
      result = factorial(n1)
      show_message("Factorial (#{n1}!) done. It is #{result}.", :green)
    else
      show_message('Invalid input! Please enter a valid number.', :red)
    end
  when 6
    puts "Thank you! Goodbye! #{random_emoji}".colorize(:magenta)
    break
  else
    puts 'Invalid Option! Please Try Again...'.colorize(:red)
  end
end
