FROM nginx:alpine

RUN echo "Hello World!"

EXPOSE 80

COPY ./html /usr/share/nginx/html
