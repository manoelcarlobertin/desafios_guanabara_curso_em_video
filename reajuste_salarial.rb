print "Digite o salário inicial do trabalhador R$ "
salario_inicial = gets.chomp.to_f
print "Informe o percentual de reajuste do salário "
percentual = gets.chomp.to_f

private

# Função para calcular o reajuste do salário com base no percentual informado
def reajuste_salario(salario_inicial, percentual)
  reajuste = salario_inicial * (percentual / 100.0)
  salario_inicial + reajuste
end

reajustado = reajuste_salario(salario_inicial, percentual)
puts "O salário reajustado é R$ #{'%.2f' % reajustado}"
