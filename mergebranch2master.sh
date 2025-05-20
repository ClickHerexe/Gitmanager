#!/bin/bash
read -p "Nombre del branch que quieres fusionar con master: " merge
git checkout master
git merge "$merge"
