# Solicita a entrada da medida em metros
print 'Digite a medida em metro(s): '
metros = gets.chomp.to_f

# Conversões
quilometros = metros / 1000
hectometros = metros / 100
decametros = metros / 10
decimetros = metros * 10
centimetros = metros * 100
milimetros = metros * 1000

# Exibe os resultados
puts "#{metros} metro(s) equivale(m) a:"
puts "#{quilometros} quilômetros"
puts "#{hectometros} hectômetros"
puts "#{decametros} decâmetros"
puts "#{decimetros} decímetros"
puts "#{centimetros} centímetros"
puts "#{milimetros} milímetros"
