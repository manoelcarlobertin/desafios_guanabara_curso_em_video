require 'selenium-webdriver'

# Classe responsável por manipular o navegador Selenium
class SeleniumWebDriver
  attr_reader :driver

  def initialize
    options = Selenium::WebDriver::Firefox::Options.new
    options.binary = "/usr/bin/firefox" # Ajuste para o caminho correto
    # options.add_argument('--start-maximized')
    @driver = Selenium::WebDriver.for(:firefox, options: options)
  end

  def tocar_som(url, css_selector)
    begin
      driver.navigate.to "https://www.google.com"
      sleep 5 # Espera o carregamento da página
      play_button = driver.find_element(css: css_selector)
      play_button.click
      puts "🎵 Som iniciado com sucesso!"
      sleep 10 # Tempo para ouvir o som
    rescue StandardError => e
      puts "Erro ao tentar reproduzir o som: #{e.message}"
    ensure
      driver.quit
    end
  end
end

# Classe que gerencia a contagem regressiva
class ContagemRegressiva
  def initialize(tempo)
    @tempo = tempo
  end

  def iniciar
    puts "⏳ Contagem regressiva iniciada!"
    @tempo.downto(0) do |segundo|
      puts "#{segundo} segundo#{segundo == 1 ? '' : 's'}..."
      sleep 1
    end
    puts "🚀 Tempo esgotado!"
    tocar_som
  end

  private

  def tocar_som
    navegador = SeleniumWebDriver.new
    navegador.tocar_som("https://freesound.org/people/DanJFilms/sounds/786289/", '.play-button')
  end
end

# Inicia a contagem regressiva de 10 segundos
ContagemRegressiva.new(10).iniciar
