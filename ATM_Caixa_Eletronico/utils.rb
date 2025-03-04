require 'colorize'
require 'tty-spinner'

module Utils
  def self.show_message(text, color = :cyan)
    puts text.colorize(color)
    sleep(0.3)
  end

  def self.format_currency(value)
    "R$#{'%.2f' % value}".gsub('.', ',')
  end

  def self.spinner(text)
    spinner = TTY::Spinner.new("🌟 #{text} [:spinner]", format: :pulse_2)
    spinner.auto_spin
    sleep(1)
    spinner.success("✅")
  end
end
