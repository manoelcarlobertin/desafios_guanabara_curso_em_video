require 'colorize'

module Fibonacci
  def self.random_emoji
    ['🌟', '🔥', '🚀', '💪', '🎯'].sample
  end

  def self.header(text)
    puts '=' * 46
    puts text.center(46).colorize(:magenta).bold
    puts '=' * 46
  end

  def self.show_message(message, color)
    puts message.colorize(color)
    sleep(0.5)
  end

  def self.load_number(prompt)
    loop do
      print prompt.colorize(:green)
      input = gets.chomp
      return input.to_i if input.match?(/^\d+$/)

      show_message('Invalid input! Please enter a valid number.', :red)
    end
  end

  def self.generate_fibonacci_terms(num)
    previous = 0 # 
    next_term = 1
    count = 1

    show_message("Here is your Fibonacci sequence with #{num} terms: #{random_emoji}", :cyan)
    while count <= num
      print "#{previous} ".colorize(:yellow)
      sleep(0.3)
      sum = previous + next_term
      previous = next_term
      next_term = sum
      count += 1
    end
    puts 'FIM'.colorize(:green)
  end
end

# Início do Programa
Fibonacci.header("FIBONACCI SEQUENCE #{Fibonacci.random_emoji}")
num = Fibonacci.load_number('Enter the number of terms for the Fibonacci sequence: ')
Fibonacci.generate_fibonacci_terms(num)
