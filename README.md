NewsT
=====

NewsTeller


Creacion de la API

	- Base de datos
		+ 80%
	- Serializers
		+ 50%
	- Rutas
		+ 10%
	- Seguridad
		+ 0%
	- oAuth
		+ 0%

Rutas de la API
La API se encuentra en la version 1.0

	- root -> www.newstellerapp.com

	- Nuevo usuario
		+ root/api/v1/users.json?username&email&password&key_app
			- "user[username]=xxx&user[email]=xxx&user[password]&user[key_app]=xxx"

	- root/api/v1/noticias
		+ Obtenemos las ultimas 10 noticias publicadas
	- root/api/v1/noticias?datos
		+ Agregar una noticia