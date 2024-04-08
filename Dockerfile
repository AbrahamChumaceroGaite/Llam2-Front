FROM nginx:alpine as builder

FROM siutin/stable-diffusion-webui-docker:latest-cuda

# Definir el directorio de trabajo
WORKDIR /app/stable-diffusion-webui

COPY nginx.conf /etc/nginx/nginx.conf

# Copiar los archivos necesarios de la imagen del builder
COPY --from=builder /app/stable-diffusion-webui /usr/share/nginx/html

# Comando para stable-diffusion
CMD ["bash", "webui.sh",  "--share", "--port", "80"]

# Comando par NGINX
CMD ["nginx", "-g", "daemon off;"]
EXPOSE 80





