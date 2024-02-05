import "package:flutter/material.dart";
import "package:practise_flutter_app/pages/SecondPage.dart";

class HomePageOfConverterStatefull extends StatefulWidget {
  const HomePageOfConverterStatefull({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _HomePageOfConverterState();
  }
}

class _HomePageOfConverterState extends State<HomePageOfConverterStatefull> {
  String result = '';
  final TextEditingController textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow[800],
    
      appBar: AppBar(
        centerTitle: true ,
        title: const Text("Currency Converter"),
        backgroundColor:  const Color.fromARGB(255, 228, 192, 135),
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('lib/assets/money3.jpeg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                "",
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.brown,
                ),
              ),
              const SizedBox(
                height: 18,
              ),
              TextField(
                controller: textController,
                textAlign: TextAlign.center,
                decoration: InputDecoration(
                  hintText: "INR",
                  fillColor: Colors.amber[200],
                  focusedBorder: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                  ),
                  filled: true,
                ),
                keyboardType: const TextInputType.numberWithOptions(decimal: true),
              ),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                onPressed: () {
                  result = textController.text;
                  if (result.isNotEmpty) {


                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SecondPage(dataFromHome: result),
                      ),
                    );
                  } else {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: const Text("Error"),
                          content: const Text("Please enter a value"),
                          actions: [
                            TextButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              child: const Text('OK'),
                              
                            ),
                          ],
                        );
                      },
                    );
                  }
                textController.clear();
                },
                style: const ButtonStyle(
                  elevation: MaterialStatePropertyAll(20),
                ),
                child: const Icon(Icons.monetization_on),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
