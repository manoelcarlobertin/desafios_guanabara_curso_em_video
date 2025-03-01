require 'colorize'
require 'io/console'
require 'time'

module AlarmClock
  def self.header(text)
    puts '=' * 46
    puts text.center(46).colorize(:magenta).bold
    puts '=' * 46
  end

  def self.show_message(message, color)
    puts message.colorize(color)
    sleep(0.5)
  end

  def self.load_number(prompt, range = nil)
    loop do
      print prompt.colorize(:green)
      input = gets.chomp
      number = input.to_i
      return number if input.match?(/^\d+$/) && (range.nil? || range.include?(number))

      show_message('Invalid input! Please enter a * positive * number.', :red)
    end
  end

  def self.run
    header('🎯 Alarm Clock Program ⏰')

    current_time = Time.now
    hour = current_time.hour % 12
    hour = 12 if hour.zero?
    min = current_time.min
    sec = current_time.sec

    show_message("Current Time: #{hour}h:#{min}min:#{sec}s", :cyan)

    alarm_hour = load_number('Set Alarm Hour (12h format): ', 1..12)
    alarm_min = load_number('Set Alarm Minute: ', 0..59)
    alarm_triggered = false

    show_message("🎶 Alarm is set for #{alarm_hour}h:#{alarm_min}min", :yellow)

    until alarm_triggered
      system('clear')
      current_time = Time.now
      hour = current_time.hour % 12
      hour = 12 if hour.zero?
      min = current_time.min
      sec = current_time.sec

      puts "Current Time: #{hour}h : #{min}min : #{sec}s".colorize(:cyan)
      sleep(1)

      if hour == alarm_hour && min == alarm_min
        show_message('🔥 ALARM!!!! 🔥', :red)
        alarm_triggered = true
      end
    end

    show_message('⏰ Alarm Clock Stopped. Have a great day! 🌞', :green)
  end
end

AlarmClock.run
