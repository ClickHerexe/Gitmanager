#!/bin/bash
git pull origin master
git add .
read -p "Descripción del commit: " desc
git commit -m "$desc"
git push origin master
