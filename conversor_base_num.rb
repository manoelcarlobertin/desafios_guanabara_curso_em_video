print "Digite um número inteiro: "
number = gets.chomp.to_i

print "\nEscolha uma das bases para conversão: "
print "\n[ 1 ] converter para BINÁRIO"
print "\n[ 2 ] converter para OCTAL"
print "\n[ 3 ] converter para HEXADECIMAL"
print "\nSua opção: "
option = gets.chomp.to_i

case option
when 1
  base = 2 # Em Ruby, .to_s(base) já converte um número diretamente para a base desejada (binário, octal, hexadecimal).
  puts "\n#{number} convertido para BINÁRIO é igual a #{number.to_s(2)}"
when 2
  base = 8
  puts "\n#{number} convertido para OCTAL é igual a #{number.to_s(8)}"
when 3
  base = 16
  puts "\n#{number} convertido para HEXADECIMAL é igual a #{number.to_s(16).upcase}"
else
  base = 10
  puts "\nOpção inválida. Escolha 1, 2 ou 3."
end
# Para quem não quer usar as funções prontas,* C Á L C U L O S *, a seguir:
dividend = number
quotient = dividend / base # Em Ruby, / já retorna um número inteiro quando operado com inteiros.
remainder = dividend % base

number_in_new_base = ""

remainder_hex = { 10 => "A", 11 => "B", 12 => "C", 13 => "D", 14 => "E", 15 => "F" } # Uso de Hash {} para remainder_hex

while quotient != 0
  if remainder >= 10
    number_in_new_base = remainder_hex[remainder] + number_in_new_base
  else
    number_in_new_base = remainder.to_s + number_in_new_base # Ruby permite string + string para concatenar strings
  end

  dividend = quotient
  quotient = dividend / base
  remainder = dividend % base
end

puts "#{number} → Binário: #{number.to_s(2)},
Octal: #{number.to_s(8)},
Hexadecimal: #{number.to_s(16).upcase},
Base #{base}: #{number_in_new_base}"
# Exemple 1:
# 10 → Binário: 1010,
# Octal: 12,
# Hexadecimal: A,
# Base 2: 1010

# Exemple 2:
# number = 255 and base = 16
# 255 → Binário: 11111111, Octal: 377, Hexadecimal: FF, Base 16: FF

