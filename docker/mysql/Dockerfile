# Use an official MySQL image
FROM mysql:8.0

# Set environment variables for the root user and default database
ENV MYSQL_ROOT_PASSWORD=rootpassword
ENV MYSQL_DATABASE=wordpress
ENV MYSQL_USER=wordpressuser
ENV MYSQL_PASSWORD=wordpresspassword

# Copy custom MySQL configuration file (optional)
COPY ./my.cnf /etc/mysql/my.cnf

# Expose the default MySQL port
EXPOSE 3306
