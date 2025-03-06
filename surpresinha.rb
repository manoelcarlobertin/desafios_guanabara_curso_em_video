# Então, se você estiver no Rio e quiser fazer uma aposta automática da Mega-Sena,

# basta pedir uma "Surpresinha" na casa lotérica. E ter sorte, tropinha.

# O valor mínimo para uma Surpresinha simples (6 números) é R$ 5,00. 😊

# INICIO CODIGO

require 'set'  # Para garantir números únicos rapidamente
require 'colorize'  # Gem para deixar a saída colorida
require 'io/console' # Para leitura silenciosa sem enter

def gerar_palpite
  numeros = Set.new
  while numeros.size < 6
    numeros << rand(1..60)
  end
  numeros.to_a.sort # já ordenados.
end

def gerar_palpites(quantidade)
  puts "\n🔮 Gerando #{quantidade} #{quantidade > 1 ? 'palpites' : 'palpite'}...".yellow
  sleep(1)
  quantidade.times do |i|
    palpite = gerar_palpite
    puts "🎯 Jogo #{i + 1}: #{palpite.join(', ')}".green
    sleep(0.5)
  end
end

def continuar?
  loop do
    print "\n👉 Quer novos palpites? [S/N]: ".blue
    resposta = STDIN.getch.upcase
    if %w[S N].include?(resposta)
      puts resposta
      return resposta == 'S'
    else
      puts "\n🚫 Opção inválida! Tente novamente.".red
    end
  end
end

puts "=" * 80
puts "🚀  L O T E R I A   J O G A  M A I S  U M A  ✨".center(80).cyan
puts " Surpresinha - Palpites da Mega-Sena - Brasil ".center(80).cyan
puts "=" * 80

loop do
  print "\nQuantos palpites deseja ver? ".yellow
  quantidade = gets.chomp.to_i

  if quantidade > 0
    gerar_palpites(quantidade)
  else
    puts "❌ Por favor, informe um número válido!".red
    next
  end

  break unless continuar?
  puts "-=" * 40
end

puts "\n🍀 'Só Vale o que tá escrito!' 🎲 'Malandro bom, Não perde esse bilhete!'".green
puts "\n✨ Salve Bezerra da Silva! '-- Quando tá ruim é porque tá perto de melhorar!'".red
puts "=" * 80
