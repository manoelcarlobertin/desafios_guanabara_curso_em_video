
print "Digite o salário do funcionário: R$ "
salario = gets.chomp.to_f

if salario > 1250
  aumento = salario * 0.10
  novo_salario = salario + aumento
  puts "\nSalário anterior: R$ #{salario.round(2)}"
  puts "Valor do aumento: R$ #{aumento.round(2)}"
  puts "Reajustado c/10%: R$ #{novo_salario.round(2)}"
else
  aumento = salario * 0.15
  novo_salario = salario + aumento
  puts "\nSalário anterior: R$ #{salario.round(2)}"
  puts "Valor do aumento: R$ #{aumento.round(2)}"
  puts "Reajustado c/15%: R$ #{novo_salario.round(2)}"
end
