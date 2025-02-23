puts '=' * 53
puts 'Mostrando os números pares no intervalo de 1 até 50!!'
puts '=' * 53

# Utilizando um * loop for com step * para iterar apenas sobre números pares
# (2..50).step(2) do |n|
#   puts n
# end

# Versão alternativa utilizando um loop each e um condicional
# (1..50).each do |n|
#   puts n if n.even? # método even? (que verifica se um número é par)
# end

# n = 2
# until n > 50
#   puts n
#   n += 2
# end

# puts '=' * 53

# 1.upto(50) { |n| puts n if n.even? }

# puts '=' * 53

# n = 2
# while n < 51
#   puts(n)
#   n += 2
# end

# puts '=' * 53

# encoding: utf-8

# Para usar emojis no Ruby, você precisa instalar a gem 'emoji'
# Você pode instalá-la executando o comando: gem install emoji

# Itera de 1 até 50, usando um bloco com nome para melhor clareza
(1..50).each do |x|
  mensagem = if x.even? # Verifica se x é par usando o método even?
               "🟢 👍 🎉 #{x} par 😃"
             else
               "🔴 👎 #{x} ímpar 🚀 🍀😃"
             end
  puts mensagem # Imprime a mensagem formatada
end
# Método 1: Usando map e join

# puts (1..50).map { |x| "#{x} #{x.even? ? 'par' : 'ímpar'}" }.join("\n")

# Método 2: Usando each com ternário

# (1..50).each { |x| puts "#{x} #{x.even? ? 'par' : 'ímpar'}" }

# Método 3: Usando upto e ternário (semelhante ao original, mais conciso)

# 1.upto(50) { |x| puts "#{x} #{x.even? ? 'par' : 'ímpar'}" }
