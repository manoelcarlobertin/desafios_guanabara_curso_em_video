require 'sqlite3'

class Database
  DB_NAME = 'numeros.db'.freeze

  def self.connection
    db = SQLite3::Database.new(DB_NAME)
    db.execute <<-SQL
      CREATE TABLE IF NOT EXISTS numeros (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        numero INT,
        descricao TEXT,
        data_hora TEXT
      );
    SQL
    db
  end

  def self.save(numero, descricao)
    db = connection
    db.execute("INSERT INTO numeros (numero, descricao, data_hora) VALUES (?, ?, ?)", [numero, descricao, Time.now.strftime('%d/%m/%Y %H:%M:%S')])
    Utils.show_message('saved', :green, number: numero)
  end
end
