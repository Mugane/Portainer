# PHPMYADMIN

To get the IP to use for the mariadb/mysql host (local), use 
```
sudo docker inspect phpmyadmin -f '{{range .NetworkSettings.Networks}}{{.Gateway}}{{end}}'
```
Then add the port for that server.