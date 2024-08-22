# Usar la imagen oficial de Nginx como base
FROM nginx:latest

# Copiar los certificados SSL al contenedor
COPY ./certs/fullchain.pem /etc/ssl/certs/fullchain.pem
COPY ./certs/privkey.pem /etc/ssl/private/privkey.pem

# Copiar los archivos de configuración de Nginx
COPY ./nginx/nginx.conf /etc/nginx/nginx.conf
COPY ./nginx/default.conf /etc/nginx/conf.d/default.conf

# Exponer los puertos 80 y 443 para HTTP y HTTPS
EXPOSE 80 443

# Comando para ejecutar Nginx
CMD ["nginx", "-g", "daemon off;"]