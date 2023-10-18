FROM wordpress:latest

# Set environment variables for WordPress
ENV WORDPRESS_DB_HOST=database-host
ENV WORDPRESS_DB_NAME=wordpress
ENV WORDPRESS_DB_USER=wordpress
ENV WORDPRESS_DB_PASSWORD=your-password

# Install additional PHP extensions
RUN docker-php-ext-install pdo pdo_mysql

# Optionally, you can copy custom themes, plugins, and configuration files
COPY ./custom-theme /var/www/html/wp-content/themes/custom-theme
COPY ./custom-plugin /var/www/html/wp-content/plugins/custom-plugin
COPY ./wp-config.php /var/www/html/wp-config.php

# Expose the default WordPress port
EXPOSE 80

# Start the Apache web server and WordPress
CMD ["apache2-foreground"]

