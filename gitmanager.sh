#!/bin/bash

# Iniciar repo solo si no está iniciado
if [ ! -d ".git" ]; then
    git init
fi

# Crear README.md solo si no existe
if [ ! -f "README.md" ]; then
    touch README.md
fi

# Elegir branch
read -p "Elegir branch: " branch
git pull origin "$branch"
git add .

# Mensaje del commit
read -p "Descripción del commit: " desc
git commit -m "$desc"

# Nombre del repo
read -p "Nombre del repositorio: " repo

# Añadir remote solo si no existe
if ! git remote get-url origin >/dev/null 2>&1; then
    git remote add origin git@github.com:ClickHerexe/"$repo".git
fi

# Push
git push -u origin "$branch"
