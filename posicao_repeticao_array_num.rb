# frozen_string_literal: true

# Módulo para mensagens coloridas e divertidas
module Mensagens
  def self.mensagem(titulo, texto, cor = :azul)
    cores = {
      azul: "\e[34m",
      verde: "\e[32m",
      vermelho: "\e[31m",
      amarelo: "\e[33m",
      reset: "\e[0m"
    }
    puts "#{cores[cor]} #{titulo.center(50, '=')} #{cores[:reset]}"
    puts "#{texto}"
    puts "#{cores[cor]} #{'=' * 50} #{cores[:reset]}"
  end
end

# Classe para validações
class Validacoes
  def self.valor_inteiro(valor)
    valor.match?(/^-?\d+$/) # Aceita números positivos e negativos
  end

  def self.corrigir_valor
    Mensagens.mensagem("Correção", "Digite um valor válido (número inteiro)!", :vermelho)
    gets.chomp
  end
end

# Classe principal do programa
class Numeros
  def initialize
    @numeros = []
    @posicoes_maior = []
    @posicoes_menor = []
    @maior = nil
    @menor = nil
  end

  def executar
    Mensagens.mensagem("Bem-vindo", "Vamos analisar cinco números logo abaixo!", :azul)
    coletar_numeros
    encontrar_maior_menor
    exibir_resultados
  end

  private

  def coletar_numeros
    5.times do |i|
      numero = obter_numero_valido(i)
      @numeros << numero
      atualizar_maior_menor(numero, i)
    end
  end

  def obter_numero_valido(indice)
    loop do
      print "Digite um número para a posição #{indice + 1}ª : "
      entrada = gets.chomp
      return entrada.to_i if Validacoes.valor_inteiro(entrada)

      Mensagens.mensagem("Error", "Entrada inválida! Digite um número * inteiro * !!!", :vermelho)
    end
  end

  def atualizar_maior_menor(numero, indice)
    if @maior.nil? || numero > @maior
      @maior = numero
      @posicoes_maior = [indice + 1]
    elsif numero == @maior
      @posicoes_maior << indice + 1
    end

    if @menor.nil? || numero < @menor
      @menor = numero
      @posicoes_menor = [indice + 1]
    elsif numero == @menor
      @posicoes_menor << indice +1
    end
  end

  def encontrar_maior_menor
    # Já foi feito durante a coleta dos números
  end

  def exibir_resultados
    Mensagens.mensagem("Resultados", "Análise dos números digitados:", :verde)
    puts "5 números digitados: #{@numeros.join(', ')}."
    puts "O MAIOR número foi * #{@maior} *, na(s) posição(ões): #{@posicoes_maior.join(', ')}ª."
    puts "O menor número foi * #{@menor} *, na(s) posição(ões): #{@posicoes_menor.join(', ')}ª."
  end
end

# Inicialização do programa
Numeros.new.executar