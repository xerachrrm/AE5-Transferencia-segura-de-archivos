#!/bin/bash
echo "1. Encendiendo contenedores..."
docker start dpl-lab dpl-cliente

echo "2. Arrancando vsftpd y sshd en dpl-lab..."
docker exec -d dpl-lab /usr/sbin/vsftpd /etc/vsftpd.conf
docker exec -d dpl-lab /usr/sbin/sshd -D

echo "3. Esperando 2 segundos a que estabilicen los servicios..."
sleep 2

echo "4. Probando conexión SSH por clave pública desde dpl-cliente..."
docker exec -it dpl-cliente su - despliegue -c "ssh -o StrictHostKeyChecking=no despliegue@dpl-lab 'echo ¡Prueba de conexión superada con éxito!'"

echo "¡Entorno listo y verificado!"
