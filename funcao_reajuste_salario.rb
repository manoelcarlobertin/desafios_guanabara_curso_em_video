# Função para calcular o reajuste do salário com base no percentual informado
def reajuste_salario(salario_inicial, percentual)
  reajuste = salario_inicial * (percentual / 100.0)
  salario_inicial + reajuste
end
