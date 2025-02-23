# Programa que soma números PARES ou ÍMPARES, conforme a escolha do usuário
puts <<~MENU
  Quais números deseja somar?
  [0] PARES
  [1] ÍMPARES
MENU

print "Digite a opção: "
tipo = gets.to_i

if tipo != 0 && tipo != 1
  puts "Opção inválida. Tente novamente!"
else
  soma = 0
  cont = 0
  lista = ["PARES", "ÍMPARES"]

  (1..6).each do |count|
    print "Digite o #{count}° número: "
    num = gets.to_i

    if (tipo == 0 && num.even?) || (tipo == 1 && num.odd?)
      soma += num
      cont += 1
    end
  end

  puts "A soma de todos os #{cont} números #{lista[tipo]} digitados é #{soma}."
end
