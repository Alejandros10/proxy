FROM nginx

COPY ./nginx/nginx.conf /etc/nginx/conf.d/default.conf

EXPOSE 80
