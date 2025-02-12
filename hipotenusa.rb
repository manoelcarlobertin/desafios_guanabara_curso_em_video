print "Digite o comprimento do cateto oposto (cm): "
oposto = gets.chomp.to_f

print "Digite o comprimento do cateto adjacente (cm): "
adjacente = gets.chomp.to_f

hipotenusa = Math.sqrt(oposto**2 + adjacente**2)
puts "hipotenusa(cm) = raíz quadrada[(#{oposto}cm)² + (#{adjacente}cm)²]"
puts "O comprimento da hipotenusa é: #{hipotenusa}cm"
