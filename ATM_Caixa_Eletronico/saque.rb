require_relative 'utils'
require_relative 'database'
require 'tty-prompt'

class Saque
  CEDULAS = [200, 100, 50, 20, 10].freeze

  def initialize
    @prompt = TTY::Prompt.new
    @valor = 0
    @resultado = {}
  end

  def iniciar
    loop do
      solicitar_valor
      calcular_notas
      exibir_resumo
      Database.save(@valor)
      break unless continuar?

      Utils.spinner('Preparando novo saque...')
    end
  end

  private

  def solicitar_valor
    @valor = @prompt.ask('💰 Quanto deseja sacar?', convert: :int) do |q|
      q.validate(/\A[1-9]\d*\z/, '❌ Apenas números inteiros * Positivos * são permitidos!')
      q.convert(:int)
      q.modify(:strip)
    end
  rescue TTY::Prompt::ConversionError
    Utils.show_message('❌ Valor inválido! Tente novamente.', :red)
    retry
  end

  def calcular_notas
    Utils.spinner('Calculando notas...')
    restante = @valor
    CEDULAS.each do |cedula|
      quantidade = restante / cedula
      restante %= cedula
      @resultado[cedula] = quantidade if quantidade.positive?
    end
  end

  def exibir_resumo
    Utils.show_message("\n🤑 Resumo do Saque:", :green)
    puts '=' * 40
    @resultado.each do |nota, quantidade|
      puts "💵 #{quantidade} nota(s) de #{Utils.format_currency(nota)}".colorize(:yellow)
    end
    puts '=' * 40
    puts "Valor Total: #{Utils.format_currency(@valor)}".colorize(:cyan)
    puts "Data e Hora: #{Time.now.strftime('%d/%m/%Y %H:%M:%S')}".colorize(:light_blue)
    Utils.show_message("\n🎯 Obrigado por utilizar nosso caixa eletrônico! Volte sempre!", :green)
  end

  def continuar?
    @prompt.yes?('Deseja realizar outro saque?')
  end
end
