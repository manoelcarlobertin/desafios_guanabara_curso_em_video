puts "Digite o ano de nascimento do aluno: "
nascimento = gets.chomp.to_i

idade = Time.now.year - nascimento # Cálculo da idade simplificado.

# Definição das categorias por idade # Uso do case para tornar a lógica mais clara.
categoria = case idade
            when 0...10 then "MIRIM" # verifica o array de idades [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]
            when 10...15 then "INFANTIL"
            when 15...20 then "JUNIOR"
            when 20...25 then "SENIOR"
            else "MASTER"
            end

# Exibe a categoria do aluno
puts "\n#{categoria}. O aluno tem #{idade} anos, então se encaixa nessa categoria."
# Interpolação de strings para maior legibilidade em apenas 1 linha.
