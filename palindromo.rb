print "\033[1mDigite uma frase: \033[m"
frase = gets.chomp.strip.upcase.split.join  # Remove espaços extras e une a string

puts "\033[1;34m=\033[m" * 40

inverso = frase.reverse

if inverso == frase
  puts "A frase: \033[1;35m#{frase}\033[m lida ao contrário é: \033[1;33m#{inverso}\033[m"
  puts "Temos um \033[1;34mPALÍNDROMO!"
else
  puts "A frase: \033[1;35m#{frase}\033[m lida ao contrário é: \033[1;33m#{inverso}\033[m"
  puts "Não temos um \033[1;31mPALÍNDROMO."
end

puts "\033[1;34m=\033[m" * 100

'''
"A base do teto desaba"

Outros exemplos:

"Socorram-me, subi no onibus em Marrocos"
"Anotaram a data da maratona"
"A mae te ama"
'''
