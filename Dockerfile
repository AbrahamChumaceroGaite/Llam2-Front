FROM nginx:alpine as builder

COPY nginx.conf /etc/nginx/nginx.conf

# Copiar los archivos necesarios de la imagen del builder
COPY --from=builder /app/stable-diffusion-webui /usr/share/nginx/html

FROM siutin/stable-diffusion-webui-docker:latest-cuda

# Definir el directorio de trabajo
WORKDIR /app/stable-diffusion-webui

# Comando para stable-diffusion
CMD ["bash", "webui.sh",  "--share", "--port", "80"]

EXPOSE 80
# Comando par NGINX
CMD ["nginx", "-g", "daemon off;"]




