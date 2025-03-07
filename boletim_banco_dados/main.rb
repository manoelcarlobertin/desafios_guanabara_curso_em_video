class Integer
  def ordinalize
    case self % 100
    when 11, 12, 13 then "#{self}º"
    else
      case self % 10
      when 1, 2, 3 then "#{self}º"
      else "#{self}º"
      end
    end
  end
end

require 'sqlite3'
require 'faker'
require 'colorize'

class Student
  attr_reader :name, :grade1, :grade2, :average, :status

  def initialize(name, grade1, grade2)
    @name, @grade1, @grade2 = name, grade1, grade2
    @average = calculate_average
    @status = calculate_status
  end

  def calculate_average
    ((@grade1 + @grade2) / 2.0).round(2)
  end

  def calculate_status
    case @average
    when 7..10 then 'Aprovado(a)'.colorize(:green)
    when 5...7 then 'Reforço'.colorize(:yellow)
    else 'Reprovado(a)'.colorize(:red)
    end
  end
end

class Database
  DB_NAME = 'students.db'

  def initialize
    @db = SQLite3::Database.new(DB_NAME)
    create_table
  end

  def create_table
    @db.execute <<-SQL
      CREATE TABLE IF NOT EXISTS students (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        name TEXT,
        grade1 REAL,
        grade2 REAL,
        average REAL,
        status TEXT
      );
    SQL
    puts "✅ Tabela 'students' verificada!".colorize(:green)
  end

  def insert_student(student)
    @db.execute('INSERT INTO students (name, grade1, grade2, average, status) VALUES (?, ?, ?, ?, ?)',
                [student.name, student.grade1, student.grade2, student.average, student.status])
  end

  def list_students
    students = @db.execute('SELECT id, name, average, status FROM students')

    if students.empty?
      puts "📭 Nenhum aluno cadastrado.".colorize(:yellow)
      return
    end

    puts "\n📄 Estudantes Cadastrados".colorize(:blue)
    puts '=' * 60
    students.each_with_index do |(id, name, average, status), index|
      ordinal = (index + 1).ordinalize
      puts "#{ordinal}. #{name.ljust(15)} | Média: #{average} | Situação: #{status}"
    end
    puts '=' * 60
  end

  def find_student_by_id(id)
    @db.get_first_row('SELECT name, grade1, grade2 FROM students WHERE id = ?', id)
  end

  def delete_student_by_id(id)
    student = find_student_by_id(id)
    if student
      puts "⚠️ Tem certeza que deseja apagar o aluno #{student[0]}? (s/n)".colorize(:yellow)
      confirmation = gets.chomp.downcase
      return unless confirmation == 's'

      @db.execute('DELETE FROM students WHERE id = ?', id)
      puts "✅ Aluno #{student[0]} apagado com sucesso!".colorize(:green)
    else
      puts "❌ Aluno não encontrado!".colorize(:red)
    end
  end

  def delete_all_students
    puts "⚠️ Tem certeza que deseja apagar todos os alunos? (s/n)".colorize(:yellow)
    confirmation = gets.chomp.downcase
    return unless confirmation == 's'

    @db.execute('DELETE FROM students')
    puts "✅ Todos os alunos foram apagados!".colorize(:green)
  end

  def generate_random_students(quantity)
    quantity.times do
      student = Student.new(Faker::Name.first_name, rand(3.0..10.0).round(2), rand(3.0..10.0).round(2))
      insert_student(student)
    end
    puts "🎉 #{quantity} alunos gerados com sucesso!".colorize(:green)
  end

  def menu
    loop do
      puts "\n😎 Sistema de Alunos"
      puts "1. Gerar Alunos Aleatórios"
      puts "2. Listar Alunos"
      puts "3. Apagar um Aluno"
      puts "4. Apagar Todos os Alunos"
      puts "5. Sair"
      print "Escolha uma opção: ".colorize(:cyan)
      option = gets.chomp.to_i

      case option
      when 1
        print "Quantos alunos deseja gerar? ".colorize(:cyan)
        generate_random_students(gets.chomp.to_i)
      when 2
        list_students
      when 3
        print "Informe o ID do aluno que deseja apagar: ".colorize(:cyan)
        delete_student_by_id(gets.chomp.to_i)
      when 4
        delete_all_students
      when 5
        puts "👋 Até logo!".colorize(:blue)
        break
      else
        puts "❌ Opção inválida!".colorize(:red)
      end
    end
  end
end

system = Database.new
system.menu


