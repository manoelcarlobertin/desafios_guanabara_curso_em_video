# Importa a biblioteca para gerar números aleatórios
require 'securerandom'

# Gera um número aleatório entre 0 e 100
num = rand(0..100)

# Exibe o título formatado
puts '=' * 25
puts 'Jogo da Adivinhação'.center(25)
puts '=' * 25

# Menu inicial
print 'Escreva 1 para começar e 2 para saber como jogar: '
resposta = gets.to_i

if resposta == 2
  puts "\nA cada tentativa, você tem um chute para acertar o número entre 0 e 100."
  puts 'O jogo dará dicas para ajudar.'
  print "\nEscreva 1 para começar: "
  resposta = gets.to_i
end

unless resposta == 1
  puts "Saindo do jogo..."
  exit
end

puts "\nComeçou!"

# Loop de adivinhação
loop do
  print '<< Escreva seu chute >> '
  chute = gets.to_i

  if chute < num
    puts "<< O número escolhido é maior que #{chute} >>"
  elsif chute > num
    puts "<< O número escolhido é menor que #{chute} >>"
  else
    puts "🎉 Acertou! O número era #{num} 🎉"
    break # Sai do loop quando o jogador acerta
  end
end

# Mensagem de encerramento com contagem regressiva
3.downto(1) do |i| #  → Conta de 3 a 1 de forma elegante.
  puts "Fechando o jogo em #{i}..."
  sleep 1.2
end
