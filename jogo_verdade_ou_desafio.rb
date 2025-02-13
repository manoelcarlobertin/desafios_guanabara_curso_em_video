require 'io/console'

# Informações sobre como jogar e recursos lógico utilizados com o Ruby
def info_como_funciona
  puts 'Como o jogo funciona?

      O jogo exibe um menu perguntando se você quer "Verdade (v)" ou "Desafio (d)".
      Dependendo da escolha, ele exibe aleatoriamente uma pergunta de verdade ou um desafio.
      O jogador pode continuar jogando até digitar "sair", que encerra o jogo.
      Após cada rodada, o jogo pausa e aguarda que o jogador pressione qualquer tecla para continuar.
Recursos usados:

      shuffle! → Embaralha a lista para que as perguntas e desafios sejam aleatórios.
      sample → Seleciona um item aleatório da lista de perguntas/desafios.
      STDIN.getch → Aguarda o jogador pressionar qualquer tecla antes de continuar.
      loop do → Mantém o jogo rodando até o jogador decidir sair.
      Google Gemimi → Criar o roteiro do jogo usando as susgestões dadas pela IA.
      *Lembre-se* de adaptar as perguntas e desafios à faixa etária e ao nível de intimidade
      dos participantes. O importante é criar um ambiente divertido e respeitoso para todos.'
end

# Lista de perguntas de "Verdade"
verdades = [
  'Já fez algo de que se arrependa? Se sim, o que?',
  'Já tirou o BV?',
  'Você tem um dia inesquecível? Se sim, como foi?',
  'Você já desistiu de algo muito importante? Se sim, o que foi?',
  'Já sofreu ou praticou bullying na escola?',
  'Tem algum grande desejo? Qual?',
  'Já entrou em uma briga? Como foi?',
  'Você quer ter filhos? Se sim, quantos?'
]

# Lista de desafios
desafios = [
  'Imite um macaco.',
  'Deixe a pessoa do seu lado direito te dar um tapa.',
  'Teve sorte, pule a sua vez!',
  'Fale uma raça de cachorro que começa com Y, se não conseguir, imite um.',
  'Não fale nada pelos próximos 5 minutos.',
  'Fale para uma pessoa que não está na brincadeira que a ama (não vale parente).',
  'Você só poderá escolher desafio nas próximas 5 rodadas.',
  'Agora você tem poder! Mande um dos jogadores fazer o que você quiser.'
]

# Embaralha as listas
verdades.shuffle!
desafios.shuffle!

puts '🎭 Bem-vindo ao jogo *Verdade ou Desafio*! 🎭'
puts "*Informação* de como funciona o jogo e saber todos *recursos lógicos* utilizados nele, escreva 'i'."
puts "Caso queira *Verdade*, escreva 'v'. Se quiser *Desafio*, escreva 'd'."
puts "Para sair do jogo, digite 'sair'.\n\n"

loop do
  print 'Você escolhe Verdade (v) ou Desafio (d)? '
  escolha = gets.chomp.downcase

  case escolha
  when 'i'
    info_como_funciona
  when 'v'
    puts "👉 #{verdades.sample}"
  when 'd'
    puts "🔥 #{desafios.sample}"
  when 'sair'
    puts '🎉 Obrigado por jogar! Até a próxima!'
    break
  else
    puts "❌ Escolha inválida. Digite 'v' para verdade, 'd' para desafio ou 'sair' para encerrar."
  end

  puts "\nPressione qualquer tecla para continuar..."
  STDIN.getch
  puts "\n" + '-' * 40 + "\n"
end

# "Tirar o BV" é uma expressão que significa beijar pela primeira vez,
# ou seja, perder a virgindade na boca. É uma gíria popularmente usada entre adolescentes.
# Fonte: Google, 12/02/2025. Eu sou o porteiro da escola onde trabalho, atualmente, e observo.
# Autor do jogo: Manoel Carlo Bertin.
