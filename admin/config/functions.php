<?php

// Permet de savoir si un utilisateur est connecté ou pas.
function isConnect(){
    // On vérifie en session que l'index connect existe et soit egal a vrai.
    if (isset($_SESSION['connect']) && $_SESSION['connect'] == true) {
        return true;
    }
    return false;
}