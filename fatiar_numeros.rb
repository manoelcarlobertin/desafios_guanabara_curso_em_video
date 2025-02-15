print "Digite um número entre 0 e 9999: "
numero = gets.chomp.to_i

if numero >= 0 && numero <= 9999
  # Esse código está pegando o último dígito do número armazenado em numero
  unidade = numero % 10 # O operador % (módulo) retorna o resto da divisão.
  dezena = (numero / 10) % 10
  centena = (numero / 100) % 10
  milhar = (numero / 1000) % 10
  # ou seja, O resto da divisão é 3, que é exatamente o último dígito. ex: 123.
  puts "\nAnalisando o número #{numero}:" # \n pulou uma linha.
  puts "Unidade: #{unidade}"
  puts "Dezena: #{dezena}"
  puts "Centena: #{centena}"
  puts "Milhar: #{milhar}"
else
  puts "Por favor, digite um número válido entre 0 e 9999."
end
