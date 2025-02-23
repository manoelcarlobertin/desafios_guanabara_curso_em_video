<?php

class Pessoa
{
  protected string $nome;
  protected int $anoNascimento;
  protected int $idade;

  public function __construct($nome, $anoNascimento)
  {
    $this->nome = $this->capitalizarNome($nome);
    $this->anoNascimento = (int) $anoNascimento;
    $this->idade = $this->calcularIdade();
  }

  private function capitalizarNome(string $nome): string
  {
    return ucwords(mb_strtolower($nome));
  }

  private function calcularIdade(): int
  {
    return date("Y") - $this->anoNascimento;
  }

  public function determinarFaixaEtaria(): string
  {
    return ($this->idade < 12) ? "Criança 🧒" : (($this->idade < 18) ? "Adolescente 🧑" : "Adulto 🏆");
  }

  public function imprimirInformacoes(): void
  {
    echo "<h2>🎉 Informações do Usuário 🎉</h2>";
    echo "<p>📝 Nome: {$this->nome}</p>";
    echo "<p>🎂 Idade: {$this->idade} anos</p>";
    echo "<p>📌 Faixa Etária: " . $this->determinarFaixaEtaria() . "</p>";
  }
}

if ($_SERVER["REQUEST_METHOD"] == "POST") {
  $nome = $_POST["nome"] ?? "";
  $anoNascimento = $_POST["ano_nascimento"] ?? 0;

  if (!empty($nome) && is_numeric($anoNascimento) && $anoNascimento > 1900 && $anoNascimento <= date("Y")) {
    $usuario = new Pessoa($nome, $anoNascimento);
    $usuario->imprimirInformacoes();
  } else {
    echo "<p>❌ Dados inválidos. Tente novamente.</p>";
  }
}
