puts "Digite o valor do ângulo (em graus):"
angulo = gets.chomp.to_f
radianos = angulo * Math::PI / 180

seno = Math.sin(radianos)
coseno = Math.cos(radianos)
tangente = Math.tan(radianos)

# formatação
seno_formatado = seno.ceil(2)
coseno_formatado = coseno.ceil(2)
tangente_formatada = tangente.ceil(2)
# tangente de 90° tende ao infinito
puts "Seno: #{seno_formatado}"
puts "Cosseno: #{coseno_formatado}"
puts "Tangente: #{tangente_formatada}"

# Cosseno: 0.866025403784
# formatado = coseno.ceil(2)
# saída: 0.87 arredonda para mais
