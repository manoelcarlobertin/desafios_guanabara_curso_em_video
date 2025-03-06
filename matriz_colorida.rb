require 'colorize'

def gerar_matriz(linhas, colunas)
  matriz = []
  numero = 1
  linhas.times do
    linha = []
    colunas.times do
      linha << numero
      numero += 1
    end
    matriz << linha
  end
  matriz
end

def imprimir_matriz(matriz)
  matriz.each do |linha|
    print "| ".colorize(:blue)
    linha.each do |numero|
      print "#{numero.to_s.rjust(2)} ".colorize(:green)
    end
    puts "|".colorize(:blue)
  end
end

def desenhar_colchetes(matriz)
  tamanho_linha = matriz[0].size * 3 + 3
  puts ("")
  imprimir_matriz(matriz)
  puts ("")
end

# Definindo o tamanho da matriz
linhas = 4
colunas = 6

# Gerando a matriz
matriz = gerar_matriz(linhas, colunas)

# Imprimindo a matriz com colchetes
desenhar_colchetes(matriz)