puts "Digite o 1º número inteiro:"
n1 = gets.chomp.to_i

puts "Digite o 2º número inteiro:"
n2 = gets.chomp.to_i

if n1 > n2
    puts "O 1ºo valor é maior."
elsif n2 > n1
    puts "O 2º valor é maior."
else
    puts "Não existe valor maior, os dois números são iguais."
end
