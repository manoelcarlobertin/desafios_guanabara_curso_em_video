<!DOCTYPE html>
<html lang="pt-BR">

<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Cadastro de Usuário</title>
</head>

<body>
  <h2>Cadastro de Usuário</h2>
  <form action="processar.php" method="POST">
    <label for="nome">Nome:</label>
    <input type="text" id="nome" name="nome" required>
    <br>
    <label for="ano_nascimento">Ano de Nascimento:</label>
    <input type="number" id="ano_nascimento" name="ano_nascimento" required>
    <br>
    <button type="submit">Cadastrar</button>
  </form>
</body>

</html>