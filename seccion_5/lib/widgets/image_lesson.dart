//Seccion 5
//Lecciones:
//116 - 118: Imágenes
//Arturo DLG
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

/*
Flutter nos provee de un widget para renderizar imagenes en nuestras 
aplicaciones, llamado Image, el cual se usa a traves de sus factories 
construtors, de los cuales estos son algunos:

* asset: renderiza una imagen dentro del proyecto
* network: renderiza una imagen dada por un Url

Estos construtores comparten caracteristicas, como el poder recibir dimensiones,
y la relacion de tamaño de la imagen. Como caractreristica particular, network 
nos permite renderizar un widget de carga en lo que obtenemos de imagen.

Una alternativa a Image.network es el paquete cached_network_image el cual nos
provee de una clase que nos permite renderizar imagenes de internet, pero con la 
ventaja de poder ser guardadas en cache para al momento de abrir la app, tener
un tiempo de espera menor, ademas de que facilita la renderizacion de widgets de
carga y de error en caso de que la imagen no sea encontrada.
*/

class ImageLesson extends StatelessWidget {
  const ImageLesson({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Container(
              color: Colors.blueGrey,
              // width: 500,
              // height: 500,
              child: Image.asset(
                'assets/images/dart.png',
                width: 300,
                height: 200,
                //cambiar la relacion de tamaño de la imagen
                fit: BoxFit.contain,
              ),
            ),
            Container(
              width: 200,
              height: 200,
              color: Colors.grey,
              child: Image.network(
                'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQmk-E3HOrYzII9gVwT8kZs4z6iukWKDaxe5g&usqp=CAU',
                loadingBuilder: (_, child, event) {
                  if (event == null) {
                    return child;
                  }
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                },
              ),
            ),
            CachedNetworkImage(
              imageUrl:
                  'https://res.cloudinary.com/startup-grind/image/upload/c_fill,dpr_2,f_auto,g_center,q_auto:good/v1/gcs/platform-data-goog/events/learn-hero.png',
              placeholder: (_, __) => const CircularProgressIndicator(),
              errorWidget: (_, __, ___) => const Icon(Icons.error),
            ),
          ],
        ),
      ),
    );
  }
}

/*
Nota: 
fit es un parametro que nos permite escalar nuestra imagen segun nuestras 
necesidades, para esto contamos con la clase BoxFit, el cual escala la imagen de
la siguiente manera:

* contain: es el modo por defecto del parametro fit, el cual hace a la imagen 
ajustarse al ahncho y alto disponible sin deformarse.

* cover: la imagen se escalara para ocupar toda la altura y anchura disponible 
sin deformarse, por lo que podria verse cortado.

* fill: hará que la imagen se deforme a las dimensiones establecidas.

* fitHeight: ocupara la altura disponible sin deformarse.

* fitWidth: ocupara el ancho disponible sin deformarse.

Si el widget padre tiene las dimensiones definidas, entonces Image ignorara las
dimensiones que se le establezcan.

Para visualizar imagenes de interne en nuestra app fuera del modo debug, debes 
de otorgar los permisos correspondientes para el sistema que lo compilas.

Por defecto, Android y iOS bloquean enlaces no seguros (que no empiezan en http).
*/