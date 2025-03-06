# Conceito de Pilha

# Uma pilha é uma estrutura de dados que segue o princípio LIFO (Last In, First Out),

# ou seja, o último elemento a ser inserido é o primeiro a ser removido.

# Neste * 1º problema *, a pilha é usada para rastrear os parênteses abertos.

# Quando um parêntese fechado é encontrado, verificamos se ele corresponde

# ao último parêntese aberto (que está no topo da pilha).


# Embora tenhamos usado um array para simular a pilha,
# poderíamos criar uma classe Pilha para encapsular as operações push e pop. Como abaixo:

#----------------------------------------------------------------------------------------------------
# class Pilha:
#   def __init__(self):
#       self.stack = []
#       # Nossa pilha é uma lista vazia.
#   end

#   def push(self, item):
#       self.stack.append(item)
#       # A função push adiciona um item ao topo da pilha.
#   end

#   def pop(self):
#       if self.is_empty():
#           return None
#           # Em vez de retornar um valor padrão,
#           # podemos lançar uma exceção quando a pilha está vazia.
#           raise Exception("Pilha vazia!")

#       return self.stack.pop()
#   end

#   def is_empty(self):
#       return len(self.stack) == 0
#   end
# end

#----------------------------------------------------------------------------------------------------


# O código, logo abaixo, foi modularizado, com suporte para {}, [] e (),

# saídas amigáveis com emojis, tratamento de erros e uma interface clara para o usuário.

# Cada parte do código foi dividida em métodos * pequenos e reutilizáveis *

# para facilitar a manutenção e a localização de bugs.

# INICIO DO CODIGO

# frozen_string_literal: true

# Módulo para mensagens amigáveis
module Mensagens
  def self.mensagem(titulo, texto, cor = :azul)
    cores = {
      azul: "\e[34m",
      verde: "\e[32m",
      vermelho: "\e[31m",
      amarelo: "\e[33m",
      reset: "\e[0m"
    }
    emoji = ["🔍", "📝"].sample
    puts "#{cores[cor]}#{titulo.center(100, '=')}#{cores[:reset]}"
    puts "#{emoji} #{texto} #{emoji}"
    puts "#{cores[cor]}#{'=' * 100}#{cores[:reset]}"
  end
end

# Módulo para validação de: parênteses(), colchetes[] e chaves{}.
module ValidacaoParenteses
  PARES = { ')' => '(', '}' => '{', ']' => '[' }.freeze # Hash

  def self.balanceados?(expressao)
    pilha = [] # Array
    expressao.each_char do |caractere|
      if PARES.values.include?(caractere)
        # Se for um caractere de abertura, adiciona à pilha
        pilha.push(caractere)
      elsif PARES.keys.include?(caractere)
        # Se for um caractere de fechamento, verifica se corresponde ao último aberto
        if pilha.empty? || pilha.last != PARES[caractere]
          return false, pilha
        else
          pilha.pop
        end
      end
    end
    # No final, se a pilha estiver vazia, todos os caracteres foram balanceados
    [pilha.empty?, pilha]
  end

  def self.corrigir_expressao(expressao, pilha)
    expressao_corrigida = expressao.dup
    # Adiciona os caracteres de fechamento que faltam
    pilha.reverse.each do |caractere|
      case caractere
      when '(' then expressao_corrigida += ')'
      when '{' then expressao_corrigida += '}'
      when '[' then expressao_corrigida += ']'
      end
    end
    expressao_corrigida
  end
end

# Função principal
def main
  Mensagens.mensagem("Bem-vindo!", "Vamos verificar se os parênteses, colchetes e chaves estão balanceados!", :azul)
  puts "Exemplo de expressão válida: (a + b) * {c - [d + e]}. ✅"
  puts "Exemplo de expressão inválida: (a + b) * {c - [d + e}, pois faltou fechar o colchetes. ❌"
  puts "=" * 100

  loop do
    print "Digite uma expressão (ou 'sair' para encerrar): "
    expressao = gets.chomp

    if expressao.downcase == "sair"
      Mensagens.mensagem("Encerrando!", "Obrigado por usar o verificador de balanceamento! 👋", :amarelo)
      break
    end

    if expressao.empty?
      Mensagens.mensagem("Error", "Por favor, digite uma expressão válida.", :vermelho)
      next
    end

    balanceada, pilha = ValidacaoParenteses.balanceados?(expressao)

    if balanceada
      Mensagens.mensagem("Resultado", "A expressão está \033[32m * balanceada * \033[m! 🎉", :verde)
    else
      Mensagens.mensagem("Resultado", "A expressão está \033[31m * desbalanceada * \033[m! ❌", :vermelho)

    # Mostra o que faltou para balancear
      if pilha.any?
        puts "Faltou fechar: #{pilha.reverse.map { |c| ValidacaoParenteses::PARES.key(c) }.join(', ')}"
      else
        puts "Há parênteses, colchetes ou chaves fechados sem abertura correspondente."
      end

      # Corrige a expressão e exibe
      expressao_corrigida = ValidacaoParenteses.corrigir_expressao(expressao, pilha)
      puts "Expressão corrigida: \033[33m#{expressao_corrigida}\033[m"
    end
  end
end

# Executa o programa
main