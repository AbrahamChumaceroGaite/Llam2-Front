FROM siutin/stable-diffusion-webui-docker:latest-cuda

# Definir el directorio de trabajo en la etapa de construcción
WORKDIR /app/stable-diffusion-webui

# Exponer el puerto 80
EXPOSE 80

# Comando para stable-diffusion y NGINX
CMD ["bash", "webui.sh", "--share", "--port", "80"]  # Inicia tu aplicación y NGINX al mismo tiempo
