require 'colorize'

module MultiplicationTable
  def self.header(text)
    puts '=' * 70
    puts text.center(70).colorize(:magenta).bold
    puts '=' * 70
  end

  def self.show_message(message, color)
    puts message.colorize(color)
    sleep(0.5)
  end

  def self.load_number(prompt)
    loop do
      print prompt.colorize(:green)
      input = gets.chomp
      return input.to_i if input.match?(/^-?\d+$/)

      show_message('🚫 Entrada inválida! Digite um número inteiro.', :red)
    end
  end

  def self.run
    header('🔥 Programa da Tabuada 🎯')

    loop do
      number = load_number('Digite um número inteiro para ver sua tabuada (negativo para sair): ')
      puts '-' * 70
      break if number.negative?

      (1..10).each do |i|
        puts "#{number} * #{i.to_s.rjust(2)} = #{(number * i).to_s.rjust(3)}".colorize(:cyan)
      end
      puts '-' * 70
    end

    show_message('✅ Programa da Tabuada Encerrado! Volte sempre! 🌈', :green)
  end
end

MultiplicationTable.run
