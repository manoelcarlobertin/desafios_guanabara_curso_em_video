require 'colorize'
require 'tty-spinner'
require 'i18n'

module Utils
  I18n.load_path = Dir['./locales/*.yml']
  I18n.default_locale = :pt

  def self.show_message(key, color = :cyan, params = {})
    mensagem = I18n.t(key, **params) # Interpolando hash corretamente.
    puts mensagem.colorize(color)
    sleep(0.3)
  end

  def self.spinner(text)
    spinner = TTY::Spinner.new("🌟 #{text} [:spinner]", format: :pulse_2)
    spinner.auto_spin
    sleep(1)
    spinner.success("✅")
  end

  def self.change_language(language)
      I18n.locale = language.to_sym
      show_message('welcome', :magenta)
  end
end
