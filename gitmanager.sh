#!/bin/bash

echo "Selecciona una opción:"
echo "1) Iniciar repositorio"
echo "2) Publicar el repositorio"
echo "3) Actualizar el repositorio"
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
    read -p "Nombre del repositorio: " repo

    if ! git remote get-url origin >/dev/null 2>&1; then
        git remote add origin git@github.com:ClickHerexe/"$repo".git
    fi

    git push -u origin master
    ;;
  3)
    read -p "Elegir branch: " branch
    git pull origin "$branch"
    git add .
    read -p "Descripción del commit: " desc
    git commit -m "$desc"
    git push -u origin "$branch"
    ;;
  *)
    echo "Opción no válida"
    exit 1
    ;;
esac
