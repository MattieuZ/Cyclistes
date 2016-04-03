       IDENTIFICATION DIVISION.
       PROGRAM-ID. CYCLISTE.
       AUTHOR. G3.
       DATE-WRITTEN. 01/04/2016.
       
       ENVIRONMENT DIVISION.
       INPUT-OUTPUT SECTION.
       FILE CONTROL.
       		SELECT nom_logique ASSIGN TO 'nom_file'
       			ORGANIZATION IS
       			ACCESS MODE IS
       			RECORD KEY IS
       			ALTERNATE RECORD KEY IS .
       	
      DATA DIVISION.
      FILE SECTION.
      FD nom_logique.
      NN
      WORKING-STORAGE SECTION.
      77 WCHOIX PIC 9.
      77 WERREUR PIC 9 VALUE 0.
      77 WACCEPTE PIC X(5) VALUE 'FALSE'.
      
      PROCEDURE DIVISION.
      PRINCIPAL SECTION.
      
      AFFICHAGE_MENU.
      //perform jusqu a erreur=3 ???ici ou avant choix? 
      //normalement taille la fenêtre médiane suffisante pour ne pas avoir à réaficher le menu 
      //affichage du menu
      DISPLAY 0 "Affichage des coureurs oisifs".
      DISPLAY 1 "Mise à jours du fichier des coureurs".
      DISPLAY 2 "Enregistrement des programmes à effectuer".
      DISPLAY 3 "Enregistrement des entraînements effectues".
      DISPLAY 4 "Mise à jour des entraîneurs".
      DISPLAY 5 "Avancement des entraînements".
      DISPLAY 6 "Classement des coureurs".
      DISPLAY 7 "Remise à zero des entraînements d'une semaine".
      DISPLAY Q "Quitter".
      //dans la partie mediane
      //effacer le message d erreur précédent s il y en a un
      FIN_AFFICHAGE_MENU.
      
      
      SAISIE_CHOIX.
      //perform varying Werreur FROM 0 by 1 until Waccepte=true thru verification
      //inviter à saisir son choix
      DISPLAY "Indiquez votre choix".
      MOVE ZEROES TO WCHOIX.
      ACCEPT WCHOIX.
      //dans partie médiane
      FIN_SAISIE_CHOIX.
      
      
      VERIFICATION.
      //vérification du choix
      IF WCHOIX < 8 AND WCHOIX > -1
      //j ai le droit pour -1?
      THEN MOVE 'TRUE' TO WACCEPTE
      //besoin de quotes autour de true?
      ELSE IF WCHOIX = Q
      THEN MOVE 'TRUE' TO WACCEPTE
      ELSE DISPLAY "Choix non conforme, recommencez s'il vous plait. Il vous reste " erreur " tentatives."
      //affichage message d erreur dans partie inférieure ligne 21
      //MESSAGES D ERREUR DIFFERENTS SELON TYPE D ERREUR
      //effacement des données erronées donc remise à zero de choix
      //fait grâce au move zeroes to wchoix?
      FIN_VERIFICATION.
      
      
      APPEL_SOUS_PROGRAMMES.
      EVALUATE CHOIX.
      WHEN "0"
      		CALL "F0"
      WHEN "1"
      		CALL "F1"
      WHEN "2"
      		CALL "F2"
      WHEN "3"
      		CALL "F3"
      WHEN "4"
      		CALL "F4"
      WHEN "5"
      		CALL "F5"
      WHEN "6"
      		CALL "F6"
      WHEN "7"
      		CALL "F7"
      WHEN "Q"
      		EXIT.
      FIN_APPEL_SOUS_PROGRAMMES.
      
      STOP RUN.
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
       
       
       