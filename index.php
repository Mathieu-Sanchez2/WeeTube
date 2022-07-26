<?php 
    include 'config/config.php';
    include 'admin/config/bdd.php';
    $sql = 'SELECT * FROM video';
    $req = $bdd->query($sql);
    $videos = $req->fetchAll(PDO::FETCH_ASSOC);
    var_dump($videos);
    
    // $mdp = password_hash('azerty', PASSWORD_DEFAULT);
    // echo $mdp;
    // var_dump(password_verify('azerty', $mdp));

?>  
<!doctype html>
<html lang="fr">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>WeeTube</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor" crossorigin="anonymous">
  </head>
  <body>
  <?php include 'includes/menu.php'; ?>
    <div class="container">
    <?php foreach ($videos as $video) : ?>
        <div class="card">
            <!-- <img src="http://localhost/WeeTube/img/illustration/illustration1.png" alt="" width="100%" height="200">  -->
            <video controls width="250">
                <source src="<?= URL_ROOT ?>video/<?= $video['slug'] ?>"
                        type="video/mp4">
                Sorry, your browser doesn't support embedded videos.
            </video>
            <div class="card-body">
                <h5 class="card-title"><?= $video['titre'] ?></h5>
                <p class="card-text"><?= $video['description'] ?></p>
            </div>
        </div>
    <?php endforeach; ?>
        <!-- <div class="row mt-2">
            <div class="col">
                <div class="card">
                    <img src="http://localhost/WeeTube/img/illustration/illustration1.png" alt="" width="100%" height="200"> 
                    <div class="card-body">
                        <h5 class="card-title">Titre de la vidéo</h5>
                        <p class="card-text">Description de la vidéo [...]</p>
                    </div>
                </div>
            </div>
            <div class="col">
                <div class="card">
                    <img src="http://localhost/WeeTube/img/illustration/illustration2.png" alt="" width="100%" height="200"> 
                    <div class="card-body">
                        <h5 class="card-title">Titre de la vidéo</h5>
                        <p class="card-text">Description de la vidéo [...]</p>
                    </div>
                </div>
            </div>
            <div class="col">
                <div class="card">
                    <img src="http://localhost/WeeTube/img/illustration/illustration1.png" alt="" width="100%" height="200"> 
                    <div class="card-body">
                        <h5 class="card-title">Titre de la vidéo</h5>
                        <p class="card-text">Description de la vidéo [...]</p>
                    </div>
                </div>
            </div>
        </div>
        <div class="row mt-2">
            <div class="col">
                <div class="card">
                    <img src="http://localhost/WeeTube/img/illustration/illustration1.png" alt="" width="100%" height="200"> 
                    <div class="card-body">
                        <h5 class="card-title">Titre de la vidéo</h5>
                        <p class="card-text">Description de la vidéo [...]</p>
                    </div>
                </div>
            </div>
            <div class="col">
                <div class="card">
                    <img src="http://localhost/WeeTube/img/illustration/illustration2.png" alt="" width="100%" height="200"> 
                    <div class="card-body">
                        <h5 class="card-title">Titre de la vidéo</h5>
                        <p class="card-text">Description de la vidéo [...]</p>
                    </div>
                </div>
            </div>
            <div class="col">
                <div class="card">
                    <img src="http://localhost/WeeTube/img/illustration/illustration1.png" alt="" width="100%" height="200"> 
                    <div class="card-body">
                        <h5 class="card-title">Titre de la vidéo</h5>
                        <p class="card-text">Description de la vidéo [...]</p>
                    </div>
                </div>
            </div>
        </div>
        <div class="row mt-2">
            <div class="col">
                <div class="card">
                    <img src="http://localhost/WeeTube/img/illustration/illustration1.png" alt="" width="100%" height="200"> 
                    <div class="card-body">
                        <h5 class="card-title">Titre de la vidéo</h5>
                        <p class="card-text">Description de la vidéo [...]</p>
                    </div>
                </div>
            </div>
            <div class="col">
                <div class="card">
                    <img src="http://localhost/WeeTube/img/illustration/illustration2.png" alt="" width="100%" height="200"> 
                    <div class="card-body">
                        <h5 class="card-title">Titre de la vidéo</h5>
                        <p class="card-text">Description de la vidéo [...]</p>
                    </div>
                </div>
            </div>
            <div class="col">
                <div class="card">
                    <img src="http://localhost/WeeTube/img/illustration/illustration1.png" alt="" width="100%" height="200"> 
                    <div class="card-body">
                        <h5 class="card-title">Titre de la vidéo</h5>
                        <p class="card-text">Description de la vidéo [...]</p>
                    </div>
                </div>
            </div>
        </div> -->
    </div>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js" integrity="sha384-pprn3073KE6tl6bjs2QrFaJGz5/SUsLqktiwsUTF55Jfv3qYSDhgCecCxMW52nD2" crossorigin="anonymous"></script>
  </body>
</html>
