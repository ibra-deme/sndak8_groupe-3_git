#Image de base
FROM mysql:5.7


ENV MYSQL_ROOT_PASSWORD=passer

#ajout des fichiers
ADD includes/db.php /docker-entrypoint-initdb.d/