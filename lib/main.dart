import 'dart:ui';
import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  return runApp(MaterialApp(
    home: Scaffold(
      backgroundColor: Colors.blueGrey,
      appBar: AppBar(
        title: Text('Lancia i dati!'),
        centerTitle: true,
      ),
      //fuznione di ingresso
      body: DicePage(),
    ),
  ));
}

//Questo nuovo tipo di metodo puo essere cambiato duranete l'esecuzione
//statefullwidget puo cambiare ogni volta che compiamo un'azione.
class DicePage extends StatefulWidget {
  @override
  _DicePageState createState() => _DicePageState();
}

class _DicePageState extends State<DicePage> {
  int leftDiceNumber = 1;
  int rightDiceNumber=1;
  @override
  Widget build(BuildContext context) {
    //in questo modo inserisco tutto al centro.
    return Center(
      child: Row(
        //creo il widget per la righe.
        children: <Widget>[
          //inserisco all'interno del widget l'immagine che andro ad usare nell'app.
          Expanded(
            //il padding aggiunge spazio all'interno di un widget
            //mentre il margin aggiunge spazio all'esterno del widget.
            //flatButton è un widget usato per creare bottoni
            child: FlatButton(
              onPressed: () {
                //il metodo set state cambia il valore di una variabile o di altri oggetti
                //quando qualcosa un tasto nell'app viene premuta.
                //il metodo cambia l'aspertto dell'intera app.
                setState(() {
                  leftDiceNumber = Random().nextInt(6) + 1;
                });

                print('Il bottone sinistro è stao premuto $leftDiceNumber');
              },
              child: Image.asset('images/dice$leftDiceNumber.png'),
            ),
          ),

          Expanded(
              //flatButton è un widget usato per riprodurre dei bottoni.

              child: FlatButton(
            //per rendere interattivo un bottone dobbiamo inserire all'interno del widget
            //un metodo che altera lo stato del bottone una volta premuto.
            onPressed: () {
              setState(() {
                rightDiceNumber = Random().nextInt(6) + 1;
              });
              print('Il bottone di destra è stato premuto');
            },
            child: Image.asset('images/dice$rightDiceNumber.png'),
          )),
        ],
      ),
    );
  }
}
