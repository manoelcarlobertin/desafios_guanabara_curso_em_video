# Desenvolva um programa que leia seis números inteiros e mostre a soma apenas daqueles que forem pares.
# Se o valor digitado for ímpar, desconsidere-o.

# Em Ruby, o equivalente ao continue do Python é a palavra-chave * next *.

soma = 0
print "Agora está mais Ruby-like! 😃🔥"
(1..6).each do |i|
  print "Entre com um número: "
  n = gets.to_i

  next unless n.even? # Se o número for ímpar, pula para a próxima iteração
  # → Se o número for ímpar, o loop ignora o restante e continua para a próxima iteração.
  soma += n
end

puts "Soma dos números pares: #{soma}"
