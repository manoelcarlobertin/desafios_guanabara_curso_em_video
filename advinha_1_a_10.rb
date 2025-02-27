require 'colorize' # Para instalar: gem install colorize
require 'io/console'

# Emojis aleatórios
EMOJIS = ['🔥', '🎯', '💪', '😎', '🎲', '🎉', '😂', '🥳'].freeze

# Função para gerar dica de acordo com o modo de jogo
def give_hint(mode, target, guess)
  if mode == 1
    puts target > guess ? "Hint: It's a bigger number! 🔼".cyan : "Hint: It's a smaller number! 🔽".cyan
  elsif mode == 2
    puts target.even? ? "Hint: It's an even number! ✌️".cyan : "Hint: It's an odd number! 🧠".cyan
  end
end

# Função para exibir cabeçalho
def header(text)
  puts "#{'=' * 30} #{text} #{'=' * 30}".red.bold
end

# Função principal do jogo
def play_game(mode)
  target = rand(0..10)
  attempts = 0

  puts "I'm thinking of a number between 0 and 10... Can you guess it? 🎯".blue

  loop do
    print "Your guess: ".yellow
    guess = gets.chomp.to_i
    attempts += 1
    puts "Processing...".red
    sleep(1)

    if guess == target
      emoji = EMOJIS.sample
      message = attempts == 1 ? "Wow! First try! You're a genius! #{emoji}" : "Congratulations! You got it in #{attempts} attempts! #{emoji}"
      puts message.green.bold
      break
    else
      puts "Oops! Wrong guess! 😂".light_red
      give_hint(mode, target, guess) if mode != 3
    end
  end
end

# Menu Inicial
def main_menu
  header("Guessing Game")
  loop do
    puts "Choose Game Mode: 🔥"
    puts "[1] Easy (Hints: Bigger/Smaller)"
    puts "[2] Normal (Hints: Even/Odd)"
    puts "[3] Hard (No Hints)"
    print "-> ".magenta
    mode = gets.chomp.to_i
    next unless (1..3).include?(mode)

    play_game(mode)

    puts "Do you want to play again? (Y/N)".yellow
    answer = gets.chomp.strip.upcase
    break unless answer == 'Y'
  end
  puts "Thanks for playing! 🚀 Goodbye!".cyan
end

main_menu
