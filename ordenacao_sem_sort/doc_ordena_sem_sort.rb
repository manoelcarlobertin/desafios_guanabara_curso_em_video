
Método abaixo inserir_na_posicao_correta:

def inserir_na_posicao_correta(valor)
  if @lista.empty?
    @lista << valor
  else
    indice = encontrar_indice_correto(valor)
    @lista.insert(indice, valor)
  end
end

Como ele funciona?

1. Se a lista estiver vazia (@lista.empty?), ele simplesmente adiciona o valor ao final da lista:

  (@lista << valor)

2. Caso contrário, ele chama o método encontrar_indice_correto e determina a posição onde o valor deve ser inserido.

3. Depois, ele usa o método insert para adicionar o valor na posição correta.

=================================================================================================================

Esse método é uma ótima introdução para conceitos como:

Validação de entrada, Manipulação de arrays e Lógica de ordenação sem usar métodos prontos.

    def encontrar_indice_correto(valor)
      @lista.each_with_index do |elemento, indice|
        return indice if valor < elemento
      end
      @lista.length # Se o valor for maior que todos, insere no final
    end

1. Esse método percorre a lista para encontrar a posição correta onde o valor deve ser inserido.

2. Ele usa o método each_with_index para percorrer a lista e comparar o valor com cada elemento.

3. Se o valor for menor que o elemento atual, ele retorna o índice desse elemento.

4. Se o valor for maior que todos os elementos da lista,

ele retorna o comprimento da lista (@lista.length), o que significa que o valor será inserido no final.