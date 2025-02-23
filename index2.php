<?php

class Pessoa
{
  protected string $nome;
  protected int $anoNascimento;
  protected int $idade;

  public function __construct()
  {
    $this->nome = "";
    $this->anoNascimento = 0;
    $this->idade = 0;
  }

  public function calcularIdade(): void
  {
    $this->idade = date("Y") - $this->anoNascimento;
  }
}

class Usuario extends Pessoa
{
  public function cadastrarUsuario(): void
  {
    $this->nome = $this->obterNome();
    $this->anoNascimento = $this->obterAnoNascimento();
    $this->calcularIdade(); // Calcula a idade após definir o ano de nascimento
  }

  private function obterNome(): string
  {
    do {
      echo "Digite seu nome (somente letras): ";
      $nome = trim(fgets(STDIN));

      if (!$this->validarNome($nome)) {
        echo "Nome inválido! Digite apenas letras do alfabeto em português.\n";
        $nome = ""; // Força repetição
      }
    } while (empty($nome));

    return $this->capitalizarNome($nome);
  }

  private function validarNome(string $nome): bool
  {
    return preg_match("/^[A-Za-zÀ-ÖØ-öø-ÿ\s]+$/", $nome);
  }

  private function capitalizarNome(string $nome): string
  {
    return ucwords(mb_strtolower($nome));
  }

  private function obterAnoNascimento(): int
  {
    $anoAtual = date("Y");

    while (true) {
      echo "Digite seu ano de nascimento: ";
      $ano = trim(fgets(STDIN));

      if (ctype_digit($ano)) {
        $ano = (int) $ano;
        if ($ano > 1900 && $ano <= $anoAtual) {
          return $ano;
        }
      }
      echo "Ano inválido. Digite um ano entre 1900 e $anoAtual.\n";
    }
  }

  private function determinarFaixaEtaria(): string
  {
    return ($this->idade < 12) ? "Criança 🧒" : (($this->idade < 18) ? "Adolescente 🧑" : "Adulto 🏆");
  }

  public function imprimirInformacoes(): void
  {
    echo "\n============================\n";
    echo "🎉 Informações do Usuário 🎉\n";
    echo "============================\n";
    echo "📝 Nome: {$this->nome}\n";
    echo "📆 Ano de Nascimento: {$this->anoNascimento}\n";echo "🎂 Idade: {$this->idade} anos\n";
    echo "📌 Faixa Etária: " . $this->determinarFaixaEtaria() . "\n";
    echo "============================\n";
  }
}

$usuario = new Usuario();
$usuario->cadastrarUsuario();
$usuario->imprimirInformacoes();
