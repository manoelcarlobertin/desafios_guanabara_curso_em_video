puts "Digite um número decimal:"
numero = gets.chomp.to_f

arredondado = numero.round

puts "O número arredondado é: #{arredondado}"
# Se quiser um comportamento diferente (sempre para cima ou para baixo),
# pode usar .ceil (para cima) ou .floor (para baixo).

# no exemplo dos litros de tinta eu usei .ceil
