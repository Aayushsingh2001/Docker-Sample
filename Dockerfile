## USE official image from Docker file
FROM nginx:alpine

## Copy all file to the default public directory if Nginx
COPY . /usr/share/nginx/html

## Expose it on PORT 80
EXPOSE 80