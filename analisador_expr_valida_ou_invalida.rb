# Função para verificar se os parênteses estão balanceados.
def parenteses_balanceados?(expressao)
  # Inicializa uma pilha vazia (usaremos um array para simular a pilha)
  pilha = []

  # Itera sobre cada caractere da expressão
  expressao.each_char do |caractere|
    if caractere == '('
      # Se encontrar um parêntese aberto, adiciona à pilha
      pilha.push(caractere)
    elsif caractere == ')'
      # Se encontrar um parêntese fechado, verifica se a pilha está vazia
      if pilha.empty?
        # Se a pilha estiver vazia, significa que não há um parêntese aberto correspondente
        return false
      else
        # Remove o último parêntese aberto da pilha (pois encontramos seu correspondente fechado)
        pilha.pop
      end
    end
  end

  # No final, se a pilha estiver vazia, todos os parênteses foram balanceados
  pilha.empty?
end

# Função principal
def main
  # Solicita que o usuário digite uma expressão
  print "Digite uma expressão para verificar os parênteses: "
  expressao = gets.chomp

  # Verifica se os parênteses estão balanceados
  if parenteses_balanceados?(expressao)
    puts "Os parênteses estão \033[32mbalanceados\033[m!"
  else
    puts "Os parênteses estão \033[31mdesbalanceados\033[m!"
  end
end

# Executa o programa
main