## Automatización de pruebas de API Pets
 Url: https://petstore.swagger.io/v2/swagger.json
 
# 1. Prerequisitos:
	- IDE IntelliJ
	- Maven version
	- JDK correto versión 1.8

# 2. Comandos de instalación:
  - Clonarse el proyecto
  - bajar las dependencias comando mvn install -DskipTests

# 3. Instrucciones para ejecutar
** ubicarse en el archivo karateRuner que esta en el directorio "src/test/java/" clic derecho opcion "run".

# 4. Reportes
  - Al finalizar la Ejecucion de la prueba en la consola se visualzia el resumen de las pruebas ejecutadas
  - Los reportes se generan y guardan el la ruta "target" ahi encontrara generada una carpeta con el formato: karate_reports + "hash"
    
# 5. Información adicional
  - Tecnologia usada: Karate framework, junit5, javafaker, maven-surefire-plugin
    


 

