require 'colorize'

module NumberSum
  EMOJIS = ['🔥', '🚀', '🎯', '💪', '🤓'].freeze

  def self.random_emoji
    EMOJIS.sample
  end

  def self.header(text)
    puts '=' * 46
    puts text.center(46).colorize(:magenta).bold
    puts '=' * 46
  end

  def self.show_message(message, color)
    puts message.colorize(color)
    sleep(0.5)
  end

  def self.load_number(prompt)
    loop do
      print prompt.colorize(:green)
      input = gets.chomp
      return input.to_i if input.match?(/^[-+]?\d+$/)

      show_message('❌ Invalid input! Please enter a * integer number *.', :red)
    end
  end

  def self.run
    header("🎯 Let's Play with Numbers #{random_emoji}")
    count = 0
    sum = 0

    loop do
      number = load_number("💪 Enter a number (🎨type ' 999 ' to turn off): ")
      break if number == 999

      count += 1
      sum += number
      show_message("✅ Number #{number} added!", :yellow)
    end

    show_message("🚀 You entered #{count} numbers.", :cyan)
    show_message("🔥 The sum of all numbers is #{sum}.", :green)
    show_message(' Thank you for playing!😊',:magenta)
  end
end

NumberSum.run
