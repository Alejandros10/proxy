FROM nginx
COPY ./certs/cert.pem /etc/ssl/certs/cert.pem
COPY ./certs/key.pem  /etc/ssl/private/key.pem

COPY ./nginx/esxi.conf /etc/nginx/conf.d/default.conf
COPY ./nginx/ssl-params.conf /etc/nginx/snippets/ssl-params.conf

EXPOSE 8443
