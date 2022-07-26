<?php 
    include 'config/config.php';
    var_dump(isConnect());
    if (isConnect()) {
        header('Location:index.php');
        die;
    }
?>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-gH2yIJqKdNHPEq0n4Mqa/HGKIhSkIHeL5AyhkYV8i59U5AR6csBvApHHNl/vI1Bx" crossorigin="anonymous">
    <title>Login</title>
</head>
<body>
    <div class="container">
        <h1 class="text-center mt-4">Page de connexion</h1>
        <form action="action.php" method="post">
        <div class="mb-3">
            <label for="mail" class="form-label">Adresse mail :</label>
            <input type="text" class="form-control" name="mail" id="mail" placeholder="name@example.com">
        </div>
        <div class="mb-3">
            <label for="mdp" class="form-label">Mot de passe :</label>
            <input type="text" class="form-control" name="mdp" id="mdp" placeholder="name@example.com">
        </div>
        <div class="mb-3 text-center">
            <input type="submit" name="btn_connexion" id="btn_connexion" value="connexion" class="btn btn-primary">
        </div>

        </form>
    </div>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-A3rJD856KowSb7dwlZdYEkO39Gagi7vIsF0jrRAoQmDKKtQBHUuLZ9AsSv4jD4Xa" crossorigin="anonymous"></script>
</body>
</html>