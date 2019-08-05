Administrador de servidores virtuales sobre Kubernetes
------------------------------------------------------

Una prueba de concepto de un servicio SAAS que permite a los clientes generar servidores con módulos personalizados (correo, web, FTP, email) y luego configurarlos desde una interfaz de administración web.

En un esquema diferenciado de precios se podría cobrar por módulo activado o por acceso completo al deployment (símil servidor dedicado).

Consta de dos componentes principales (Figura 1):

### CRM

Está basado en [CakePHP](https://cakephp.org/) y una adaptación propia para este framework del template [AdminLTE](https://adminlte.io/). Su función es administrar los usuarios y sus deployments con sus respectivos módulos. En su versión final debería permitir generar los archivos de configuración de Webmin y de Kubernetes (YAML) a partir de archivos de templates.

Puede residir indistintamente en un ambiente de contenedores, en una VM o servidor físico.

### Cluster Kubernetes

Aquí se deployarán los archivos generados en el CRM. Los deployments ejecutan una imagen de Docker personalizada que utiliza como base [sameersbn/bind](https://github.com/sameersbn/docker-bind).

Cada deployment ejecuta un servidor [Webmin](http://www.webmin.com/) para configurar este servidor virtual y sus módulos.

En producción debe contar con un controlador Ingress o equivalente para routear nombres de dominio hacia el POD correspondiente y balanceadores de carga con IP públicas para los servicios no HTTP.

![Figura 1](https://github.com/paul21/um-sa/raw/master/img/struct.png)

### Modelo de datos

La implementación inicial cuenta con modelo de usuarios que pueden poseer uno o más deployments (servidores). Cada deployment puede tener uno o más módulos activados (apache, bind, etc) para el caso de un usuario normal no root.

Los usuarios root —naturalmente— poseen todos los módulos disponibles y tienen acceso total dentro del sus deployments.

![Figura 2](https://github.com/paul21/um-sa/raw/master/img/models.png)

### TODO:

* Autodeploy de servidores en el cluster K8s desde el CRM.
* Backend de CRM a microservicio (API).
* Diferenciación deusuarios comunes de administradores (ACLs).
* Monitoreo y gestión en tiempo real del cluster K8s en el CRM.