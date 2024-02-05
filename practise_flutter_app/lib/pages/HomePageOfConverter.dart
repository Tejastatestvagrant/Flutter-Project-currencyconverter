import 'package:flutter/material.dart';
import 'package:practise_flutter_app/pages/SecondPage.dart';

class HomePageOfConverter extends StatelessWidget {
  const HomePageOfConverter({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow[800],
      appBar: AppBar(
        title: const Text("Currency Converter"),
         backgroundColor: Colors.yellow[800],
      ),
      body: Container(
        decoration:  const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('lib/assets/money3.jpeg'),
            fit: BoxFit.cover, // You can adjust the fit as needed
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(  
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                 Text(
                  "",
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.yellow[800],
                  ),
                ),
                const SizedBox(
                  height: 18,
                ),
                 TextField(
                  textAlign: TextAlign.center,
                  decoration: InputDecoration(
                      hintText: "Enter INR-USD",
                      fillColor: Colors.amber[200],
                      focusedBorder: const OutlineInputBorder(
                      borderRadius:  BorderRadius.all(Radius.circular(20))),
                      filled: true),
                  keyboardType: const TextInputType.numberWithOptions(decimal: true),
                ),
                const SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                  onPressed: () {

                    
                    Navigator.push(
              context,

               MaterialPageRoute(builder: (context) =>  SecondPage(dataFromHome: "result")),
            );
                  },
                  style:
                      const ButtonStyle(elevation: MaterialStatePropertyAll(20)),
                  child: const Icon(Icons.monetization_on),
                )
              ]),
        ),
      ),
    );
  }
}
