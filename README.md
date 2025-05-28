# Gitmanager

## Crear una clave e iniciar agente (en caso necesario) SSH

### Iniciar el agente SSH y añadir la clave

```bash
eval "$(ssh-agent -s)"  # Inicia el agente
ssh-add ~/.ssh/ssh_key  # Añade la clave privada
ssh-add -l              # Verifica que se añadió correctamente
```

### Generar y añadir una nueva clave SSH

```bash
cd ~/.ssh
ssh-keygen -t rsa -b 4096 -C "tucorreo@gmail.com" # Genera una nueva clave SSH
eval "$(ssh-agent -s)"                            # Inicia el agente
ssh-add ~/.ssh/ssh_key                            # Añade la clave generada en el agente
cat ~/.ssh/ssh_key.pub                            # Copialo y añádelo en tus claves de GitHub
```

## Uso de Gitmanager

### Crear un nuevo repositorio local

```bash
mkdir tu_proyecto && cd tu_proyecto # Crea la carpeta de tu proyecto
git init                            # Inicia el repositorio
touch README.md                     # Crea el README de github
```
Una vez creado el README.md solo queda empezar tu proyecto, cuando creas que es seguro publicarlo pasamos a la publicar el repositorio, pero antes de nada asegurate de crearlo en Github, en mi caso sería: https://github.com/ClickHerexe?tab=repositories > New

### Publicar el repositorio en GitHub

```bash
git add .
git commit -m "Comienzo del proyecto"
git branch -M master
git remote add origin git@github.com:TU_USUARIO/TU_REPOSITORIO.git
git push -u origin master
```

### Actualizar un repositorio existente

```bash
git pull origin master
git add .
git commit -m "Descripción de los cambios"
git push origin master
```

### Clonar un repositorio

```bash
git clone git@github.com:TU_USUARIO/TU_REPOSITORIO.git
```

### Eliminar archivos del repositorio que estén en `.gitignore`

```bash
git rm --cached <archivo1> <archivo2>
```
