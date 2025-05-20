#!/bin/bash
git add .
read -p "Descripción del commit: " desc
git commit -m "$desc"
git branch -M master
read -p "Nombre del repositorio: " repo
git remote add origin git@github.com:ClickHerexe/"$repo".git
git push -u origin master
