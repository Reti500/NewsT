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




curl -d "noticia[titulo]=cuatromil&noticia[noticia]=nana nanan a&key_app=36403e55692f756f5c2f5b5263654f5b7a2034614b2a67317d5b48283b&key_user=8af9defd4080bf1ba77d886303e17ca9&id=1&categoria=Normal&filedata=@/Users/americamovil/Pictures/Chess.jpg" http://localhost:3000/api/v1/noticias.json

curl -F "noticia[titulo]=morir" -F "noticia[noticia]=jojojo" -F "key_app=36403e55692f756f5c2f5b5263654f5b7a2034614b2a67317d5b48283b" -F "key_user=8af9defd4080bf1ba77d886303e17ca9" -F "id=1" -F "categoria=Normal" -F "noticia[imagen]=@/Users/americamovil/Pictures/Chess.jpg" http://localhost:3000/api/v1/noticias.json