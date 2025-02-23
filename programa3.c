#include <stdio.h>
#include <string.h>
#include <ctype.h>
#include <time.h>

// Função para capitalizar o nome
void capitalizarNome(char *nome)
{
  int proxima_letra_maiuscula = 1;

  for (int i = 0; nome[i] != '\0'; i++)
  {
    if (isalpha(nome[i]))
    {
      nome[i] = proxima_letra_maiuscula ? toupper(nome[i]) : tolower(nome[i]);
      proxima_letra_maiuscula = 0;
    }
    else if (nome[i] == ' ')
    {
      proxima_letra_maiuscula = 1;
    }
  }
}

// Função para classificar a idade
const char *classificarIdade(int idade)
{
  return (idade < 12) ? "Criança 🧒" : (idade < 18) ? "Adolescente 🧑"
                                                    : "Adulto 🏆";
}

// Função para obter o ano atual
int obterAnoAtual()
{
  time_t t = time(NULL);
  struct tm *data_atual = localtime(&t);
  return data_atual->tm_year + 1900;
}

// Função para obter e validar o nome
void obterNome(char *nome, int tamanho)
{
  do
  {
    printf("Digite seu nome: ");
    fgets(nome, tamanho, stdin);
    nome[strcspn(nome, "\n")] = '\0'; // Remove o \n do final
    if (strlen(nome) < 2)
    {
      printf("Nome inválido. Digite novamente.\n");
    }
  } while (strlen(nome) < 2);

  capitalizarNome(nome);
}

// Função para obter e validar o ano de nascimento
int obterAnoNascimento(int ano_atual)
{
  int ano_nascimento;
  do
  {
    printf("Digite seu ano de nascimento: ");
    scanf("%d", &ano_nascimento);
    if (ano_nascimento < 1900 || ano_nascimento > ano_atual)
    {
      printf("Ano inválido. Digite um ano entre 1900 e %d.\n", ano_atual);
    }
  } while (ano_nascimento < 1900 || ano_nascimento > ano_atual);
  return ano_nascimento;
}

int main()
{
  char nome[50];
  int ano_nascimento, idade, ano_atual = obterAnoAtual();

  getchar(); // Evita problemas com buffer do teclado ao usar fgets após scanf, entrava * em loop *
  obterNome(nome, sizeof(nome));
  ano_nascimento = obterAnoNascimento(ano_atual);
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
