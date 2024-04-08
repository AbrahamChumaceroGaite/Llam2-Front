FROM siutin/stable-diffusion-webui-docker:latest-cpu as builder

# Definir el directorio de trabajo
WORKDIR /app/stable-diffusion-webui

# Ahora copiamos los archivos necesarios a una nueva imagen de NGINX
FROM nginx:alpine

COPY nginx.conf /etc/nginx/nginx.conf

# Copiar los archivos necesarios de la imagen del builder
COPY --from=builder /app/stable-diffusion-webui /usr/share/nginx/html

EXPOSE 80

# Comando par NGINX
CMD ["nginx", "-g", "daemon off;"]

# Comando para stable-diffusion
CMD ["bash", "webui.sh", "--skip-torch-cuda-test", "--use-cpu", "all", "--share", "--port", "80"]


