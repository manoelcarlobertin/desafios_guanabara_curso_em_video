# Importa a biblioteca 'time' para usar o método 'sleep'
require 'time'

# Exibe o título do jogo
puts '==== JOGO DE MATEMÁTICA ===='

# Lista de números para o jogo
numeros = [2, 4, 6, 8, 10]

# Escolhe um número aleatório da lista
numero_escolhido = numeros.sample

# Lista de instruções para o jogo
instrucoes = [
  'Pense em um número.',
  'Multiplique o por 2.',
  "Some #{numero_escolhido} à conta.",
  'Divida por 2.',
  'Menos o número que você pensou...'
]

# Exibe as instruções com um intervalo de 4 segundos
instrucoes.each do |instrucao|
  puts instrucao
  sleep(4)
end

# Calcula o resultado final
resultado = numero_escolhido / 2.0

# Exibe o resultado
puts "O resultado será * #{resultado.to_i} *."