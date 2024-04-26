#L'image de base de notre image cette ligne commence tjrs par FROM et il y'aura qu'un seul FROM
FROM php:7.2-apache

#Installation de php et mysql 
RUN docker-php-ext-install mysqli

#copier les fichiers local dans le dossier 
COPY . /var/www/html

#Donner les droits sur le dossier complet
RUN chmod -R 755 /var/www/html

#Activer le mode rewrite pour apache
RUN a2enmod rewrite

