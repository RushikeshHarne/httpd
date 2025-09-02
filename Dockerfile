# Use nginx image
FROM nginx:alpine

# Copy your index.html to nginx's default folder
COPY index.html /usr/share/nginx/html/index.html

# Expose port 80
EXPOSE 80

# Start nginx
CMD ["nginx", "-g", "daemon off;"]
