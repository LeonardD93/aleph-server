# Use the official PHP image with FPM (FastCGI Process Manager)
FROM php:8.1-fpm

# Set the working directory
WORKDIR /var/www

# Install system dependencies
RUN apt-get update && apt-get install -y \
    git \
    curl \
    libpng-dev \
    libjpeg-dev \
    libfreetype6-dev \
    libonig-dev \
    libxml2-dev \
    zip \
    unzip \
    libzip-dev \
    libpq-dev \
    libjpeg62-turbo-dev \
    libmcrypt-dev \
    libmagickwand-dev --no-install-recommends \
    libcurl4-openssl-dev \
    default-mysql-client

# Configure and install PHP extensions required for Laravel, including GD with JPEG and FreeType support
RUN docker-php-ext-configure gd --with-freetype --with-jpeg && \
    docker-php-ext-install pdo_mysql pdo mbstring exif pcntl bcmath gd

# Install Composer (Dependency Manager)
COPY --from=composer:latest /usr/bin/composer /usr/bin/composer

# Set file permissions
RUN chown -R www-data:www-data /var/www

# Copy the application code
COPY . /var/www

# Set user to www-data
USER www-data
