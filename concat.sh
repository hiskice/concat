#!/bin/bash

# Trouver tous les fichiers qui correspondent au motif 'bdplinvo.txt.*.*' dans le dossier courant
files=$(find . -type f -name "bdplinvo.txt.*.*")
timestamp=$(date +%Y%m%d%H%M%S)

# Parcourir chaque fichier et comparer son contenu avec les fichiers suivants
for file1 in $files; do
  for file2 in $files; do
    # Vérifier si les deux fichiers ont le même contenu et s'ils sont différents
    if [ "$file1" != "$file2" ] && cmp -s "$file1" "$file2"; then
      # Les fichiers ont le même contenu, supprimer l'un d'entre eux
      rm "$file2"
    fi
  done
done

# Concaténer tous les fichiers restants en un seul fichier nommé 'combined_files.txt'
cat bdplinvo.txt.*.* > bdplinvo.txt.$timestamp
