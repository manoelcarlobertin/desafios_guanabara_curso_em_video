class Jokenpo
  OPTIONS = { 0 => "Pedra", 1 => "Papel", 2 => "Tesoura" }
  # → Essa constante * OPTIONS * armazena 3 chaves e 3 valores num Hash.
  def initialize
    exibir_menu
    @jogador = obter_jogada
    @computador = rand(0..2) # → Não precisei importar gem randomica.
    iniciar_contagem
    exibir_escolhas
    determinar_vencedor
  end

  private

  def exibir_menu
    puts "=============\e[1;36m SUAS OPÇÕES \e[0m=============" # → Mostra as opções para o jogador.
    OPTIONS.each { |num, nome| puts "\e[1;3#{num + 3}m[ #{num} ] #{nome}\e[0m" }
    puts "========================================\n"
  end

  def obter_jogada
    loop do
      print "\e[1mQual é a sua jogada?\e[0m "
      entrada = gets.chomp
      return entrada.to_i if entrada.match?(/^[0-2]$/) # → Valida a entrada do jogador.

      puts "⚠️ Entrada inválida! Escolha um número entre 0 e 2."
    end
  end

  def iniciar_contagem
    ["JO", "KEN", "PÔ!"].each do |palavra|
      puts "\e[1;33m#{palavra}\e[0m"
      sleep(0.7) # → Simula o "JO-KEN-PÔ!". A contagem pausada. # → * Não precisei importar * a gem de tempo.
    end
  end

  def exibir_escolhas
    puts "=" * 30
    puts "🧑 Jogador escolheu: \e[1;32m#{OPTIONS[@jogador]}\e[0m"
    puts "🤖 Computador escolheu: \e[1;31m#{OPTIONS[@computador]}\e[0m"
  end

  def determinar_vencedor
    resultado = case [@computador, @jogador] # → Aqui a lógica de quem ganha e de quem perde o jogo.
                when [0, 2], [1, 0], [2, 1] then "🤖 COMPUTADOR VENCEU!"
                when [0, 0], [1, 1], [2, 2] then "⚖️ EMPATE!"
                else "🏆 JOGADOR VENCEU!"
                end
    puts "\n#{resultado}"
  end
end

# Inicia o jogo
Jokenpo.new

# O meu * primeiro case * foi para todas as situações que o * computador ganharia *,
# em seguida outro para empate e o último * else * para todas as situações que o jogador ganhasse.
# Eu também criei 3 variavéis, cada uma com * o nome e o valor *.
# Por exemplo: Pedra = 0 (Só para não me confundir na hora de fazer as comparações).
