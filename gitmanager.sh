#!/bin/bash

echo "Selecciona una opción:"
echo "1) Iniciar repositorio"
echo "2) Publicar repositorio"
echo "3) Actualizar repositorio"
echo "4) Cambiar de branch (crear si no existe)"
echo "5) Actualizar el master a partir de un branch"
echo "6) Salir"
read -p "Opción: " opcion

case $opcion in
  1)
    if [ ! -d ".git" ]; then
        git init
    fi

    if [ ! -f "README.md" ]; then
        touch README.md
    fi
    ;;
  2)
    git add .
    read -p "Descripción del commit: " desc
    git commit -m "$desc"
    git branch -M master
    read -p "Nombre de usuario: " gitname
    read -p "Nombre del repositorio: " repo

    if ! git remote get-url origin >/dev/null 2>&1; then
        git remote add origin git@github.com:"$gitname"/"$repo".git
    fi

    git push -u origin master
    ;;
  3)
    read -p "Elegir branch: " branch
    if git ls-remote --exit-code --heads origin "$branch" >/dev/null 2>&1; then
      git pull origin "$branch"
    fi
    git add .
    read -p "Descripción del commit: " desc
    git commit -m "$desc"
    git push -u origin "$branch"
    ;;
  4)
    read -p "Crear nombre del branch: " branch
    if git show-ref --verify --quiet refs/heads/"$branch"; then
        git checkout "$branch"
    else
        git checkout -b "$branch"
    fi
    ;;
  5)
    read -p "nombre del branch que quieres fusionar: " merge
    current_branch=$(git branch --show-current)
    git checkout master
    git merge "$merge"
    git pull origin master
    git add .
    read -p "Descripción del commit: " desc
    git commit -m "$desc"
    git push -u origin master
    git checkout "$current_branch"
    ;;
  6)
    exit 0
    ;;
  *)
    echo "Opción no válida"
    exit 1
    ;;
esac
