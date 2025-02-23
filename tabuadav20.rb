# Exibe a tabuada de um número informado pelo usuário, utilizando loops.
N_DESAFIO = "049"
NOME_DESAFIO = "Tabuada v.2.0"

puts "=" * NOME_DESAFIO.length
puts " DESAFIO #{N_DESAFIO} ".center(NOME_DESAFIO.length, "=")
puts NOME_DESAFIO
puts "=" * NOME_DESAFIO.length

print "Informe um número: "
n = gets.chomp.to_i

puts "\nA Tabuada do #{n} é:\n\n"

operacoes = {
  "MULTIPLICAÇÃO" => ->(num, i) { "#{num} x #{i} = #{num * i}" },
  "DIVISÃO"       => ->(num, i) { "#{num} / #{i} = #{format('%.1f', num.to_f / i)}" },
  "ADIÇÃO"        => ->(num, i) { "#{num} + #{i} = #{num + i}" },
  "SUBTRAÇÃO"     => ->(num, i) { "#{num} - #{i} = #{num - i}" }
}

operacoes.each do |titulo, operacao|
  puts "||#{titulo.center(15, '=')}||"
  (1..10).each { |i| puts "||#{operacao.call(n, i).center(15)}||" }
  puts
end

# Uso de um hash (operacoes) para armazenar as operações matemáticas e evitar código duplicado.
# Uso de blocos (Proc) para definir as operações matemáticas dinamicamente.
# Uso de center e format para garantir alinhamento adequado dos textos e números.
# Loop simplificado com each, eliminando a necessidade de múltiplas estruturas for.
# Código mais modular e legível, facilitando futuras modificações.
