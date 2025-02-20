class CalculadoraIMC # Encapsulamento - para agrupar as funções relacionadas ao cálculo do IMC.
  # Execução automática:
  # O método initialize já inicia fluxo de entrada dados e cálculos, tornando o uso da classe mais prático.
  def initialize
    @peso = obter_valor_positivo("Digite o seu peso (ex: 100 kg): ") # atributos de instância, melhorando
    @altura = obter_valor_positivo("Digite a sua altura (ex: 1.80 m): ") # a organização e evitando conflitos.
    calcular_resultados
  end
  # Separação de responsabilidades:
  # Cada método tem uma responsabilidade clara.
  def obter_valor_positivo(mensagem)
    valor = nil
    loop do
      print mensagem
      valor = gets.chomp.to_f
      break if valor.positive?

      puts "❌ Valor inválido! Digite um número positivo."
    end
    return valor
  end

  def calcular_imc
    # uso * atributos de instancia da classe * melhorando a organização e evitando conflito
    (@peso / (@altura**2)).round(2) # usando atributos de instância: (@peso, @altura, @imc).
  end

  def classificar_imc
    case @imc # utiliza um * case * para classificar o IMC em diferentes faixas.
    when 0..16.9
      "MUITO ABAIXO do peso - Queda de cabelo, infertilidade, ausência menstrual."
    when 17.0..18.4
      "ABAIXO do peso - Fadiga, stress, ansiedade."
    when 18.5..24.9
      "com o peso NORMAL - Menor risco de doenças cardíacas e vasculares."
    when 25.0..29.9
      "ACIMA do peso - Fadiga, má circulação, varizes."
    when 30.0..34.9
      "com OBESIDADE DE PRIMEIRO GRAU - Diabetes, angina, infarto, aterosclerose."
    when 35.0..39.9
      "com OBESIDADE DE SEGUNDO GRAU - Apnéia do sono, falta de ar."
    else
      "com OBESIDADE DE TERCEIRO GRAU - Refluxo, dificuldade para se mover, escaras, diabetes, infarto, AVC."
    end
  end

  def calcular_peso_ideal
    peso_min = (18.5 * @altura**2).round(1)
    peso_max = (24.9 * @altura**2).round(1)
    peso_a_ganhar = [(peso_min - @peso).round(1), 0].max
    peso_a_perder = [(@peso - peso_max).round(1), 0].max

    { peso_min: peso_min, peso_max: peso_max, peso_a_ganhar: peso_a_ganhar, peso_a_perder: peso_a_perder }
  end

  def calcular_resultados
    @imc = calcular_imc
    peso_ideal = calcular_peso_ideal

    puts "\nSeu IMC é #{@imc}. Você está #{classificar_imc}."

    if @imc < 18.5
      puts "⚠️ Você precisa engordar pelo menos #{peso_ideal[:peso_a_ganhar]} kg para atingir o peso ideal."
    elsif @imc >= 25
      puts "⚠️ Você precisa emagrecer pelo menos #{peso_ideal[:peso_a_perder]} kg para atingir o peso ideal."
    else
      puts "✅ Parabéns! Você já está dentro do peso ideal!"
    end

    puts "Seu peso ideal está entre #{peso_ideal[:peso_min]} kg e #{peso_ideal[:peso_max]} kg."
  end
end
# Fim do encapsulamento.

CalculadoraIMC.new
# Executa a classe.
# a classe pode ser instanciada e usada diretamente para calcular e exibir o IMC e o peso ideal! 🚀
