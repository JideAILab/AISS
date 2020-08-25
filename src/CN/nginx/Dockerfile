FROM arm64v8/nginx:latest

SHELL ["/bin/bash", "-c"]
WORKDIR /root
EXPOSE 80

RUN sed -i "2s/.*/user root;/" /etc/nginx/nginx.conf 
COPY nginx.conf /etc/nginx/conf.d/default.conf