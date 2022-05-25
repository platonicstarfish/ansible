FROM phusion/baseimage:jammy-1.0.0

RUN apt update

RUN apt install -y nginx

COPY nginx_files/nginx.conf /etc/nginx/nginx.conf
COPY nginx_files/archive.ubuntu.com /etc/nginx/sites-enabled/

CMD ["nginx", "-g", "daemon off;"]

