def converter_numero(numero, base)
  hex_map = { 10 => "A", 11 => "B", 12 => "C", 13 => "D", 14 => "E", 15 => "F" }
  resultado = ""

  while numero > 0
    resto = numero % base
    resultado = (hex_map[resto] || resto.to_s) + resultado
    numero /= base
  end
  # Lida com entrada inválida. Retorna "0" se o número for zero, evitando que o resultado fique vazio "".
  resultado.empty? ? "0" : resultado
end

puts "Escreva um número inteiro para converter: "
numero = gets.chomp.to_i

puts <<~MENU
  Em qual base?
  \e[1;32m1 = Binário\e[0m
  \e[1;33m2 = Octal\e[0m
  \e[1;34m3 = Hexadecimal\e[0m
MENU

base = gets.chomp

case base
when '1'
  puts "\e[1;31mBinário:\e[0m #{converter_numero(numero, 2)}"
when '2'
  puts "\e[1;31mOctal:\e[0m #{converter_numero(numero, 8)}"
when '3'
  puts "\e[1;31mHexadecimal:\e[0m 0x#{converter_numero(numero, 16)}"
else
  puts "\e[1;31mDigite uma base válida.\e[0m"
end
