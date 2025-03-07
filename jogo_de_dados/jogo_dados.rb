require 'colorize'  # Gem para deixar a saída colorida
require 'sqlite3'

# Início do Módulo para lidar com a lógica do jogo de dados - * Craps * popularmente nos EUA.
module CrapsGame
  def self.roll_dice
    rand(1..6)
  end

  def self.play_game(players)
    scores = {}
    puts "\n🎯 Rolling craps... ('lançar os ossos') 🔮".yellow
    sleep(1)

    players.each_with_index do |player, index|
      score = roll_dice
      scores[player] = score # Hash - Armazena nome e pontuação.
      puts "#{player} 🎲 rolled #{score}".green
      sleep(0.5)
    end

    scores.sort_by { |_player, score| -score }.to_h
  end

  def self.show_ranking(scores)
    puts "\n🏆 RANKING".cyan
    puts "=" * 30
    position = 1

    scores.each do |player, score|
      puts "#{position}º - #{player} 😂 with #{score} points".yellow
      position += 1
      sleep(0.3)
    end
    puts "=" * 30
  end

  def self.save_to_db(scores)
    db = SQLite3::Database.new 'craps_game.db'
    db.execute <<-SQL
      CREATE TABLE IF NOT EXISTS rankings (
        id INTEGER PRIMARY KEY,
        player_name TEXT,
        score INTEGER,
        played_at DATETIME DEFAULT CURRENT_TIMESTAMP
      );
    SQL

    scores.each do |player, score|
      db.execute("INSERT INTO rankings (player_name, score) VALUES (?, ?)", [player, score])
    end

    puts "\n💾 Ranking saved to the database!".green
    db.close
  end
end
# Final do módulo em relação à Lógica do jogo de dados.

# Início do Menu Principal.
def menu
  players = %w[Player1 Player2 Player3 Player4] # Array de jogadores.
  loop do
    puts "=" * 60
    puts "🔥 C R A P S 🎲 (jogo de dados) 💎".center(60).cyan
    puts "=" * 60
    puts "* +18 * Conheça seus limites e aposte com responsabilidade!!".center(60).cyan
    puts "=" * 60

    puts "\n1️⃣ Start Game".yellow
    puts "2️⃣ Show Last Ranking".blue
    puts "3️⃣ Exit".red
    print "\n👉 Choose an option: ".light_blue
    option = gets.chomp.to_i

    case option
    when 1
      scores = CrapsGame.play_game(players)
      CrapsGame.show_ranking(scores)

      print "\nDo you want to save the ranking to the database? [Y/N]: ".yellow
      save = gets.chomp.strip.upcase
      CrapsGame.save_to_db(scores) if save == 'Y'

      print "\n🔄 Play again? [Y/N]: ".blue
      continue = gets.chomp.strip.upcase
      break if continue == 'N'
    when 2
      db = SQLite3::Database.new 'craps_game.db'
      puts "\n💪 Last Rankings:".cyan
      db.execute("SELECT player_name, score, played_at FROM rankings ORDER BY played_at DESC LIMIT 10") do |row|
        puts "#{row[0]} - #{row[1]} points at #{row[2]}".green
      end
      db.close
    when 3
      puts "\n🍀 Bye Bye! Come back soon!".red
      break
    else
      puts "\n🚫 Invalid option, try again!".red # Aqui valida a opção de escolha do usuário de 1 a 3.
    end
  end
end

menu
