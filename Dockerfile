FROM php:8.2-apache

# Instala dependências do sistema e extensões necessárias do PHP
RUN apt-get update && apt-get install -y \
    libpng-dev \
    libjpeg-dev \
    libfreetype6-dev \
    libzip-dev \
    zip \
    unzip \
    git \
    && docker-php-ext-configure gd --with-freetype --with-jpeg \
    && docker-php-ext-install -j$(nproc) gd mysqli pdo_mysql zip opcache

# Habilita o módulo mod_rewrite do Apache
RUN a2enmod rewrite

# Instala o Composer globalmente
COPY --from=composer:latest /usr/bin/composer /usr/bin/composer

# Configura o diretório de trabalho
WORKDIR /var/www/html

# Ajusta permissões dos arquivos
RUN chown -R www-data:www-data /var/www/html

EXPOSE 80
