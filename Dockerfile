FROM ruby:3.2.2
# Utiliza la imagen base de Ruby versión 3.2.2
RUN useradd developer
# Agrega un usuario llamado "developer"
RUN mkdir -p /home/developer
# Crea la carpeta /home/developer
# La bandera -p permite crear directorios padre si no existen
WORKDIR /home
# Establece /home como el directorio de trabajo
RUN chown -R developer:developer developer
# Asigna los permisos de la carpeta /home/developer al usuario "developer"
RUN chmod 755 developer
# Asigna permisos 755 al directorio /home/developer
USER developer
# Cambia al usuario "developer"
RUN mkdir -p /home/developer/play_app/frontend/play
# Crea la carpeta /home/developer/play_app/frontend/play para la aplicación
# La bandera -p permite crear directorios padre si no existen
WORKDIR /home/developer/play_app/frontend/play
# Establece /home/developer/play_app/frontend/play como el directorio de trabajo
COPY ./Gemfile .
# COPY ./docker-entrypoint.sh .
# COPY ./play/Gemfile.lock .
# Copia el archivos Gemfile al directorio actual
RUN bundle install
# Instala las gemas especificadas en Gemfile
COPY . .
# Copia todo el contenido del proyecto al directorio actual
EXPOSE 3002
# Expone el puerto 3002 para que pueda ser accesible desde fuera del contenedor
ENTRYPOINT [ "./docker-entrypoint.sh" ]
# Establece el script "docker-entrypoint.sh" como punto de entrada del contenedor

###Los permisos 755 permiten que el propietario del directorio tenga todos los permisos
#(lectura, escritura y ejecución), mientras que el grupo y otros usuarios solo tienen permisos de lectura y ejecución.
###