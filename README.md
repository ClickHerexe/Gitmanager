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
ssh-keygen -t rsa -b 4096 -C "correo@gmail.com" # Genera una nueva clave SSH
eval "$(ssh-agent -s)"                          # Inicia el agente
ssh-add ~/.ssh/ssh_key                          # Añade la clave generada
cat ~/.ssh/ssh_key.pub                          # Copia este contenido y añádelo en GitHub
```

## Uso de Gitmanager

### Crear un nuevo repositorio local

```bash
mkdir proyecto
cd proyecto
git init   # Inicializa el repositorio
touch README.md
nano script.sh
chmod +x script.sh
```

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
