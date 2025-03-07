require 'sqlite3'
require 'faker'
require 'colorize'

# Representa um estudante e calcula sua média e status.
class Student
  attr_accessor :id, :name, :grade1, :grade2, :average, :status

  def initialize(name, grade1, grade2)
    @name = name
    @grade1 = grade1
    @grade2 = grade2
    @average = calculate_average
    @status = calculate_status
  end

  def calculate_average
    ((@grade1 + @grade2) / 2).round(2)
  end

  def calculate_status
    if @average >= 7
      'Aprovado(a)'.colorize(:green)
    elsif @average >= 5
      'Reforço'.colorize(:yellow)
    else
      'Reprovado(a)'.colorize(:red)
    end
  end
end
# Fim da classe de estudante.

# Classe para lidar com todas as operações de banco de dados.
class Database
  def initialize
    @db = SQLite3::Database.new('students.db')
    create_table
  end

  def create_table
  # CREATE TABLE ->> Usado para criar uma nova tabela no banco de dados.
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
  end

  # As queries SQL estão encapsuladas na classe Database, separando claramente o código Ruby do SQL.

  def insert_student(student)
    # INSERT ->> Usado para adicionar novos registros em uma tabela.
    @db.execute('INSERT INTO students (name, grade1, grade2, average, status) VALUES (?, ?, ?, ?, ?)',
                [student.name, student.grade1, student.grade2, student.average, student.status])
  end

  def list_students
    # SELECT (Consultar dados)->> Usado para recuperar dados de uma ou mais tabelas.
    students = @db.execute('SELECT id, name, average, status FROM students')

    puts "\n📄 Estudantes Cadastrados".colorize(:blue)
    puts '=' * 60

    # Itera sobre os alunos e exibe com números ordinais
    students.each_with_index do |row, index|
      ordinal = (index + 1).ordinalize # Gera o número ordinal (1º, 2º, 3º, etc.)
      id = row[0]
      spacing = id.between?(0, 9) ? ' ' : ''
      puts "#{ordinal}. #{row[1].ljust(15)} | Média: #{row[2]} | Situação: #{row[3]}"
    end
    # Ordinais apenas para exibição e não precisam ser armazenados.
    puts '=' * 60
  end

  def find_student_by_id(id)
    @db.execute('SELECT name, grade1, grade2 FROM students WHERE id = ?', id).first
  end

  def delete_student_by_id(id)
    # Verifica se o ID é válido
    unless id.is_a?(Integer) && id.positive?
      puts "❌ ID inválido! O ID deve ser um número positivo.".colorize(:red)
      return false
    end

    # Verifica se o aluno existe
    student = @db.execute('SELECT name FROM students WHERE id = ?', id).first
    unless student
      puts "❌ Aluno com ID #{id} não encontrado.".colorize(:red)
      return false
    end

    # Confirmação do usuário antes de excluir
    puts "Tem certeza que deseja apagar o aluno #{student[0]}? (s/n)".colorize(:yellow)
    confirmation = gets.chomp.downcase

    if confirmation == 's'
      @db.execute('DELETE FROM students WHERE id = ?', id)
      puts "✅ Aluno #{student[0]} apagado com sucesso!".colorize(:green)
      true
    else
      puts "🚫 Operação cancelada.".colorize(:yellow)
      false
    end
  end

  def delete_all_students
    @db.execute('DELETE FROM students')
  end
end

# Gerencia a interação com o usuário e a lógica do sistema.
class StudentSystem
  def initialize
    @db = Database.new
  end

  def generate_random_students(quantity)
    quantity.times do
      name = Faker::Name.first_name
      grade1 = rand(3.0..10.0).round(2)
      grade2 = rand(3.0..10.0).round(2)
      student = Student.new(name, grade1, grade2)
      @db.insert_student(student)
    end
    puts "🎉 #{quantity} alunos gerados com sucesso!".colorize(:green)
  end

  def list_students
    students = @db.list_students
    puts "\n📄 Estudantes Cadastrados".colorize(:blue)
    puts '=' * 60
    students.each do |row|
      id = row[0]
      spacing = id.between?(0, 9) ? ' ' : ''
      puts "#{id}#{spacing}. #{row[1].ljust(15)} | Média: #{row[2]} | Situação: #{row[3]}"
    end
    puts '=' * 60
  end

  def show_student_notes(id)
    student = @db.find_student_by_id(id)
    if student
      puts "\n📝 Notas de #{student[0]}"
      puts "Nota 1: #{student[1]}"
      puts "Nota 2: #{student[2]}"
    else
      puts "❌ Aluno não encontrado!".colorize(:red)
    end
  end

  def delete_student_by_id(id)
    student = @db.find_student_by_id(id)
    if student
      puts "⚠️ Tem certeza que deseja apagar o aluno #{student[0]}? (s/n)".colorize(:red)
      confirmation = gets.chomp.downcase
      if confirmation == 's'
        @db.delete_student_by_id(id)
        puts "✅ Aluno #{student[0]} apagado com sucesso!".colorize(:green)
      else
        puts "🚫 Operação cancelada!".colorize(:yellow)
      end
    else
      puts "❌ Aluno não encontrado!".colorize(:red)
    end
  end

  def delete_all_students
    puts "⚠️ Tem certeza que deseja apagar todos os alunos? (s/n)".colorize(:red)
    confirmation = gets.chomp.downcase
    if confirmation == 's'
      @db.delete_all_students
      puts "✅ Todos os alunos foram apagados!".colorize(:green)
    else
      puts "🚫 Operação cancelada!".colorize(:yellow)
    end
  end

  def menu
    loop do
      puts "\n😎 Sistema de Alunos"
      puts ''
      puts "1. Gerar Alunos Aleatórios"
      puts "2. Listar Alunos"
      puts "3. Mostrar Notas de um Aluno"
      puts "4. Apagar um Aluno"
      puts "5. Apagar Todos os Alunos"
      puts "6. Sair"
      print "Escolha uma opção: ".colorize(:cyan)
      option = gets.chomp.to_i

      case option
      when 1
        print "Quantos alunos deseja gerar? ".colorize(:cyan)
        quantity = gets.chomp.to_i
        generate_random_students(quantity)
      when 2
        list_students
      when 3
        print "Informe o ID do aluno: ".colorize(:cyan)
        id = gets.chomp.to_i
        show_student_notes(id)
      when 4
        print "Informe o ID do aluno que deseja apagar: ".colorize(:cyan)
        id = gets.chomp.to_i
        delete_student_by_id(id)
      when 5
        delete_all_students
      when 6
        puts "👋 Até logo!".colorize(:blue)
        break
      else
        puts "❌ Opção inválida!".colorize(:red)
      end
    end
  end
end

# Inicializando o sistema
system = StudentSystem.new
system.menu

