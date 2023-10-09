#!/bin/sh
#Este script se utilizará como punto de entrada del contenedor, lo que significa que se ejecutará al iniciar el contenedor para iniciar el servidor Rails.

set -e
# Establece la opción -e para que el script se detenga inmediatamente si se produce algún error

if [ -f tmp/pids/server.pid ]; then
  rm tmp/pids/server.pid
fi
# Verifica si existe el archivo tmp/pids/server.pid y si existe, lo elimina
# Esto evita problemas al iniciar el servidor si se dejó en ejecución anteriormente y no se cerró correctamente

bundle exec rails s -b 0.0.0.0 -p 3002
# bundle exec: Esto es un comando de Bundler.
# Bundler es una herramienta de gestión de dependencias para Ruby.
# bundle exec se utiliza para ejecutar un comando específico de Ruby con las gemas (librerías) que están definidas en tu Gemfile.
# Esto asegura que el comando se ejecute con las versiones específicas de las gemas que tu aplicación necesita.

# rails s: Este es un comando para iniciar el servidor de desarrollo de Rails. El s es una abreviatura de server.

# -b 0.0.0.0: Esto le dice al servidor que escuche en todas las interfaces de red disponibles. En otras palabras,
# el servidor estará disponible para ser accedido desde cualquier dirección IP.

# -p 3002: Esto especifica el puerto en el que el servidor debería escuchar.
# En este caso, se está configurando para escuchar en el puerto 3002.

# Entonces, en resumen, este comando está iniciando el servidor de desarrollo de Rails en tu máquina local,
# permitiendo conexiones desde cualquier dirección IP en el puerto 3002.
# Esto puede ser útil si estás trabajando en un entorno de desarrollo y quieres acceder a tu aplicación desde otros dispositivos en la misma red.