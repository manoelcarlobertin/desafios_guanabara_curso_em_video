print "Digite uma frase: "
frase = gets.chomp.upcase

letra_a = frase.count("A")
primeira_posicao = frase.index("A") + 1
ultima_posicao = frase.rindex("A") + 1

puts "A letra *A* aparece #{letra_a} vezes na frase."
puts "A primeira letra *A* apareceu na #{primeira_posicao}ª posição."
puts "A última letra *A* apareceu na #{ultima_posicao}ª posição."
