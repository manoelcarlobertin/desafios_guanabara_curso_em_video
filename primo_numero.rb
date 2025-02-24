'''🚀 O que mudou e por que é mais eficiente?
✅ Menos iterações → Testamos apenas até Math.sqrt(np), reduzindo o número de verificações.
✅ Evitamos números pares desnecessários → Após 2, só testamos números ímpares.
✅ Parada antecipada (break) → Assim que encontramos um divisor, interrompemos o laço.'''

print 'Digite um número para verificarmos: '
np = gets.to_i

# Tratamento de números menores que 2
if np < 2
  puts "O número #{np} não é primo."
  exit
end

# 2 é primo, caso especial
if np == 2
  puts "O número #{np} é primo."
  exit
end

# Se for par e maior que 2, já não é primo
if np.even?
  puts "O número #{np} não é primo."
  exit
end

# Agora verificamos apenas números ímpares até a raiz quadrada de np (código +eficiente)
limite = Math.sqrt(np).to_i
primo = true

(3..limite).step(2) do |c|
  if (np % c).zero? # verificarmos: 51 em diante...ímpares...
    puts "O número #{np} é divisível por #{c}." # O número 51 é divisível por 3.
    primo = false # O número 51 não é primo.
    break
  end
end

if primo
  puts "O número #{np} é primo."
else
  puts "O número #{np} não é primo."
end

''' 🔥 Otimizações:
Redução do Intervalo de Busca:

Em vez de verificar até np, podemos verificar apenas até Math.sqrt(np).
Se np for divisível por algum número até sua raiz quadrada, então não é primo.
Tratamento de Casos Especiais:

np < 2 não é primo.
np == 2 é primo diretamente.
Evitamos testar números pares além do 2, pois todos os outros pares são divisíveis por 2.'''
