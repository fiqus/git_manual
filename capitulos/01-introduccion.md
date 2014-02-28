# Introducción: Entendiendo que es y como funciona Git.

### ¿Qué es un sistema de control de versiones?
Un sistema de control de versiones (CVS) te permite realizar un seguimiento de la historia de una colección de archivos y además incluye la funcionalidad de revertir la colección de archivos actual hacia una versión anterior. Cada versión podría considerarse como una fotografía del estado de la colección en un momento determinado de tiempo. La colección de archivos usualmente es código fuente de algún lenguaje de programación, sin embargo, un sistema de control de versiones funciona con cualquier tipo de archivo. Tanto la colección de archivos como su historia completa están guardados en un repositorio.

### ¿Qué es un sistema de control de versiones distribuida?

En un sistema de control de versiones distribuida hay un servidor central para almacenar el repositorio y cada usuario puede hacer una copia completa del repositorio central mediante un proceso llamado “clonación”. Cada repositorio clonado es una copia completa del repositorio central y por ser una copia completa posee la mismas funcionalidades que el repositorio original, es decir, contiene la historia completa de la colección de archivos. Cada repositorio clonado puede a su vez intercambiar las versiones de sus archivos con otros repositorios clonados del mismo nodo padre (ya que deben tener la misma estructura), enviando sus cambios y recibiendo los del otro en forma directa o a través del repositorio central.

### ¿Qué es Git? 

Git es un sistema de control de versiones distribuida que se origina a partir del desarrollo del kernel de Linux y es usado por muchos proyectos populares Open Source como ser Android o Eclipse, así como tantos otros proyectos comerciales. Entonces, la principal diferencia entre Git y cualquier otro sistema de control de versiones es cómo Git modela sus datos. Conceptualmente, la mayoría de los demás sistemas almacenan la información como una lista de cambios en los archivos. Estos sistemas modelan la información que almacenan como un conjunto de archivos y las modificaciones hechas sobre cada uno de ellos a lo largo del tiempo. En cambio, Git modela sus datos más como un conjunto de instantáneas de un mini sistema de archivos. Cada vez que confirmas un cambio, o guardas el estado de tu proyecto en Git, él básicamente hace una foto del estado de todos tus archivos en ese momento, y guarda una referencia a esa instantánea. Para ser eficiente, si los archivos no se han modificado, Git no almacena el archivo de nuevo —sólo un enlace al archivo anterior idéntico que ya tiene almacenado.

![](img/distribuido.png)

En la imagen se ve claramente como en un sistema de control de versiones distribuida, cada repositorio clonado es una copia exacta del repositorio padre.

### El repositorio local

Luego de clonar o crear un repositorio el usuario tiene una copia completa del repositorio, y puede  realizar operaciones de control de versiones contra este repositorio local, como por ejemplo crear nuevas versiones, revertir cambios, etc. 
El flujo de trabajo básico en Git es algo así:

* Modificas una serie de archivos en tu directorio de trabajo (working directory).

* Añadís instantáneas de los archivos a tu área de preparación (staging area).

* Confirmas los cambios, lo que toma los archivos tal y como están en el área de preparación, y almacena esa instantánea de manera permanente en tu directorio de Git (git directory).

![](img/repo_local.png)

Hay dos tipos de repositorios en Git:


* Repositorios “bare”, son generalmente usados en los servidores, aunque puede generarse en cualquier directorio local de quien desee crearlo. Se utiliza para compartir cambios provenientes de diferentes desarrolladores, no se utiliza para crear u compartir cambios desde sí mismo, ya que no cuenta con esas funcionalidades.

* Repositorios de trabajo, permiten crear archivos nuevos, generar cambios a los archivos existentes y a su vez crear nuevas versiones en el repositorio.

Si se desea eliminar el repositorio local, sólo debe borrarse la carpeta en la que se encuentra.

### Repositorios remotos

Git permite a los usuarios sincronizar el repositorio local con otros repositorios remotos al ambiente  de trabajo local. Los usuarios que posean los permisos necesarios pueden hacer un “push” (comando utilizado para subir cambios locales) de los cambios locales al repositorio remoto. A su vez también pueden hacer un “fetch” o “pull” (comandos para buscar cambios) de los cambios realizados en repositorios remotos al local.

### Repaso de algunos conceptos útiles

* Repositorio: Un repositorio contiene la historia, las diferentes versiones en el tiempo y todas las diferentes ramas. En Git cada copia del repositorio es un repositorio completo. Si el repositorio en el que estás trabajando no es creado con la opción “bare”, entonces permite hacer un checkout de las revisiones que desees en tu repositorio local.

* Working tree: Posee el contenido de un commit que se puede obtener haciendo un checkout desde un repositorio git. Luego uno puede modificar ese contenido y hacer un nuevo commit con los cambios al repositorio.

* Branch (rama): Un branch es un puntero con un nombre determinado por el usuario que apunta a un commit. Posicionarse en un branch utilizando git es denominado como “hacer un checkout” de ese branch. Si estás trabajando en un determinado branch, la creación de un nuevo commit hace avanzar el puntero a esta nueva instancia. Cada commit conoce sus antecesores así como a sus sucesores en caso de tenerlos. Uno de los branches es el default, generalmente llamado master.

* Tag: Un tag apunta a un commit que unívocamente identifica una versión del repositorio. Con un tag, podés tener un puntero 
con nombre al que siempre puedas revertir los cambios. Por ejemplo, la versión de 25.01.2009 del branch “testing”.

* Commit: Vos commiteas los cambios a un repositorio. Esto crea un nuevo objeto commit en el repositorio que unívocamente identifica una nueva versión del  contenido del repositorio. Esta revisión puede ser consultada posteriormente, por ejemplo si uno quiere ver el código fuente de una versión anterior. Cada commit posee metadata que nos informa acerca del autor, la fecha y otros datos que nos pueden resultar prácticos a la hora de tratar de encontrar uno determinado.

* URL: Una URL en Git determina la ubicación de un repositorio.
Revisión: Representa una versión del código fuente. Git implementa las revisiones de la misma manera que los objetos commit.

* HEAD: Es un objeto simbólico que apunta generalmente al branch sobre el que estamos trabajando (lo que también conocemos como “checked out branch”). Si uno cambia de un branch al otro el HEAD apunta al último commit del branch seleccionado. Si uno hace un checkout de un determinado commit, el HEAD apunta a ese commit.

* Staging area: Es el lugar en el que se almacenan los cambios del working tree previos al commit. Es decir, contiene el set de cambios relevantes para el próximo commit.

* Index: Es un término alternativo para referirnos al staging area.

