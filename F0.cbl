       IDENTIFICATION DIVISION.
       PROGRAM-ID. F0.
       AUTHOR. G3.
       DATE-WRITTEN. 01/04/2016.
       
       ENVIRONMENT DIVISION.
       INPUT-OUTPUT SECTION.
       FILE CONTROL.
       		SELECT COUREUR ASSIGN TO 'COUREUR.SQL'
       			ORGANIZATION IS INDEXED
       			ACCESS MODE IS DYNAMIC
       			RECORD KEY IS CODCOUR
       			ALTERNATE RECORD KEY IS CODADR
       			ALTERNATE RECORD KEY IS CODENTR.
       			ALTERNATE RECORD KEY IS CODCIV.
       		
       		SELECT SEMAINE ASSIGN TO 'SEMAINE.SQL'
       			ORGANIZATION IS INDEXED
       			ACCESS MODE IS DYNAMIC
       			RECORD KEY IS CODSEM.
       			
       			
       		SELECT A-FAIRE ASSIGN TO 'A-FAIRE.SQL'
       			ORGANIZATION IS INDEXED
       			ACCESS MODE IS DYNAMIC
       			RECORD KEY IS CODCOUR
       			RECORD KEY IS CODSEM
       			ALTERNATE RECORD KEY IS CODCOUR
       			ALTERNATE RECORD KEY IS CODSEM.
       			
       		SELECT CIVILITE ASSIGN TO 'CIVILITE.SQL'
       			ORGANIZATION IS INDEXED
       			ACCESS MODE IS DYNAMIC
       			RECORD KEY IS CODCIV.
       			
       	
      DATA DIVISION.
      FILE SECTION.
      FD COUREUR.
      01 COUREUR.
      	02 CODCOUR PIC 9(3).
      	02 CODCIV PIC 9(3).
      	02 NOM PIC X(20).
      	02 PRENOM PIC X(20).
      	02 CODADR PIC 9(3).
      	02 TOTAL-KM-FAITS PIC 9(5).
      	02 CODENTR PIC 9(3).
      	
      FD SEMAINE.
      01 SEMAINE.
      	02 CODSEM PIC 9(2).
      	02 GRANDTOUR PIC X(10).
      	
      FD A-FAIRE.
      01 A-FAIRE.
      	02 CODCOUR PIC 9(3).
      	02 CODSEM PIC 99.
      	02 KM-A-FAIRE PIC 9(4).
      	02 JOUR DATE.
      	//VERIFIER
      	
      FD CIVILITE.
      01 CIVILITE.
      	02 CODCIV PIC 9(3).
      	02 CIVILITE PIC X(10).
      //a vérifier
      
      
      
      
      WORKING-STORAGE SECTION.
      77 WCHOIX PIC 9.
      77 WCHOIX1 PIC X.
      77 WCHOIXFIN PIC X.
      
      PROCEDURE DIVISION.
      PRINCIPAL SECTION.
      
      //dans entête afficher nom de l appli, fonction en cours, date du jour
      
      
      AFFICHAGE_WCHOIX.
      //affichage des deux modes disponibles dans bas de page ligne 22
      DISPLAY 1 "Mode 1 : pour un grand tour en particulier".
      DISPLAY 2 "Mode 2 : pour tous les grands tours".
      FIN_AFFICHAGE_WCHOIX.
      
      
      SAISIE_CHOIX.
      //choix du mode dans bas de page ligne 23 WCHOIX
      DISPLAY "Indiquez votre choix".
      MOVE ZEROES TO WCHOIX.
      ACCEPT WCHOIX.
      FIN_SAISIE_WCHOIX.
      
      
      VERIFICATION_WCHOIX.
      //vérification du choix
      //3 erreurs possibles donc repartir de saisie_choix
      FIN_VERIFICATION_WCHOIX.
      
      
      MODE1.
      //mode 1 : un grand tour
      //besoin de coureur, a faire, semaine
      //open input
      //affichage des tours disponibles grandtour bas de page ligne 22
      //puis saisie du tour dans WCHOIX1 bas de page ligne 23
      DISPLAY "Quel grand tour souhaitez-vous consulter?".
      DISPLAY "F = France, G = Giro, V = Vuelta".
      MOVE SPACES TO WCHOIX1.
      ACCEPT WCHOIX1.
      //vérification du choix 
      //3 erreurs possibles
      select c.codcour,s.codsem,civ.civilite,c.nom,c.prenom
      //verifier civ.civilite
      //pertinence de mettre l adresse?
      from coureur c,a-faire af,semaine s, civilite civ
      //jointure
      where c.codcour = af.codcour
      and s.codsem = af.codsem
      and civ.codciv = c.codciv
      //conditions
      and c.codcour not in
      (select af.codcour,s.codsem,s.grandtour from semaine s,a-faire af where s.grandtour = 'wchoix1')
      //display le résultat dans partie médiane 
      FIN_MODE1.
      
      
      MODE2.
      //mode 2 : tous les tours
      //open input
      select c.codcour,s.codsem,civ.civilite,c.nom,c.prenom
      from coureur c,a-faire af,semaine s, civilite civ
      //jointure
      where c.codcour = af.codcour
      and s.codsem = af.codsem
      and civ.codciv = c.codciv
      //conditions a reprendre
      and c.codcour not in af.codcour
      //display le résultat dans partie médiane 
      FIN_MODE2.
      
      
      CHOIX_FINAL.
      //fin donc proposer menu ou quitter dans bas de page ligne 22
      DISPLAY "Saisissez m pour retourner au menu et q pour quitter le programme.".
      //choix ligne 23 ; WCHOIXFIN 'q' ou 'm'
      MOVE SPACES TO WCHOIXFIN.
      ACCEPT WCHOIXFIN.
      //verifier le choix
      //3 erreurs possibles
      FIN_CHOIX_FINAL.
      
      
      
      
      
      
      
       