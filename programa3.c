#include <stdio.h>
#include <string.h>
#include <ctype.h>
#include <time.h>

// Função para capitalizar o nome
void capitalizarNome(char *nome)
{
  int novo_nome = 1; // Define que o próximo caractere deve ser maiúsculo

  for (int i = 0; nome[i] != '\0'; i++)
  {
    if (novo_nome && isalpha(nome[i]))
    {
      nome[i] = toupper(nome[i]); // Primeira letra maiúscula
      novo_nome = 0;
    }
    else
    {
      nome[i] = tolower(nome[i]); // Restante minúsculo
    }

    if (nome[i] == ' ')
    {
      novo_nome = 1; // Próxima palavra começa após um espaço
    }
  }
}

// Função para classificar a idade
const char *classificarIdade(int idade)
{
  if (idade < 12)
    return "Criança 🧒";
  else if (idade < 18)
    return "Adolescente 🧑";
  else
    return "Adulto 🏆";
}

int main()
{
  char nome[50];
  int ano_nascimento, idade;
  time_t t = time(NULL);
  struct tm *data_atual = localtime(&t);
  int ano_atual = data_atual->tm_year + 1900;

  printf("Digite seu nome: ");
  fgets(nome, sizeof(nome), stdin);
  nome[strcspn(nome, "\n")] = '\0'; // Remove o \n do final

  while (strlen(nome) < 2)
  {
    printf("Nome inválido. Digite novamente: ");
    fgets(nome, sizeof(nome), stdin);
    nome[strcspn(nome, "\n")] = '\0';
  }

  capitalizarNome(nome); // Capitaliza o nome

  printf("Digite seu ano de nascimento: ");
  scanf("%d", &ano_nascimento);

  while (ano_nascimento < 1900 || ano_nascimento > ano_atual)
  {
    printf("Ano inválido. Digite novamente: ");
    scanf("%d", &ano_nascimento);
  }

  idade = ano_atual - ano_nascimento;

  printf("\n============================\n");
  printf("🎉 Dados do Usuário 🎉\n");
  printf("============================\n");
  printf("📝 Nome: %s\n", nome);
  printf("🎂 Idade: %d anos\n", idade);
  printf("📌 Classificação: %s\n", classificarIdade(idade));
  printf("============================\n");

  return 0;
}
