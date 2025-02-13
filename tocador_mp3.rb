begin
  require 'launchy'
rescue LoadError
  puts "🚨 O erro indica que a gem 'Launchy' não está instalada no seu ambiente Ruby."
  puts "💡 Para resolver isso, siga os passos abaixo:"
  puts "1️⃣ No terminal, execute o seguinte comando para instalar a gem:"
  puts "   👉 gem install launchy"
  puts "2️⃣ Após a instalação, abra o IRB (console interativo do Ruby) e digite os seguintes comandos para testar:"
  puts "   👉 require 'launchy'"
  puts "   👉 puts 'Launchy carregado com sucesso!'"
  puts "   Se não houver erro, significa que a gem está instalada corretamente. ✅"
  puts "3️⃣ Agora, execute novamente seu script com o comando:"
  puts "   👉 ruby tocador_mp3.rb"
  exit # Sai do script para evitar execução adicional
end

url = "https://www.letras.mus.br/new-model-army/208247/significado.html"

begin
  Launchy.open(url)
rescue Launchy::Error => e
  puts "Ocorreu um erro ao abrir o navegador: #{e.message}"
end

puts "Página aberta no navegador. Clique no botão de play para ouvir a música."
