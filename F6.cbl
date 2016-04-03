	   IDENTIFICATION DIVISION.
	   PROGRAM-ID. F0.
 	   AUTHOR. G3.
       DATE-WRITTEN. 03/04/2016.
       
       ENVIRONMENT DIVISION.
       INPUT-OUTPUT SECTION.
       FILE CONTROL.
       		SELECT COUREUR ASSIGN TO 'COUREUR.SQL'
       			ORGANIZATION IS INDEXED
       			ACCESS MODE IS DYNAMIC
       			RECORD KEY IS CODCOUR
       			//a t-on vraiment besoin de préciser les FK?
       			ALTERNATE RECORD KEY IS CODADR
       			ALTERNATE RECORD KEY IS CODENTR.
       			ALTERNATE RECORD KEY IS CODCIV.
       			
       		SELECT CIVILITE ASSIGN TO 'CIVILITE.SQL'
       			ORGANIZATION IS INDEXED
       			ACCESS MODE IS DYNAMIC
       			RECORD KEY IS CODCIV.
       			
       		SELECT ENTRAINEUR ASSIGN TO 'ENTRAINEUR.SQL'
       			ORGANIZATION IS INDEXED
       			ACCESS MODE IS DYNAMIC
       			RECORD KEY IS CODENTR
       			ALTERNATE RECORD KEY IS CODCIV.
       		
       			
       			
       			
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
      		
      	FD CIVILITE.
      	//pourquoi pas de mise en couleur de fd? possibilité d erreur...
      	01 CIVILITE.
      		02 CODCIV PIC 9(3).
      		02 CIVILITE PIC X(10).
      	//a vérifier
      	
      	FD ENTRAINEUR.
      	01 ENTRAINEUR.
      		02 CODENTR PIC 9(3).
      		02 CODCIV PIC 9(3).
      		02 NOM PIC X(20).
      		02 PRENOM PIC X(20).
      		02 DIPLOME PIC X(25).
      		
      WORKING-STORAGE SECTION.
      77 WCHOIXFIN PIC X.
      
      PROCEDURE DIVISION.
      PRINCIPAL SECTION.
      
      //dans entête afficher nom de l appli, fonction en cours, date du jour
      
      
      CLASSEMENT.
      //open input : on veut lire des infos ds le fichier
      PERFORM EXEC SQL 
      //un truc du genre...
      SELECT C.CODOUR,CIV.CIVILITE,C.NOM,C.PRENOM,C.TOTAL-KM-FAITS,E.CODENT,E.NOM,E.PRENOM
      //pertinence de mettre l adresse?
      FROM COUREUR C, CIVILITE CIV, ENTRAINEUR E
      //JOINTURE
      WHERE C.CODENTR = E.CODENTR
      AND C.CODCIV = CIV.CODCIV
      ORDER BY C.TOTAL-KM-FAITS DESC
      //affichage du résultat dans partir médiane
      FIN_CLASSEMENT.
      
      CHOIX_FINAL.
      //fin donc proposer menu ou quitter dans bas de page ligne 22
      DISPLAY "Saisissez m pour retourner au menu et q pour quitter le programme.".
      //choix ligne 23 ; WCHOIXFIN 'q' ou 'm'
      MOVE SPACES TO WCHOIXFIN.
      ACCEPT WCHOIXFIN.
      //verifier le choix
      //3 erreurs possibles
      FIN_CHOIX_FINAL.
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      