FROM siutin/stable-diffusion-webui-docker:latest-cpu

# Definir el directorio de trabajo
WORKDIR /app/stable-diffusion-webui

# Comando para stable-diffusion
CMD ["bash", "webui.sh", "--skip-torch-cuda-test", "--use-cpu", "all", "--share"]

# Probando la mierda de NGINX si jala la poronga
FROM nginx:alpine
COPY nginx.conf /etc/nginx/nginx.conf
COPY --from=build /app/stable-diffusion-webui /usr/share/nginx/html
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]
