# Entorno de Despliegue con WildFly y PostgreSQL 🚀

Este proyecto tiene como objetivo principal establecer un entorno de producción robusto y contenedorizado para aplicaciones Java. Utiliza WildFly como servidor de aplicaciones para ejecutar las aplicaciones Java y PostgreSQL como sistema de gestión de bases de datos relacionales, todo orquestado mediante Docker y Docker Compose para facilitar el despliegue y la gestión. Ideal para equipos que buscan una solución de despliegue consistente y reproducible para sus aplicaciones empresariales Java.

## ✨ Características Principales

*   **Entorno Contenerizado 🐳:** Todos los componentes clave (WildFly y PostgreSQL) se ejecutan en contenedores Docker aislados, lo que garantiza portabilidad, consistencia del entorno y facilidad de despliegue en diferentes plataformas.
*   **Configuración Automatizada ⚙️:** El archivo `docker-compose.yml` permite la configuración y el despliegue automatizado de la pila completa de la aplicación con un solo comando, reduciendo la complejidad y el tiempo de configuración manual.
*   **Pila de Producción Robusta 💪:** Ofrece una combinación de tecnologías probadas y fiables (WildFly y PostgreSQL) adecuadas para entornos de producción de aplicaciones empresariales Java.
*   **Separación de Responsabilidades 🧩:** Al ejecutar WildFly y PostgreSQL en contenedores separados, se promueve una arquitectura modular, facilitando el mantenimiento, la escalabilidad y la gestión de cada servicio de forma independiente.
*   **Script de Inicio Personalizado 📜:** Incluye un script `start-wildfly.sh` que sugiere una configuración personalizada o una secuencia de inicio específica para el servidor WildFly dentro del contenedor, permitiendo una mayor flexibilidad.

## 📋 Requisitos Previos

Antes de comenzar, asegúrate de tener instalado lo siguiente en tu sistema:

*   **Docker Engine:** Versión 18.06.0 o superior.
*   **Docker Compose:** Versión 1.22.0 o superior.
*   **Conocimientos básicos de Docker y Docker Compose.**

## 🚀 Instrucciones de Instalación

Sigue estos pasos para levantar el entorno en tu máquina local:

1.  **Clonar el Repositorio** (o descargar los archivos del proyecto):
    ```bash
    git clone <URL_DEL_REPOSITORIO>
    cd <directorio_del_proyecto>
    ```

2.  **Configurar el Controlador JDBC de PostgreSQL:**
    Asegúrate de tener el archivo `postgresql.jar` (controlador JDBC) en la ubicación adecuada para que WildFly pueda acceder a él. Comúnmente, se copia en el directorio de módulos de WildFly o se define en el `Dockerfile` de WildFly.

3.  **Construir y Levantar los Contenedores:**
    Desde la raíz del proyecto donde se encuentra `docker-compose.yml`, ejecuta el siguiente comando:
    ```bash
    docker-compose up --build -d
    ```
    *   `--build`: Reconstruye las imágenes de los servicios (útil si has hecho cambios en los `Dockerfile`s).
    *   `-d`: Ejecuta los contenedores en modo "detached" (en segundo plano).

## 💡 Guía de Uso

Una vez que los contenedores estén en funcionamiento, puedes interactuar con ellos de la siguiente manera:

### Acceder a WildFly

*   **Consola de Administración:** Generalmente disponible en `http://localhost:9990` (asegúrate de que el puerto esté mapeado en `docker-compose.yml`).
*   **Servidor de Aplicaciones:** Tus aplicaciones Java se desplegarán y serán accesibles a través de `http://localhost:8080` (o el puerto configurado para HTTP/HTTPS).

### Acceder a PostgreSQL

*   **Puerto Predeterminado:** PostgreSQL estará disponible en `localhost:5432` (o el puerto que hayas configurado en `docker-compose.yml`).
*   **Conexión:** Puedes usar cualquier cliente de base de datos (pgAdmin, DBeaver, etc.) para conectarte utilizando las credenciales definidas en `docker-compose.yml` (ej. `POSTGRES_USER`, `POSTGRES_PASSWORD`, `POSTGRES_DB`).

### Detener el Entorno

Para detener y eliminar los contenedores (y la red asociada) pero mantener los volúmenes de datos (si están definidos), ejecuta:```bash
docker-compose down
```

Para detener y eliminar todo, incluyendo los volúmenes de datos (¡cuidado, esto eliminará tus datos de PostgreSQL!):```bash
docker-compose down --volumes
```

### Reiniciar un Servicio Específico

Si necesitas reiniciar solo WildFly, por ejemplo:```bash
docker-compose restart wildfly
```

## 📂 Estructura del Proyecto

Aunque la estructura puede variar, un proyecto típico con este entorno podría lucir así:```
.
├── docker-compose.yml             # Define los servicios (WildFly, PostgreSQL), redes y volúmenes.
├── wildfly/                       # Directorio para la configuración de WildFly
│   ├── Dockerfile                 # Dockerfile para construir la imagen de WildFly (personalizada).
│   ├── start-wildfly.sh           # Script de inicio personalizado para WildFly.
│   └── deployments/               # Directorio donde se pueden colocar los WARs/EARs a desplegar.
│       └── tu_aplicacion.war
├── postgres/                      # (Opcional) Directorio para scripts de inicialización de PostgreSQL
│   └── init.sql                   # Scripts SQL para inicializar la base de datos.
└── README.md                      # Este archivo.
```

## 🛠️ Tecnologías Utilizadas

*   **Docker** y **Docker Compose** 🐳: Para la contenerización y orquestación de los servicios.
*   **WildFly** (Java EE/Jakarta EE) 🦅: Servidor de aplicaciones Java.
*   **PostgreSQL** 🐘: Sistema de gestión de bases de datos relacionales.
*   **Java** ☕: Lenguaje principal de las aplicaciones a desplegar.
*   **Shell Scripting** (`.sh`) 🐚: Para la automatización de tareas.
*   **YAML** 📝: Formato para la definición de servicios en `docker-compose.yml`.