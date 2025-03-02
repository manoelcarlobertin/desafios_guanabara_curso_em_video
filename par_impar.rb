require 'colorize'
require 'io/console'

module ParOuImpar
  def self.header(text)
    puts '-=' * 30
    puts text.center(60).colorize(:magenta).bold
    puts '-=' * 30
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

      show_message('Entrada inválida! Digite um número inteiro.', :red)
    end
  end

  def self.load_choice(prompt)
    loop do
      print prompt.colorize(:yellow)
      input = gets.chomp.strip.upcase
      return input if %w[P I S].include?(input)

      show_message('Escolha inválida! Digite P para PAR, I para IMPAR ou S para SAIR.', :red)
    end
  end

  def self.play_round(player_number, computer_number, choice)
    total = player_number + computer_number
    result = total.even? ? 'PAR' : 'IMPAR'

    puts "Você escolheu #{player_number} e o Computador #{computer_number}, Total de #{total}".colorize(:cyan)
    puts result.colorize(:yellow)
    puts '-=' * 30

    (result == 'PAR' && choice == 'P') || (result == 'IMPAR' && choice == 'I')
  end

  def self.run
    header('🎯 Vamos jogar PAR ou IMPAR ???')
    @victory_number = 0
    @lost_number = 0

    loop do
      player_number = load_number('Digite um valor: ')
      computer_number = rand(0..11)
      choice = load_choice('Escolha PAR ou ÍMPAR [P/I/S] ou para Sair: ')

      break if choice == 'S'

      if play_round(player_number, computer_number, choice)
        show_message('🔥 Você venceu! 🔥', :green)
        @victory_number += 1
      else
        show_message('💀 Você perdeu!... Tente na próxima vez!', :red)
        @lost_number += 1
      end
    end

    show_message("🏆 Você ganhou #{@victory_number} vez(es)!", :blue)
    show_message("O computador te venceu #{@lost_number} vez(es)! 👎", :red)
    show_message('* Game Over *', :cyan)
  end
end

ParOuImpar.run
