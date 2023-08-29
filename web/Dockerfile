# Use the official NGINX image as the base image
FROM nginx:latest

# Remove the default NGINX configuration
RUN rm /etc/nginx/conf.d/default.conf

# Copy your custom NGINX configuration file
COPY nginx.conf /etc/nginx/conf.d/

# Copy your HTML file to the NGINX document root
COPY index.html /usr/share/nginx/html/

# Expose port 80 for HTTP
EXPOSE 80

# Start NGINX when the container starts
