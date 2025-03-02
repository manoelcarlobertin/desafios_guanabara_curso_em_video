require 'colorize'

class FiguraGeometrica
  def self.menu
    puts '=' * 55
    puts 'PROGRAMA DE ÁREAS'.center(55).colorize(:magenta).bold
    puts '=' * 55
    puts "\nEscolha a figura geométrica para calcular a área:".colorize(:cyan)
    puts '''
[1] Triângulo Equilátero
[2] Triângulo Retângulo
[3] Triângulo Qualquer
[4] Quadrado
[5] Retângulo
[6] Losango
[7] Paralelogramo
[8] Quadrilátero Qualquer
[9] Polígono Regular
[10] Círculo
[0] Sair
'''.colorize(:yellow)
  end

  def self.get_input(prompt)
    print prompt.colorize(:green)
    gets.chomp.to_f
  end

  def self.calcular_area(opcao)
    case opcao
    when 1
      lado = get_input('Digite o lado do triângulo equilátero (cm): ')
      area = (Math.sqrt(3) / 4) * (lado**2)
      "Área do Triângulo Equilátero: #{area.round(2)} cm²".colorize(:blue)
    when 2
      base = get_input('Digite a base (cm): ')
      altura = get_input('Digite a altura (cm): ')
      area = (base * altura) / 2
      "Área do Triângulo Retângulo: #{area.round(2)} cm²".colorize(:blue)
    when 3
      base = get_input('Digite a base (cm): ')
      altura = get_input('Digite a altura (cm): ')
      area = (base * altura) / 2
      "Área do Triângulo Qualquer: #{area.round(2)} cm²".colorize(:blue)
    when 4
      lado = get_input('Digite o lado do quadrado (cm): ')
      area = lado**2
      "Área do Quadrado: #{area.round(2)} cm²".colorize(:blue)
    when 5
      base = get_input('Digite a base (cm): ')
      altura = get_input('Digite a altura (cm): ')
      area = base * altura
      "Área do Retângulo: #{area.round(2)} cm²".colorize(:blue)
    when 6
      d1 = get_input('Digite a diagonal maior (cm): ')
      d2 = get_input('Digite a diagonal menor (cm): ')
      area = (d1 * d2) / 2
      "Área do Losango: #{area.round(2)} cm²".colorize(:blue)
    when 7
      base = get_input('Digite a base (cm): ')
      altura = get_input('Digite a altura (cm): ')
      area = base * altura
      "Área do Paralelogramo: #{area.round(2)} cm²".colorize(:blue)
    when 8
      base = get_input('Digite a base (cm): ')
      altura = get_input('Digite a altura (cm): ')
      area = base * altura
      "Área do Quadrilátero Qualquer: #{area.round(2)} cm²".colorize(:blue)
    when 9
      lado = get_input('Digite o lado do polígono (cm): ')
      apotema = get_input('Digite a apótema (cm): ')
      num_lados = get_input('Digite o número de lados: ').to_i
      area = (num_lados * lado * apotema) / 2
      "Área do Polígono Regular: #{area.round(2)} cm²".colorize(:blue)
    when 10
      raio = get_input('Digite o raio do círculo (cm): ')
      area = Math::PI * (raio**2)
      "Área do Círculo: #{area.round(2)} cm²".colorize(:blue)
    when 0
      puts 'Programa encerrado!'.colorize(:red)
      exit
    else
      'Opção inválida!'.colorize(:red)
    end
  end

  def self.run
    loop do
      menu
      opcao = get_input('Escolha uma opção: ').to_i
      mensagem = calcular_area(opcao)
      puts mensagem
      puts '-' * 55
    end
  end
end

FiguraGeometrica.run
