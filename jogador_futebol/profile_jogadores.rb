require 'sqlite3'
require 'faker'
require 'colorize'

# Classe Jogador de Futebol
class Jogador
  attr_reader :nome, :time, :posicao, :partidas, :gols, :assistencias, :cartoes

  @@nomes_usados = [] # Lista global para evitar nomes repetidos

  def initialize
    loop do
      @nome = Faker::Sports::Football.player
      break unless @@nomes_usados.include?(@nome)
    end
    @@nomes_usados << @nome

    @time = Faker::Sports::Football.team
    @posicao = %w[

    Zagueiro Lateral-direito Lateral-esquerdo Meio-campo Volante Meia-central Meia-atacante Ponta-direita
    Ponta-esquerda Centroavante Segundo-atacante Atacante-pela-direita Atacante-pela-esquerda Falso_9
    Ala Meia-ala Enganche("cérebro")

    ].sample
    @partidas = rand(1..38) # Ligas - 38 partidas por time (20 times jogam em turno e returno).
    @gols = Array.new(@partidas) { rand(0..1) }
    @assistencias = Array.new(@partidas) { rand(0..1) }
    @cartoes = { amarelos: rand(0..1), vermelhos: rand(0..1) }
  end

  def total_gols
    @gols.sum
  end

  def total_assistencias
    @assistencias.sum
  end

  def exibir_dados
    puts "\n⚽ Perfil do Jogador".colorize(:blue)
    puts "Nome: #{@nome}".colorize(:cyan)
    puts "Time: #{@time}".colorize(:cyan)
    puts "Posição: #{@posicao}".colorize(:cyan)
    puts "Partidas: #{@partidas}".colorize(:cyan)
    puts "Gols: #{total_gols}".colorize(:yellow)
    puts "Assistências: #{total_assistencias}".colorize(:yellow)
    puts "Cartões Amarelos: #{@cartoes[:amarelos]}".colorize(:yellow)
    puts "Cartões Vermelhos: #{@cartoes[:vermelhos]}".colorize(:red)
  end
end

# Classe Banco de Dados
class Database
  AVATARES = ["😀", "😃", "😄", "😁", "😆", "😅", "😂", "😊", "😎", "🤠", "🥳", "😇", "🤓", "🧐", "🙃", "😏", "🤩"]

  def initialize
    @db = SQLite3::Database.new('jogadores.db')
    criar_tabela
  end

  def criar_tabela
    @db.execute <<-SQL
    CREATE TABLE IF NOT EXISTS jogadores (
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      nome TEXT NOT NULL,
      time TEXT NOT NULL,
      posicao TEXT NOT NULL,
      partidas INTEGER NOT NULL,
      gols INTEGER NOT NULL,
      assistencias INTEGER NOT NULL,
      cartoes_amarelos INTEGER NOT NULL,
      cartoes_vermelhos INTEGER NOT NULL
    );
    SQL
  end

  def inserir_jogador(jogador)
    @avatar = AVATARES.sample

    @db.execute(
      'INSERT INTO jogadores (nome, time, posicao, partidas, gols, assistencias, cartoes_amarelos, cartoes_vermelhos) VALUES (?, ?, ?, ?, ?, ?, ?, ?)',
      [
        jogador.nome,
        jogador.time,
        jogador.posicao,
        jogador.partidas,
        jogador.gols.sum,
        jogador.assistencias.sum,
        jogador.cartoes[:amarelos],
        jogador.cartoes[:vermelhos]
      ]
    )

    puts "🎉 Jogador * #{jogador.nome} * #{@avatar} cadastrado com sucesso!".colorize(:green)
  end

  def listar_jogadores
    jogadores = @db.execute('SELECT nome, time, posicao, gols, assistencias FROM jogadores')

    if jogadores.empty?
      puts "🚫 Nenhum jogador cadastrado!!!".colorize(:red)
      return
    end

    puts "\n🏆 Lista de Jogadores Cadastrados".colorize(:blue)
    puts '=' * 100
    jogadores.each do |j|
      puts "Nome: #{j[0]} | Time: #{j[1]} | Posição: #{j[2]} | Gols: #{j[3]} | Assistências: #{j[4]}"
    end
    puts '=' * 100
  end
end

# Inicializando o Sistema
db = Database.new
4.times do
  jogador = Jogador.new
  jogador.exibir_dados
  db.inserir_jogador(jogador)
end

# Pergunta ao usuário se deseja listar os jogadores
puts "\n📋 O que deseja fazer agora?".colorize(:yellow)
puts "1️⃣ Listar jogadores cadastrados"
puts "2️⃣ Sair"

print "Escolha uma opção (1/2): ".colorize(:yellow)
opcao = gets.chomp

db.listar_jogadores if opcao == '1'
puts "✅ Operação finalizada. Obrigado por usar o sistema!" if opcao == '2'


