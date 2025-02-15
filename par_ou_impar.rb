print "Digite um número: "
numero = gets.chomp.to_f

if numero % 2 == 0.0
  # quando o resto da divisão por 2 é 0.0
  puts "#{numero} é um número par"
else
  puts "#{numero} é um número ímpar"
end
