FROM siutin/stable-diffusion-webui-docker:latest-cuda

# Definir el directorio de trabajo
WORKDIR /app/stable-diffusion-webui

# Comando para stable-diffusion
CMD ["bash", "webui.sh",  "--share", "--port", "80"]

# Ahora copiamos los archivos necesarios a una nueva imagen de NGINX
FROM nginx:alpine

COPY nginx.conf /etc/nginx/nginx.conf

# Copiar los archivos necesarios de la imagen del builder
COPY --from=builder /app/stable-diffusion-webui /usr/share/nginx/html

EXPOSE 80
# Comando par NGINX
CMD ["nginx", "-g", "daemon off;"]




