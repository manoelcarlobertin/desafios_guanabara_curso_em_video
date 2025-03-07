require 'colorize'
require 'faker'

class StudentReport
  def initialize
    @students = []
    @student_count = rand(1..40)
  end

  # Gera os estudantes com notas aleatórias
  def generate_students
    @student_count.times do
      name = Faker::Name.first_name
      # geram 2 notas aleatórias abaixo:
      grades = [rand(3.0..10.0).round(2), rand(3.0..10.0).round(2)]
      @students << { name: name, grades: grades, average: calculate_average(grades) }
    end
    @students.sort_by! { |student| student[:name] } # ordem alfabética do aluno.
  end

  # Calcula a média das notas
  def calculate_average(grades)
    (grades.sum / grades.size).round(2)
  end

  # Situação de cada estudante na listagem alfabética.
  def student_status(average)
    if average >= 7
      'Aprovado(a)'.colorize(:green)
    elsif average >= 5
      'Reforço'.colorize(:yellow)
    else
      'Reprovado(a)'.colorize(:red)
    end
  end

  # Exibe os estudantes cadastrados
  def display_students
    puts '\n📄 Listagem dos Estudantes Cadastrados na Turma:'.colorize(:magenta).bold
    puts '-' * 50
    puts "No. Nome             Notas               Média   Situação"

    @students.each_with_index do |student, index|
      spacing = index < 9 ? ' ' : ''
      average = student[:average]
      situation = student_status(average)
      puts "#{spacing}#{index + 1}. #{student[:name].ljust(15)} 📝 #{student[:grades].join(', ')} #{average.to_s.ljust(7)} #{situation}"
      # puts "#{index + 1}. #{spacing} #{student[:name].ljust(15)} 📝 Notas: #{student[:grades].join(', ')}"
    end
    puts '-' * 50
  end

  def show_highest_and_lowest_average
    highest = @students.max_by { |student| student[:average] }
    lowest = @students.min_by { |student| student[:average] }

    puts '📊 Resumo das Médias'.colorize(:blue).bold
    puts "🏆 Maior média geral: #{highest[:name]} com média #{highest[:average]}".colorize(:green)
    puts "💔 Precisa melhorar: #{lowest[:name]} com média #{lowest[:average]}".colorize(:red)
    puts '-' * 50
  end

  # Permite mostrar notas individuais
  def show_individual_grades
    loop do
      print '🔍 Mostrar notas de qual aluno(a)? (Número ou 999 para * sair *): '.colorize(:yellow)
      input = gets.chomp.to_i
      break if input == 999

      if input.between?(1, @students.size)
        student = @students[input - 1]
        puts "📝 As 2 notas de #{student[:name]} são: #{student[:grades].join(', ')}".colorize(:cyan)
      else
        puts '🤓 Aluno(a) * não * encontrado(a)!'.colorize(:red)
      end
    end
  end

  # Principal
  def start
    puts "⏰ Gerando Lista de Estudantes...".colorize(:cyan)
    sleep(0.5)
    generate_students
    sleep(0.5)
    display_students
    sleep(0.5)
    show_highest_and_lowest_average
    sleep(0.5)
    show_individual_grades
    sleep(0.5)
    farewell_message
  end

  # Mensagem de despedida
  def farewell_message
    puts '🎯 FINALIZADO...'.colorize(:green)
    sleep(0.5)
    puts '<<< VOLTE SEMPRE >>>'.colorize(:yellow)
  end
end

report = StudentReport.new
report.start
