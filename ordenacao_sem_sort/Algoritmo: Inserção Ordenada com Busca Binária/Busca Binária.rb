Explicação:

A Busca Binária é um algoritmo eficiente para encontrar a posição de inserção de um elemento

em uma lista já ordenada. Em vez de percorrer a lista linearmente (o que leva tempo O(n)),

a busca binária divide a lista ao meio repetidamente, reduzindo o espaço de busca pela metade a cada iteração.

Isso resulta em uma complexidade de O(log n) para encontrar a posição correta.

Depois de encontrar a posição, o elemento é inserido usando o método insert do array,

que tem complexidade O(n) no pior caso (devido ao deslocamento dos elementos).

No entanto, a busca binária ainda melhora significativamente o desempenho geral.

Referências:
- https://www.geeksforgeeks.org/binary-search/

Aqui está o algoritmo atualizado usando busca binária para encontrar a posição de inserção:

# frozen_string_literal: true

# Classe para validações
class Validacoes
  def self.valor_numerico(valor)
    valor.match?(/^-?\d+$/) # Aceita números positivos e negativos
  end
end

# Classe principal do programa
class ListaOrdenada
  def initialize
    @lista = []
  end

  def executar
    puts "=" * 50
    puts "Bem-vindo! Vamos criar uma lista ordenada.".center(50)
    puts "=" * 50

    5.times do |i|
      valor = obter_valor_valido(i)
      inserir_na_posicao_correta(valor)
      puts "Lista atual: #{@lista.join(', ')}"
      puts "=" * 50
    end

    puts "Resultado final: Lista ordenada: #{@lista.join(', ')}"
    puts "=" * 50
  end

  private

  def obter_valor_valido(indice)
    loop do
      print "Digite o valor para a posição #{indice + 1}: "
      entrada = gets.chomp
      return entrada.to_i if Validacoes.valor_numerico(entrada)

      puts "Erro: Entrada inválida! Digite um número inteiro."
      puts "=" * 50
    end
  end

  def inserir_na_posicao_correta(valor)
    indice = busca_binaria(valor)
    @lista.insert(indice, valor)
  end

  def busca_binaria(valor)
    esquerda = 0
    direita = @lista.length - 1

    while esquerda <= direita
      meio = (esquerda + direita) / 2
      if @lista[meio] < valor
        esquerda = meio + 1
      else
        direita = meio - 1
      end
    end

    esquerda
  end
end

# Inicialização do programa
ListaOrdenada.new.executar


# Explicação Método busca_binaria desse algorítmo:

def busca_binaria(valor)
  esquerda = 0
  direita = @lista.length - 1

  while esquerda <= direita
    meio = (esquerda + direita) / 2
    if @lista[meio] < valor
      esquerda = meio + 1
    else
      direita = meio - 1
    end
  end

  esquerda
end

1. Define dois ponteiros: esquerda (início da lista) e direita (fim da lista).

2. Enquanto esquerda <= direita, calcula o índice do meio (meio).

3. Compara o valor no índice meio com o valor a ser inserido:

    Se @lista[meio] < valor, o valor deve ser inserido à direita do meio.

    Caso contrário, o valor deve ser inserido à esquerda do meio.

4. Atualiza os ponteiros esquerda ou direita com base na comparação.

5. Quando o loop termina, esquerda contém a posição correta para inserção.

6. Quando usar: Se a lista for muito grande, a busca binária oferece

  uma melhoria significativa no desempenho em comparação com a busca linear.

--------------------------------------------------------------------------------------------------------------