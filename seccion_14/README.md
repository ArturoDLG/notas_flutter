# Seccion 14

Este es el proyecto del curso, donde se pone en practica todo lo visto en las secciones anteriores, para implementar
un app de streaming.

## Local deploy
Para serializar los archivos de la carpeta models usar el siguiente comando:

```
flutter pub get
flutter pub run flutter_gen:flutter_gen_command
flutter pub run build_runner build
```

## Caracteristicas

* Implementar Arquitectura limpia
* Ser multiplataforma (web, mobile y desktop) y adaptarse a diferentes formatos de pantalla 

## Conceptos a aprender

### Arquitectura limpia [Clean Architecture]
La arquitectura limpia es un enfoque en el diseño de software qe busca separar las diferentes capas del sistema, 
las cuales son: Data, Domain y Presentation.
Data hace referencia a la capa encargada de obtener la información para la app, ya sea alguna función del hardware,
conexiones a una base de datos, peticiones a una API, etc.
Domain es la abstraccion de esta información para ser mostrada al usuario.
Presentation es todo lo relacionado a la UI del sistema con la que interactua el usuario.

### Patrón Repository
Este patrón nos permite abstraer la logica de negocio que deseamos implementar, para darle modularidad a las funciones, lo cual, nos permite de manera sencilla implementar dicha logica independientemente de la tecnologia que usemos, haciendo mas facil migrar de ser necesario.