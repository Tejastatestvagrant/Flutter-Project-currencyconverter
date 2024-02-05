import "package:flutter/material.dart";
import "package:practise_flutter_app/pages/HomePageOfConvertedStateFull.dart";



void main(){

    runApp(MyApp());

}


class MyApp extends StatelessWidget {

      const  MyApp({super.key});


  @override
  
  Widget build(BuildContext context){
     
     return MaterialApp(
       title: "Currency converter",
       theme: ThemeData.light(),
       home: const   HomePageOfConverterStatefull(),


     );

  }

}
