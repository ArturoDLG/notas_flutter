//Seccion 5
//94: El widget Row
//Arturo DLG
import 'package:flutter/material.dart';

/*
El widget Row es un widget bastante similar a Column, con la diferencia de 
agrupar widgets de manera horizontal, al igual que Column, cuenta con 
Expanded y Spacer para distribuir los widgets dentro de este.
*/

class RowLesson extends StatelessWidget {
  const RowLesson({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Center(
        child: Container(
          height: 200,
          color: Colors.grey,
          child: Row(
            //espaciar elementos
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //alinear elementos
            crossAxisAlignment: CrossAxisAlignment.center,
            //espacio a ocupar
            //mainAxisSize: MainAxisSize.min,
            children: [
              Expanded(
                flex: 2,
                child: Container(
                  width: 50,
                  height: 50,
                  color: Colors.red,
                ),
              ),
              Container(
                width: 50,
                height: 100,
                color: Colors.green,
              ),
              Expanded(
                child: Container(
                  width: 50,
                  height: 50,
                  color: Colors.orange,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
