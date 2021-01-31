# DESCRIPCIÓN DE PROYECTO


El proyecto consiste en un gestor de recursos humanos para prestadores  servicios de salud.

Necesidad:
1.
Luego de variadas entrevistas con Dueños y gerentes de empresas de servicios de salud, se aprecia una necesidad importante a la hora de la gestion de empleados para los prestadores de salud ya que el pago de funciones y las diferencias de cobros a clientes hacen el proceso muy complicado y genera una gran perdida de tiempo a fin de mes tanto para pagar los sueldos de los empleados como para el cobro a clientes ya que en general las cuatos son variables por lo que es necesario calcular por profesional y por cliente la gestion.

2.
Por otra parte existe una necesidad importante en el control monetario en este tipo de empresas ya que al ser variables y personales los los cobors y pagos es muy dificil llevar el control ya sea de produccion por empleado como de ganancias por sector o diferente informacion estadistica.

3.
Por ultimo al ser servicios de atencion unitaria con cobros variables es muy importante integrar algun sistema de cobros y pagos por servicio.


# AVANCES

Hito 1

-Base Creada
-CRUD objetos
-Base Poblada
-Vistas Crud basico

# Link Tablero Trello
https://trello.com/b/93uJjWTL/poyecto-gestor-recursos-humanos-servicio-salud


# Hito 2
-Perfil Usuarios
-Sistema autenthicacion
-Dashborard (activ admin) role gerencia.
    . User - admin@example.com
    . Pass - password
-Ajax creacion de recursos(servicios) en vista index admins.
-Calificaciones en edit de servicios, acceso navbar. 


# Hito 4

- Config de subida:
    Se uso elastic beanstalk de AWS para subir la app de manera simple
    - se instala con sudo pip awsbecli
    - Se debe tener cuenta en AWS para acceder
    - eb init inicia en nuestro proyecto el servicio
    - eb create crea el proyecto 
    - eb create Gestorklife-env-1 -db.engine postgres comando para crear que incluye db engine con postgres
    - Se debe configurar las credenciales en permisos de IAM
    - Credenciales usadas =>
                AmazonS3FullAccess
                AWSCodeDeployFullAccess
                AWSElasticBeanstalkWebTier
                AWSElasticBeanstalkFullAccess
                AWSCodeDeployRole
                AWSElasticBeanstalkService
                AWSElasticBeanstalkWorkerTier
                AdministratorAccess-AWSElasticBeanstalk
                AWSElasticBeanstalkRoleCore
    
    -Se debe crear posteriormente una DB en RDS para poder linkear nuestro proyecto con su db

    Heroku
    - se debe logear tener cuenta en heroku
    -primero en terminal - heroku login
    -luego - heroku create para crear el proyecto
    - git add . , git commit -m "" para guardar en git los cambios
    - luego - heroku run rake db:migrate para pasar la DB
    -Por ultimo Heroku Open para abrir el proyecto


    CONFIGURACION DE DOMINIO
    En primer lugar
        - heroku domains:add geslife.tech (para agregar el dominio)
        - luego en la configuracion de la app en heroku esta el dns cname para copiar en el record del dominio
        - se agregar el servidos use route 53 de AWS para manejo de dominios y dns
        - Se configura el proveedor de dominio (en mi caso compre un dominio barato en domain.com)


    direccion app = www.geslife.tech


    CONTROL DE ERRORES CON SENTRY
