notas = [] # Cria um array vazio

print "Digite a primeira nota: "
nota1 = gets.chomp.to_f # Lê a primeira nota e converte para float
notas << nota1 # Adiciona a nota ao array

print "Digite a segunda nota: "
nota2 = gets.chomp.to_f # Lê a segunda nota e converte para float
notas << nota2 # Adiciona a nota ao array

puts "Notas: #{notas}" # Exibe o array com as notas

# calcula entre nota1 e nota2
media = (notas[0] + notas[1]) / 2
# exibe os resultados
puts "Média de #{notas[0]} e #{notas[1]} é: #{media}"

# verifica se o aluno foi aprovado
if media >= 6
  puts "Parabéns, você foi aprovado!"
else
  puts "Você não foi aprovado. Tente novamente."
end