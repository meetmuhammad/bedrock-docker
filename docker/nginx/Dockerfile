# Use an official Nginx image
FROM nginx:latest

# Copy custom Nginx configuration file
COPY ./default.conf /etc/nginx/conf.d/default.conf

# Expose port 80
EXPOSE 80

# Start Nginx server
CMD ["nginx", "-g", "daemon off;"]
