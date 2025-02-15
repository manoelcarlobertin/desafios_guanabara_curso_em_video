# Códigos ANSI para cores
VERDE = "\e[32m"; VERMELHO = "\e[31m"; RESET = "\e[0m"
def colorir_letras(palavra)
  palavra.chars.map do |letra|
    cor = [VERDE, VERMELHO].sample # Escolhe aleatoriamente entre verde e vermelho
    "#{cor}#{letra}#{RESET}"
  end.join
end
# puts "Os segmentos *#{colorir_letras("PODEM")}*"