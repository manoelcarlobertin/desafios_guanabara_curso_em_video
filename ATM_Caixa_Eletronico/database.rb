require 'sqlite3'

class Database
  DB_NAME = 'saques.db'.freeze

  def self.connection
    db = SQLite3::Database.new(DB_NAME)
    db.execute <<-SQL
      CREATE TABLE IF NOT EXISTS saques (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        valor INTEGER,
        data_hora TEXT
      );
    SQL
    db
  end

  def self.save(valor)
    db = connection
    db.execute("INSERT INTO saques (valor, data_hora) VALUES (?, ?)", [valor, Time.now.strftime('%d/%m/%Y %H:%M:%S')])
    puts "💾 Saque de #{Utils.format_currency(valor)} registrado com sucesso!".colorize(:green)
  end
end
