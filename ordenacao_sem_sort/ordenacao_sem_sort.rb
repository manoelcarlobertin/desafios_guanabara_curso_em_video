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
      print "Digite o valor para a posição #{indice + 1}ª: "
      entrada = gets.chomp
      return entrada.to_i if Validacoes.valor_numerico(entrada)

      puts "Erro: Entrada inválida! Digite um número inteiro."
      puts "=" * 50
    end
  end

  def inserir_na_posicao_correta(valor)
    if @lista.empty?
      @lista << valor
    else
      indice = encontrar_indice_correto(valor)
      @lista.insert(indice, valor)
    end
  end

  def encontrar_indice_correto(valor)
    @lista.each_with_index do |elemento, indice|
      return indice if valor < elemento
    end
    @lista.length # Se o valor for maior que todos, insere no final
  end
end

# Inicialização do programa
ListaOrdenada.new.executar