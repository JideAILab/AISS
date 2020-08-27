FROM arm64v8/nginx:latest
SHELL ["/bin/bash", "-c"]
WORKDIR /root
EXPOSE 8888

COPY nginx.conf /etc/nginx/conf.d/default.conf
COPY ./static /root/static
RUN sed -i "2s/.*/user root;/" /etc/nginx/nginx.conf