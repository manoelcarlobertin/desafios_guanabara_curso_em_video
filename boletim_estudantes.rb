require 'colorize'
require 'faker'

class StudentGrades
  def initialize
    @students = []
    @student_names = Array.new(rand(1..40)) { Faker::Name.first_name }
    generate_students
    display_students
    show_summary
    show_individual_grades
    farewell_message
  end

  private

  # Gera os alunos com notas aleatórias
  def generate_students
    @student_names.each do |name|
      grades = [rand(3.0..10.0).round(2), rand(3.0..10.0).round(2)]
      @students << { name: name, grades: grades, average: calculate_average(grades) }
    end
    @students.sort_by! { |student| student[:name] }
  end

  # Calcula a média das notas
  def calculate_average(grades)
    (grades.sum / grades.size).round(2)
  end

  # Exibe os alunos cadastrados
  def display_students
    puts '🎓 Alunos Cadastrados:'.colorize(:magenta).bold
    @students.each_with_index do |student, index|
      spacing = index < 9 ? ' ' : ''
      puts "#{index + 1}. #{spacing} #{student[:name].ljust(15)} 📝 Notas: #{student[:grades].join(', ')}"
    end
    puts '-' * 50
  end

  # Exibe o resumo com maior e menor média
  def show_summary
    highest = @students.max_by { |student| student[:average] }
    lowest = @students.min_by { |student| student[:average] }

    puts '📊 Resumo das Médias'.colorize(:blue).bold
    puts "🏆 Maior Média: #{highest[:name]} com #{highest[:average]}".colorize(:green)
    puts "🐢 Menor Média: #{lowest[:name]} com #{lowest[:average]}".colorize(:red)
    puts '-' * 50
  end

  # Permite mostrar notas individuais
  def show_individual_grades
    loop do
      print '👨‍🏫 Mostrar notas de qual aluno? (Número ou 999 para sair): '.colorize(:yellow)
      input = gets.chomp.to_i
      break if input == 999

      if input.between?(1, @students.size)
        student = @students[input - 1]
        puts "Notas de #{student[:name]}: #{student[:grades].join(', ')}".colorize(:cyan)
      else
        puts '⚠️ Número inválido!'.colorize(:red)
      end
    end
  end

  # Mensagem de despedida
  def farewell_message
    puts '🎯 FINALIZADO...'.colorize(:green)
    puts '<<< VOLTE SEMPRE >>>'.colorize(:yellow)
  end
end

StudentGrades.new
