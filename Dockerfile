FROM nginx:alpine
# Copy static web UI dashboard source code to Nginx server root directory
COPY index.html /usr/share/nginx/html/index.html
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]
