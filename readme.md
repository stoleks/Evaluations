# Évaluations

Dossier contenant toutes mes évaluations pour mes cours de physique-chimie au lycée.
Actuellement trois niveaux existent : seconde générales et technologiques (GT), première sciences et technologies de la santé et du social (ST2S) et terminale ST2S.


## Licence 

Certains sujets viennent des banques de données publiques du bac, mais la mise en page dans les .tex est de moi et tous les .tex sont sous [licence creative common (CC-BY-4.0)](https://creativecommons.org/licenses/by/4.0/). Vous pouvez donc les utiliser comme vous voulez en créditant leur origine.


## Organisation des fichiers

Les fichiers sont organisés par dossiers :

- *commun* contient des fichiers utilisés sur plusieurs niveaux.
- *images* contient les images utilisées dans les sujets. Pour les images que j'ai fait, vous pouvez voir le projet [Cours](https://github.com/stoleks/Cours/tree/main/images).
- *molecules* contient les fichiers .tex pour générer de courtes évaluations sur des biomolécules, pour les premières ST2S ou les terminales ST2S.
- *molecules_A4* contient les évaluations sur les molécules format A4, pour les projeter.
- *molecules_A5* contient les évaluations sur les molécules format A5, prêtes à être imprimées.
- *seconde* contient toutes les évaluations pour les secondes GT.
- *stssPremiere* contient toutes les évaluations pour les premières ST2S.
- *stssTerminale* contient toutes les évaluations pour les terminales ST2S.


## Génération des évaluations sur les molécules organiques

Il suffit d'appeler le scrip generation_molecules.sh, en ayant commenté toutes les autres évaluations auparavant.

    sh generation_molecules.sh

Le script génère un fichier format A4 (pour la projection) et un fichier format A5 (pour l'impression), avec un nom basé sur le nom du fichier .tex de la molécule dans molecules/


## Contact

Si vous avez des questions, vous pouvez me contacter à alexandre[point]jedrecy[at]ac-creteil.fr
