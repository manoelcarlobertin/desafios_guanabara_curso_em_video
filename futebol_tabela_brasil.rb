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
    emoji = ["😊", "🎉", "🔥", "🏆", "⚽"].sample
    puts "#{cores[cor]}#{titulo.center(50, '=')}#{cores[:reset]}"
    puts "#{emoji} #{texto} #{emoji}"
    puts "#{cores[cor]}#{'=' * 50}#{cores[:reset]}"
  end
end

# Classe para validações
class Validacoes
  def self.valor_inteiro_positivo(valor)
    valor.to_i.positive? && valor.match?(/^\d+$/)
  end

  def self.corrigir_valor
    Mensagens.mensagem("Correção", "Digite um valor válido!", :vermelho)
    gets.chomp
  end
end

# Classe principal do programa
class Brasileirao
  TIMES = [
    "Flamengo", "Santos", "Palmeiras", "Gremio",
    "Atletico Paranaense", "São Paulo", "Internacional",
    "Corinthians", "Fortaleza", "Goias", "Bahia", "Vasco",
    "Atletico Mineiro", "Fluminense", "Botafogo", "Ceará",
    "Cruzeiro", "CSA", "Chapecoense", "Avaí"
  ].freeze

  def initialize
    @opcao = 0
  end

  def executar
    loop do
      exibir_menu
      @opcao = obter_opcao
      break if @opcao == 8

      processar_opcao(@opcao)
    end
    Mensagens.mensagem("Fim", "Obrigado por usar o programa do Brasileirão! 😊", :verde)
  end

  private

  def exibir_menu
    Mensagens.mensagem("DADOS DO BRASILEIRÃO 2024", "Escolha uma opção:", :azul)
    puts <<~MENU
      [1] O Campeão do campeonato
      [2] Classificados para fase de grupos da Libertadores
      [3] Classificados para Pré - Libertadores
      [4] Classificados para fase de grupos da Copa Sul-Americana
      [5] Rebaixados para série B
      [6] Posição e situação de determinado time
      [7] Tabela completa
      [8] Sair do programa do brasileirão
    MENU
  end

  def obter_opcao
    loop do
      print "Digite: "
      opcao = gets.chomp
      return opcao.to_i if Validacoes.valor_inteiro_positivo(opcao) && (1..8).cover?(opcao.to_i)

      Mensagens.mensagem("Erro", "Opção inválida! Tente novamente.", :vermelho)
    end
  end

  def processar_opcao(opcao)
    case opcao
    when 1 then campeao
    when 2 then libertadores
    when 3 then pre_libertadores
    when 4 then sul_americana
    when 5 then rebaixados
    when 6 then posicao_time
    when 7 then tabela_completa
    end
  end

  def campeao
    Mensagens.mensagem("Campeão", "O campeão foi o #{TIMES[0]} 🏆", :verde)
  end

  def libertadores
    Mensagens.mensagem("Libertadores", "Classificados: #{TIMES[0..5].join(', ')} 🌍", :amarelo)
  end

  def pre_libertadores
    Mensagens.mensagem("Pré-Libertadores", "Classificados: #{TIMES[6..7].join(', ')} 🌎", :amarelo)
  end

  def sul_americana
    Mensagens.mensagem("Sul-Americana", "Classificados: #{TIMES[8..13].join(', ')} 🏟️", :amarelo)
  end

  def rebaixados
    Mensagens.mensagem("Rebaixados", "Rebaixados: #{TIMES[-4..].join(', ')} 😢", :vermelho)
  end

  def posicao_time
    print "Escreva o nome do seu time: "
    time = gets.chomp.strip.capitalize
    if TIMES.include?(time)
      posicao = TIMES.index(time) + 1
      situacao = situacao_time(posicao)
      Mensagens.mensagem("Posição", "O #{time} ficou na #{posicao}º posição. #{situacao}", :azul)
    else
      Mensagens.mensagem("Erro", "O #{time} não participou do Brasileirão 2023.", :vermelho)
    end
  end

  def situacao_time(posicao)
    case posicao
    when 1 then "Campeão brasileiro e está na Libertadores 🏆🌍"
    when 2..6 then "Está na Libertadores 🌍"
    when 7..8 then "Está na Pré-Libertadores 🌎"
    when 9..14 then "Está na Copa Sul-Americana 🏟️"
    when 17..20 then "Está Rebaixado para a Série B 😢"
    else "Ficou na Série A, porém não se classificou para nenhuma outra competição."
    end
  end

  def tabela_completa
    Mensagens.mensagem("TABELA DO BRASILEIRÃO 2024", "Confira a tabela completa:", :azul)
    TIMES.each_with_index do |time, index|
      puts "#{index + 1}º #{time}"
    end
  end
end

# Inicialização do programa
Brasileirao.new.executar