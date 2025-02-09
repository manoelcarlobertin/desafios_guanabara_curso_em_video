# Arquivo: programa_principal.rb

require_relative 'funcao_reajuste_salario' # Use require_relative

print 'Digite o salário inicial do trabalhador R$ '
salario_inicial = gets.chomp.to_f
print 'Informe o percentual de reajuste do salário '
percentual = gets.chomp.to_f

reajustado = reajuste_salario(salario_inicial, percentual)
puts "O salário reajustado é R$ #{'%.2f' % reajustado}"
