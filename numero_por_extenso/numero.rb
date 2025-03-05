require 'tty-prompt'
require_relative 'utils'
require_relative 'database'

class Numero # 0 a 20
  NUMEROS_EXTENSO = {
  pt: %w[zero um dois três quatro cinco seis sete oito nove dez onze doze treze quatorze quinze dezesseis dezessete dezoito dezenove vinte],
  en: %w[zero one two three four five six seven eight nine ten eleven twelve thirteen fourteen fifteen sixteen seventeen eighteen nineteen twenty],
  es: %w[cero uno dos tres cuatro cinco seis siete ocho nueve diez once doce trece catorce quince dieciséis diecisiete dieciocho diecinueve veinte]
}.freeze

  def initialize
    @prompt = TTY::Prompt.new
  end

  def iniciar
    idioma = @prompt.select("🌐 Escolha o idioma:", %w[pt en es])
    Utils.change_language(idioma)

    loop do
      solicitar_numero
      mostrar_extenso
      Database.save(@numero, NUMEROS_EXTENSO[I18n.locale][@numero])

      break unless continuar?
    end
    Utils.show_message('thank_you', :green)
  end

  private

  def solicitar_numero
    @numero = @prompt.ask(I18n.t('ask_number'), convert: :int) do |q|
      q.validate(/\A[0-9]+\z/, I18n.t('only_positive_numbers'))
      q.convert(:int)
      q.modify(:strip)
    end

    raise StandardError, I18n.t('only_positive_numbers') unless (0..20).include?(@numero)
  rescue StandardError => e
    Utils.show_message(e.message, :red)
    retry
  end

  def mostrar_extenso
    Utils.spinner('calculating')
    puts "🎯 * #{NUMEROS_EXTENSO[I18n.locale][@numero]} *.".colorize(:yellow)
  end

  def continuar?
    @prompt.yes?(I18n.t('continue'))
  end
end
