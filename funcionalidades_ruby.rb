frase = 'Academia do Ruby'

puts frase[0...21].chars.each_slice(2).map(&:first).join  # Printando do 0 até o 21, pulando de 2 em 2
puts frase[0...5]  # Do início até o índice 4
puts frase[15..]  # Do índice 15 até o final
puts frase[9..].chars.each_slice(3).map(&:first).join  # Do índice 9 até o final, pulando de 3 em 3
puts frase.length  # Tamanho da string
puts frase.count('a')  # Contar quantos 'a' existem
puts frase[15..].count('o')  # Contar quantos 'o' existem a partir do índice 15
puts frase.index('Ruby') || 'Não encontrado'  # Encontrar a posição de "Ruby"
puts frase.include?('Academia')  # Retorna true ou false se "Academia" estiver na frase
puts frase.sub('Ruby', 'Rails')  # Substitui "Ruby" por "Rails"
puts frase.upcase  # Transforma toda a string em maiúsculas
puts frase.downcase  # Transforma toda a string em minúsculas
puts frase.capitalize  # Primeira letra maiúscula, resto minúsculo
puts frase.split.map(&:capitalize).join(' ')  # Cada palavra com a inicial maiúscula (equivalente a title)
frase2 = '   Aprenda Ruby   '
puts frase2.strip  # Remove espaços no início e no fim
puts frase2.rstrip  # Remove espaços à direita
puts frase2.lstrip  # Remove espaços à esquerda
puts frase.split.inspect  # Divide a string em palavras onde houver espaços
dividido = frase.split
puts dividido[2][3] if dividido[2] && dividido[2][3]  # Verifica se há caracteres suficientes antes de acessar
puts frase.split.join  # Remove espaços entre palavras
puts frase.reverse  # Escreve ao contrário

puts 'YES' if frase.include?('Academia') # Verifica se "Academia" está na frase
puts '* Descomenta o código abaixo e testa PALINDROMO ? *'
'''
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

'''
"A base do teto desaba"

Outros exemplos:

"Socorram-me, subi no onibus em Marrocos"
"Anotaram a data da maratona"
"A mae te ama"
'''
