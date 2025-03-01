require 'colorize'

module PA
  def self.random_emoji
    ['🔥', '🚀', '🎯', '💪', '🤓'].sample
  end

  def self.header(text)
    puts '-=' * 20
    puts text.center(50).colorize(:black).bold
    puts '-=' * 20
  end

  def self.show_message(message, color)
    puts message.colorize(color)
    sleep(0.5)
  end

  def self.load_number(prompt)
    loop do
      print prompt.colorize(:magenta)
      input = gets.chomp
      return input.to_i if input.match?(/^[-+]?\d+$/)

      show_message('Invalid input! Please enter a valid number.', :red)
    end
  end

  def self.print_term(term, is_last)
    print "#{term} ".colorize(:yellow)
    print '-> '.colorize(:blue) unless is_last
    sleep(0.3)
  end

  def self.generate_terms(terms, reason, count)
    terms_displayed = terms.size
    (1..count).each do |_|
      print_term(terms.last, false)
      terms << terms.last + reason
      terms_displayed += 1
    end
    puts 'PAUSA'.colorize(:cyan)
    sleep(0.5)
  end

  def self.find_term(term_number, terms)
    if term_number <= terms.size
      show_message("The term a#{term_number} = #{terms[term_number - 1]}", :cyan)
    else
      show_message('Term not found within the displayed range.', :red)
    end
  end

  def self.arithmetic_progression
    header("ARITHMETIC PROGRESSION #{random_emoji}")
    first_term = load_number('Enter the First Term: ')
    reason = load_number('Enter the Reason: ')
    terms = [first_term]

    generate_terms(terms, reason, 10)
    loop do
      puts "\n1. +10 Terms\n2. +X Terms\n3. Change Terms\n4. Find Term\n5. Clear Terms\n0. Exit".colorize(:yellow)
      option = load_number('Choose an option: ')

      case option
      when 1
        generate_terms(terms, reason, 10)
      when 2
        more_terms = load_number('How many more terms would you like to see? ')
        generate_terms(terms, reason, more_terms)
      when 3
        first_term = load_number('Enter the First Term: ')
        reason = load_number('Enter the Reason: ')
        terms = [first_term]
        generate_terms(terms, reason, 10)
      when 4
        term_number = load_number('Which term would you like to find? ')
        find_term(term_number, terms)
      when 5
        terms = [first_term]
        generate_terms(terms, reason, 10)
      when 0
        break
      else
        show_message('Invalid option. Try again!', :red)
      end
    end

    show_message("END OF PROGRAM. A total of #{terms.size - 1} Terms were shown", :red)
  end
end

PA.arithmetic_progression
