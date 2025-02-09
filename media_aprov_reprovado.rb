# Solicita a entrada da medida em metros
print "Digite a medida em metros: "
metros = gets.chomp.to_f

# Conversões
quilometros = metros / 1000
centimetros = metros * 100
milimetros = metros * 1000

# Exibe os resultados
puts "#{metros} metros equivalem a:"
puts "#{quilometros} quilômetros"
puts "#{centimetros} centímetros"
puts "#{milimetros} milímetros"
