#!/bin/bash
set -x # Esto mostrará el trace de ejecución

# Este script añade un usuario administrador a WildFly y luego inicia el servidor.

# Variables para el usuario administrador
WILDFLY_ADMIN_USER="admin"
WILDFLY_ADMIN_PASS="WildFly@dmin123" # ¡CAMBIA ESTO POR UNA CONTRASEÑA SEGURA!

echo "Añadiendo usuario administrador de WildFly: ${WILDFLY_ADMIN_USER}"

# Ejecuta el script add-user.sh de WildFly en modo no interactivo
# -s: Modo silencioso (no pide confirmación por consola)
# -a: Indica que es un usuario de gestión (management user) para la consola 9990
# Esto agregará el usuario al archivo mgmt-users.properties
echo "Ejecutando add-user.sh"
echo "JBOSS_HOME: $JBOSS_HOME"
$JBOSS_HOME/bin/add-user.sh ${WILDFLY_ADMIN_USER} ${WILDFLY_ADMIN_PASS} 

# Verifica si el usuario fue añadido correctamente
if [ $? -eq 0 ]; then
    echo "Usuario ${WILDFLY_ADMIN_USER} añadido con éxito."
else
    echo "Error al añadir el usuario ${WILDFLY_ADMIN_USER}. Puede que ya exista o haya un problema."
fi

echo "Iniciando WildFly..."
# Inicia WildFly en modo standalone, escuchando en todas las interfaces para la aplicación y la gestión
exec $JBOSS_HOME/bin/standalone.sh -b 0.0.0.0 -bmanagement 0.0.0.0
