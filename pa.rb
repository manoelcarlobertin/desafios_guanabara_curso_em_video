require 'colorize'

# Função para gerar emojis aleatórios.
def random_emoji
  ['🔥', '🚀', '🎯', '💪', '🤓'].sample
end

# Função para exibir cabeçalho.
def header(text)
  puts '=' * 46
  puts text.center(46).colorize(:magenta).bold
  puts '=' * 46
end

# Função para exibir mensagens coloridas.
def show_message(message, color)
  puts message.colorize(color)
  sleep(0.5)
end

# Função para solicitar números com validação.
def load_number(prompt)
  loop do
    print prompt.colorize(:green)
    input = gets.chomp
    return input.to_f if input.match?(/^[-+]?\d*\.?\d+$/)

    show_message('Invalid input! Please enter a valid * number *.', :red)
  end
end

# Função para gerar Progressão Aritmética.
def arithmetic_progression(first_term, reason)
  progression = first_term
  10.times do |i|
    print "#{progression} ".colorize(:yellow)
    print '→ '.colorize(:blue) unless i == 9
    progression += reason
    sleep(0.3)
  end
  show_message("→ FIM #{random_emoji}", :cyan)
end

# Início do Programa
header("ARITHMETIC PROGRESSION #{random_emoji}")

first_term = load_number('Digite o Primeiro Termo da PA: ')
reason = load_number('Digite a Razão da PA: ')

arithmetic_progression(first_term, reason)
