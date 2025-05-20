#!/bin/bash
read -p "Elegir branch: " branch
git pull origin "$branch"
git add .
read -p "Descripción del commit: " desc
git commit -m "$desc"
git push -u origin "$branch"
