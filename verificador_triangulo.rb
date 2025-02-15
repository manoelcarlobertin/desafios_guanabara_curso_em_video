# Códigos ANSI para cores
VERDE = "\e[32m"; VERMELHO = "\e[31m"; RESET = "\e[0m"
def colorir_letras(palavra)
  palavra.chars.map do |letra|
    cor = [VERDE, VERMELHO].sample # Escolhe aleatoriamente entre verde e vermelho
    "#{cor}#{letra}#{RESET}"
  end.join
end
puts "Digite 1ª medida:"
lado1 = gets.chomp.to_f
puts "Digite 2ª medida:"
lado2 = gets.chomp.to_f
puts "Digite 3ª medida:"
lado3 = gets.chomp.to_f
# Um triângulo é formado quando a soma de dois lados é maior que o terceiro lado.
if (lado1 + lado2 > lado3) && (lado2 + lado3 > lado1) && (lado1 + lado3 > lado2)
  puts "Os segmentos *#{colorir_letras("PODEM")}* formar um triângulo!"
else
  puts "Os segmentos *NÃO #{colorir_letras("PODEM")}* formar um triângulo!"
end
