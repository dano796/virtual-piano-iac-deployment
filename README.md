# Snake Game

## Descripción
Esta es una aplicación web del clásico juego de la serpiente. La aplicación está desarrollada con HTML, CSS y JavaScript y se despliega automáticamente en una instancia de AWS EC2 utilizando Docker y Terraform.

El código fuente de la aplicación se puede encontrar en: [CodingNepal](https://www.codingnepalweb.com/create-snake-game-htm-css-javascript/).

## Pasos para Desplegar
### Desplegar la Aplicación
Este repositorio contiene los archivos necesarios para desplegar y ejecutar una aplicación en un 
contenedor Docker, así como los archivos Terraform necesarios para desplegar automáticamente 
la infraestructura en AWS.

## Requisitos Previos

1. Tener instalado [Git](https://git-scm.com/).
2. Tener instalado [Docker](https://www.docker.com/get-started).
3. Tener instalado [Terraform](https://www.terraform.io/downloads).
4. Una cuenta de AWS y configurar las credenciales de AWS en tu máquina local.

## Instrucciones

### 1. Clonar el Repositorio

Para clonar este repositorio, abre una terminal y ejecuta el siguiente comando:

```bash
git clone https://github.com/dano796/app.git
cd app
```

### 2. Instalar Terraform y Configurar la Cuenta de AWS

#### Instalación de Terraform

1. Descarga Terraform desde la [página oficial](https://www.terraform.io/downloads).
2. Extrae el archivo descargado y coloca el ejecutable en un directorio incluido en tu variable de entorno `PATH`.

Para verificar la instalación, ejecuta:

```bash
terraform -v
```

Deberías ver la versión de Terraform instalada.

#### Configurar las Credenciales de AWS

Terraform requiere acceso a tu cuenta de AWS para desplegar la infraestructura. Para configurar tus credenciales de AWS, sigue estos pasos:

1. Crea un directorio llamado `.aws` en tu carpeta de inicio si no existe:

```bash
mkdir ~/.aws
```

2. Dentro de ese directorio, crea un archivo llamado `credentials`:

```bash
touch ~/.aws/credentials
```

3. Abre el archivo `credentials` en un editor de texto y añade tu `AWS CLI`, debe quedar algo así:

```plaintext
[default]
aws_cli
```

### 3. Desplegar la Infraestructura en AWS con Terraform

#### Inicializar Terraform

Antes de aplicar los cambios, debes inicializar el entorno de trabajo de Terraform. Desde el directorio donde clonaste el repositorio, ejecuta:

```bash
terraform init
```

Este comando descarga los proveedores necesarios y prepara el entorno de trabajo.

#### Aplicar los Cambios

Para desplegar la infraestructura, utiliza el comando `terraform apply`. Este comando creará todos los recursos definidos en los archivos de configuración de Terraform. Ejecuta:

```bash
terraform apply
```

Se te pedirá confirmar la acción escribiendo `yes`. Terraform comenzará a crear los recursos en AWS.

#### Verificar el Despliegue

Una vez completado el comando `terraform apply`, puedes verificar en la consola de AWS que los recursos han sido creados correctamente.

Para verificar el funcionamiento de la app web, en un navegador, accede a la instancia a través del puerto 3000, así: ip_instancia:3000.

## Gracias!