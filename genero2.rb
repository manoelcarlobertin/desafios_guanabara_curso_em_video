def prompt_gender(message)
  print message
  gets.chomp.strip.upcase
end

def gender_label(code)
  labels = {
    'F' => ["\e[43mA Female\e[0m", "\e[43mUma Mulher\e[0m 🧑‍🦰"],
    'M' => ["\e[45mA Male\e[0m", "\e[45mUm Homem\e[0m 🧑‍🦱"],
    'I' => ["\e[46mAn Intersex\e[0m", "\e[46mUma Pessoa Intersexo\e[0m 🌈"]
  }
  label = labels[code]
  "#{label[0]} / #{label[1]}"
end

valid_codes = ['F', 'M', 'I']
gender = prompt_gender("🎯Type your gender: (F, M, I)\n> ")

until valid_codes.include?(gender) # aqui é o loop infinito.
  gender = prompt_gender("❌Oops! Invalid option... Try again 😅.Please, insert a valid value: (F, M, I)\n> ")
end

puts "🔑You chose: #{gender}, which means you are #{gender_label(gender)}!"
