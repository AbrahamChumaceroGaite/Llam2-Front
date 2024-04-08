# Etapa de construcción (builder)
FROM nginx:alpine as builder

# Definir el directorio de trabajo en la etapa de construcción
WORKDIR /app/stable-diffusion-webui

# Copiar archivos necesarios para la construcción en la etapa de construcción
COPY . .

# Etapa de producción
FROM siutin/stable-diffusion-webui-docker:latest-cuda

# Definir el directorio de trabajo en la etapa de producción
WORKDIR /app/stable-diffusion-webui

# Copiar los archivos necesarios de la imagen del builder a la imagen de producción
COPY --from=builder /app/stable-diffusion-webui /usr/share/nginx/html

# Copiar el archivo de configuración de NGINX
COPY nginx.conf /etc/nginx/nginx.conf

# Exponer el puerto 80
EXPOSE 80

# Comando para stable-diffusion
CMD ["bash", "webui.sh", "--share", "--port", "80"]

# Comando para iniciar NGINX
CMD ["nginx", "-g", "daemon off;"]
