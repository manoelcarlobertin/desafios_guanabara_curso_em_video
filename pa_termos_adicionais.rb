require 'colorize'

# Função para gerar emojis aleatórios
def random_emoji
  ['🔥', '🚀', '🎯', '💪', '🤓'].sample
end

# Função para exibir cabeçalho
def header(text)
  puts '=' * 46
  puts text.center(46).colorize(:magenta).bold
  puts '=' * 46
end

# Função para exibir mensagens coloridas
def show_message(message, color)
  puts message.colorize(color)
  sleep(0.5)
end

# Função para solicitar números com validação
def load_number(prompt)
  loop do
    print prompt.colorize(:green)
    input = gets.chomp
    return input.to_i if input.match?(/^[-+]?\d+(\.\d+)?$/)

    show_message('Invalid input! Please enter a valid number.', :red)
  end
end

# Função para gerar Progressão Aritmética com termos adicionais
def arithmetic_progression(first_term, reason)
  counter_total = 0
  loop do
    counter = 1
    terms = 10
    while counter <= terms
      print "#{first_term} ".colorize(:yellow)
      print '⮕ '.colorize(:blue) unless counter == terms
      first_term += reason
      counter += 1
      counter_total += 1
      sleep(0.3)
    end
    show_message("→ FIM #{random_emoji}", :cyan)

    print "\nHow many more terms would you like to see? ".colorize(:light_yellow)
    terms = load_number("")
    break if terms <= 0
  end

  show_message("Finished! Printed #{counter_total} numbers in the PA! #{random_emoji}", :green)
end

# Início do Programa
header("ARITHMETIC PROGRESSION #{random_emoji}")
first_term = load_number('Enter the First Term of the PA: ')
reason = load_number('Enter the Reason of the PA: ')
arithmetic_progression(first_term, reason)
