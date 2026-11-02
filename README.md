# Práctica AE5: Transferencia Segura de Ficheros y Endurecimiento de Servicios

Este repositorio contiene la documentación, scripts y evidencias correspondientes a la **Tarea Evaluable AE5**, centrada en el despliegue de un entorno seguro basado en contenedores Docker (`dpl-lab` como servidor y `dpl-cliente` como cliente) sobre Ubuntu 24.04.

---

## 🛠️ Estructura del Repositorio

- `comprobaciones.txt`: Documento detallado paso a paso con todo el procedimiento de configuración de la red, usuarios, permisos, demonios y pruebas de cliente.
- `evidencias.txt`: Fichero con las trazas y estados reales extraídos directamente de los contenedores (puertos en escucha, procesos activos, red y permisos).
- `arrancar-servicios.sh`: Script local automatizado para levantar los contenedores, iniciar los servicios (`vsftpd` y `sshd`) y verificar la conectividad SSH por clave pública.

---

## 🚀 Puesta en Marcha Rápida

Para levantar el entorno completo y verificar el funcionamiento de forma automatizada, utiliza el script provisto:

```bash
# Dar permisos de ejecución al script si es necesario
chmod +x arrancar-servicios.sh

# Ejecutar el script de arranque y comprobación
./arrancar-servicios.sh
```

---

## 🔒 Características Técnicas Implementadas
1. **Red Puente Aislada (`dpl-net`)**: Uso de nombres de contenedores para evitar dependencias con cambios de IP.
2. **Servidor FTP Seguro (`vsftpd`)**:
   - Cifrado FTPS explícito con certificado SSL/TLS autofirmado.
   - Aislamiento de usuarios en sus directorios (`chroot`).
   - Modos de transferencia activo y pasivo configurados y validados mediante `lftp`.
3. **Endurecimiento SSH y SFTP (`sshd`)**:
   - Desactivación de acceso por contraseña (`PasswordAuthentication no`).
   - Prohibición de login como `root`.
   - Autenticación exclusiva por pares de claves criptográficas (`PubkeyAuthentication yes`).