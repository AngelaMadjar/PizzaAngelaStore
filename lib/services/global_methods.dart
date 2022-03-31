

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class GlobalMethods{


  //metod koj se povikuva pred da se izbrise item od cart kako predupreduvanje
  Future<void> showDialogg(String title, String subtitle, Function fct, BuildContext context) async {
    showDialog(context: context, builder: (BuildContext ctx){
      return AlertDialog(
        title: Row(
          children:[
            Padding(
              padding: const EdgeInsets.only(right:  6.0),
              child: Image.network(
                'https://firebasestorage.googleapis.com/v0/b/pizzaangela-82e5c.appspot.com/o/productImages%2Ferror_flaticon.png?alt=media&token=2b9f75b9-4ae8-4326-9380-c08bfb58ab58',
                height: 20,
                width: 20,),
            ),

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(title),
            ),
          ],
        ),
        content: Text(subtitle),
        actions: [
          TextButton(onPressed: () => Navigator.pop(context), child: Text('Cancel')),
          TextButton(onPressed: (){
            fct();
            Navigator.pop(context);
          }, child: Text('OK'))

        ],
      );
    });
  }


  Future<void> authErrorHandle(String subtitle, BuildContext context) async {
    showDialog(context: context, builder: (BuildContext ctx){
      return AlertDialog(
        title: Row(
          children:[
            Padding(
              padding: const EdgeInsets.only(right:  6.0),
              child: Image.network(
                'https://firebasestorage.googleapis.com/v0/b/pizzaangela-82e5c.appspot.com/o/productImages%2Ferror_flaticon.png?alt=media&token=2b9f75b9-4ae8-4326-9380-c08bfb58ab58',
                height: 20,
                width: 20,),
            ),

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text("Error occured"),
            ),
          ],
        ),
        content: Text(subtitle),
        actions: [
          TextButton(onPressed: (){
            Navigator.pop(context);
          }, child: Text('OK'))

        ],
      );
    });
  }

/*

  Future<void> showLocation(String longitude,String latitude, BuildContext context) async {
    showDialog(context: context, builder: (BuildContext ctx){
      return AlertDialog(
        title: Row(
          children:[
            Padding(
              padding: const EdgeInsets.only(right:  6.0),
              child: Image.network(
                'https://firebasestorage.googleapis.com/v0/b/pizzaangela-82e5c.appspot.com/o/productImages%2Flocation_pin.png?alt=media&token=bad65f36-b575-4030-9b15-665ed155a482',
                height: 20,
                width: 20,),
            ),

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text("Your location is ${longitude} ${latitude}"),
            ),
          ],
        ),
        content: Text("nesto"),
        actions: [
          TextButton(onPressed: (){
            Navigator.pop(context);
          }, child: Text('OK'))

        ],
      );
    });
  }

*/


}