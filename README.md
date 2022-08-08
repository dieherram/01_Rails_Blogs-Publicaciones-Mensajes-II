# Blogs/Publicaciones/Mensajes II

I.	Cree los modelos apropiados.
rails g model User first_name:string last_name:string email_address:string
rails g model Blog name:string description:string
rails g model Post title:string content:text blog:references user:references
rails g model Owner blog:references user:references
rails g model Message author:string message:text post:references user:references

rails db:migrate

II.	Cree las validaciones apropiadas (piensa en los campos que vas a requerir, que otra regla de validación necesitarías).
PENDIENTE PENDIENTE PENDIENTE PENDIENTE PENDIENTE PENDIENTE

Usando la consola:
1.	Crear 5 Usuarios.
User.create([{ first_name: "Pedro", last_name: "Dojo", email_address: "pedro@dojo.cl"}, {first_name: "Juan", last_name: "Dojo", email_address: "juan@dojo.cl"}, {first_name: "Diego", last_name: "Dojo", email_address: "diego@dojo.cl"}, {first_name: "Jose", last_name: "Dojo", email_address: "jose@dojo.cl"}, {first_name: "Luis", last_name: "Dojo", email_address: "luis@dojo.cl" }])

2.	Crear 5 blogs.
Blog.create([{ name: "ESPN", description: "Contenido deportivo"}, {name: "HBO", description: "Contenido cinematografico"}, {name: "MTV", description: "Contenido musical"}, {name: "TVN", description: "Contenido nacional"}, {name: "CNN", description: "Contenido internacional" }])

3.	Haz que los primeros 3 blogs pertenezcan al primer usuario.
u = User.first
b1 = Blog.first
b2 = Blog.second
b3 = Blog.third
Owner.create([{user: u, blog: b1}, {user: u, blog: b2}, {user: u, blog: b3}])

4.	Haz que el cuarto blog que crea pertenezca al segundo usuario.
u = User.second
b = Blog.fourth
Owner.create(user: u, blog: b)

5.	Haz que el quinto blog que crea pertenezca al último usuario.
u = User.find_by(first_name: "Luis")
b = Blog.find_by(name: "CNN")
Owner.create(user: u, blog: b)

6.	Haz que el tercer usuario sea el propietario de todos los blogs que se crearon.
o = Owner.all
o.update_all(user_id: 3)

7.	Haz que el primer usuario cree tres publicaciones para el blog con id = 2. Recuerde que no debe hacer Publicacion.create(usuario: Usuario.first, blog_id: 2), 
sino algo como Publicacion.create(usuario: Usuario.first, blog: Blog.find(2)). Repito, nunca se debe hacer referencia a las claves foráneas en Rails.
Post.create(user: User.first, blog: Blog.second, title: "Cine de terror", content: "Top 10 peliculas de terror")
Post.create(user: User.first, blog: Blog.second, title: "Cine de suspenso", content: "Top 10 peliculas de suspenso")
Post.create(user: User.find_by(first_name: "Pedro"), blog: Blog.find_by(name: "HBO"), title: "Cine de accion", content: "Top 10 peliculas de accion")

8.	Haz que el segundo usuario cree 5 publicaciones para el último blog.
Post.create([{user: User.second, blog: Blog.last, title: "China", content: "Noticias del pais asiatico"}, {user: User.second, blog: Blog.last, title: "Argentina", content: "Noticias del pais sudamericano"}, {user: User.second, blog: Blog.last, title: "España", content: "Noticias del pais europeo"}, {user: User.second, blog: Blog.last, title: "Colombia", content: "Noticias del pais sudamericano"}, {user: User.second, blog: Blog.last, title: "Corea del Sur", content: "Noticias del pais asiatico"}])

9.	Haz que el tercer usuario cree varias publicaciones en diferentes blogs.
u = User.third
Post.create([{user: u, blog: Blog.second, title: "Alien", content: "Mi opinion sobre Alien"}, {user: u, blog: Blog.fourth, title: "Nueva constitucion", content: "Mi opinion sobre la nueva constitucion"}, {user: u, blog: Blog.third, title: "Primavera Fauna", content: "Vuelven los grandes eventos musicales"}])

10.	Haz que el tercer usuario cree 2 mensajes para la primera publicación creada y 3 mensajes para la segunda publicación creada.
u = User.third
p = Post.first
Message.create([{user: u, post: p, author: "nickname", message: "este es el primer mensaje del primer post"}, {user: u, post: p, author: "nickname", message: "este es el segundo mensaje del primer post"}])

t = Post.second
Message.create([{user: u, post: t, author: "nickname", message: "este es el primer mensaje del segundo post"}, {user: u, post: t, author: "nickname", message: "este es el segundo mensaje del segundo post"}, {user: u, post: t, author: "nickname", message: "este es el tercer mensaje del segundo post"}])

11.	Haz que el cuarto usuario cree 3 mensajes para la última publicación que tu creaste.
u = User.fourth
p = Post.last
Message.create([{user: u, post: p, author: "nickname", message: "este es el primer mensaje del ultimo post"}, {user: u, post: p, author: "nickname", message: "este es el segundo mensaje del ultimo post"}, {user: u, post: p, author: "nickname", message: "este es el tercer mensaje del ultimo post"}])

12.	Cambie el propietario de la 2 publicación para que sea el último usuario.
p = Post.find_by(title: "Cine de accion")
p.update(user: User.last)

13.	Cambie el contenido de la segunda publicación por algo diferente.
p = Post.find_by(title: "Cine de accion")
p.update(content: "Top 20 peliculas de accion")

14.	Obtenga todos los blog que son propiedad del tercer usuario (haz que esto funcione con un simple Usuario.find(3).blogs).
User.find(3).blogs

15.	Obtenga todas las publicaciones que fueron creadas por el tercer usuario.
User.find(3).posts

16.	Obtenga todos los mensajes escritos por el tercer usuario.
User.find(3).messages

17.	Obtenga todas las publicaciones asociadas al blog con id = 5 y quién dejó cada publicación.
Blog.find(5).posts

18.	Obtenga todos los mensajes asociados al blog con id = 5, junto con toda la información de los usuarios que dejaron mensajes.
se agrega mensaje al post correspondiente al blog id 5:
u = User.third
p = Post.find_by(title: "China") 

Message.create([{user: u, post: p, author: "nickname", message: "mensaje de prueba para el post de noticias sobre China"}

se busca mensaje con la informacion del  autor:
Post.find_by(blog_id: 5).messages

19.	Obtenga toda la información de los usuarios que son propietarios del primer blog (haz que esto funcione con un simple Blog.first.propietarios).
Blog.first.owners

20.	Cámbielo, es decir, el primer usuario ya no es propietario del primer blog.
o = Blog.first.owners
o.update(user_id: 2)