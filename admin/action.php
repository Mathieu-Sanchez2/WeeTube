<?php 
include 'config/config.php';
include 'config/bdd.php';

if (isset($_POST['btn_connexion'])){
    // vérification des champs

    // Vérification de l'user
    // Génération de la req SQL
    $sql = "SELECT * FROM utilisateur WHERE mail = :mail";
    // préparation de la requete SQL
    $req = $bdd->prepare($sql);
    // On fait le lien entre les marqueurs et les variables du script
    $data = [
        ':mail' => $_POST['mail']
    ];
    // on execute la requete preparer
    $req->execute($data);
    // On récupere les données sous forme de tableau associatif
    $utilisateur = $req->fetch(PDO::FETCH_ASSOC);
    // debug du resultat
    var_dump($utilisateur);
    if (!$utilisateur) {
        // Erreur l'user n'existe pas
        $_SESSION['connect'] = false;
        // redirection
        header('Location:login.php');
        die;
    }
    if (!password_verify($_POST['mdp'], $utilisateur['mdp'])){
        // Erreur le mdp ne correspond pas au mdp enregistré
        $_SESSION['connect'] = false;
        // redirection
        header('Location:login.php');
        die;
    }
    // déclaration en session de la connexion + sauvegarde de l'utilisateur
    $_SESSION['connect'] = true;
    // on supprimer le mdp de l'utilisateur dans le tableau
    unset($utilisateur['mdp']);
    // On enregistre l'utilisateur
    $_SESSION['utilisateur'] = $utilisateur;
    // Redirection
    header('Location:index.php');
    die;
}

if (isset($_GET['logout']) && $_GET['logout'] == true){
    session_destroy();
    // $_SESSION = [];
    header('Location:http://weetube.wip');
    die;
}