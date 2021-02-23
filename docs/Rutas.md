# Rutas

## Crear y editar registros (requiere autenticación y permisos)
Las siguientes rutas aplican para los recursos:
- Cursos.
- Capítulos.
- Contenidos.
- Contenidos de usuario.
- Matriculaciones.
- Contactos.

Para crear un nuevo contenido
```
transmediacademy.com/RECURSO/new1
```
Para editar el contenido N de un recurso
```
transmediacademy.com/RECURSO/N/edit
```

## Cambios de estado

Para alternar entre estado __publicado__/__en borrador__ del Curso, Capítulo o Contenido __N__:
```
transmediacademy.com/RECURSO/N/publicar
```
Para deshabilitar un contenido __N__:
```
transmediacademy.com/contents/N/deshabilitar
```
Para alternar entre estado __publicado__/__baneado__ del contenido de usuario __N__:
```
transmediacademy.com/contents/X/user_content/N/banear
```

Para alternar entre estado __publicado__/__fijado__ del contenido de usuario __N__:
```
transmediacademy.com/contents/X/user_content/N/fijar
```