# Usar la imagen oficial de Nginx como base
FROM nginx:latest

# Instalar Certbot
RUN apt-get update && \
    apt-get install -y certbot python3-certbot-nginx cron

# Copiar los archivos de configuración de Nginx
COPY ./nginx/nginx.conf /etc/nginx/nginx.conf
COPY ./nginx/default.conf /etc/nginx/conf.d/default.conf

# Copiar el script de renovación y agregarlo al cron
COPY renew_certs.sh /etc/cron.daily/renew_certs.sh
RUN chmod +x /etc/cron.daily/renew_certs.sh

# Exponer los puertos 80 y 443 para HTTP y HTTPS
EXPOSE 80 443

# Comando para ejecutar Nginx y cron
CMD ["sh", "-c", "cron && nginx -g 'daemon off;'"]
