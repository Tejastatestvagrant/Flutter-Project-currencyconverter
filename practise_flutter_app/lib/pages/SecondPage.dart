import 'package:flutter/material.dart';

class SecondPage extends StatefulWidget {
  final String dataFromHome;

   const SecondPage({required this.dataFromHome, Key? key}) : super(key: key);

  String setToUSD() {
    // Assuming dataFromHome is in INR, you can replace 'INR' with the appropriate currency code
    double inrAmount = double.tryParse(dataFromHome) ?? 0.0;
    double exchangeRate = 0.014; // Replace with the actual exchange rate

    // Perform the conversion
    double usdAmountValue = inrAmount * exchangeRate;
   return '$usdAmountValue USD';

    // Update the state variable with the formatted USD valu
    }
    
  

  @override
  _SecondPageState createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();

    // Set up the animation controller
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );

    // Set up the scale animation
    _scaleAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.easeInOut,
      ),
    );

    // Start the animation
    _animationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        backgroundColor: Color.fromARGB(255, 223, 214, 214),
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('lib/assets/money2.jpeg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AnimatedBuilder(
                  animation: _scaleAnimation,
                  builder: (context, child) {
                    return Transform.scale(
                      scale: _scaleAnimation.value,
                      child: child,
                    );
                  },
                  child: Container(
                    height: 300.0,
                    width: 300.0,
                   decoration: const  BoxDecoration(
                    shape: BoxShape.circle ,
                      image: DecorationImage(
                        image: AssetImage('lib/assets/goldencoin.jpeg'),
                        fit: BoxFit.cover,
                      ),
                    ),
                    child:
                    
                      Center(
                        child: Text(
                                          widget.setToUSD(),
                                          style:const  TextStyle(
                                            fontSize: 20.0,
                                            color: const Color.fromARGB(255, 0, 0, 0),
                                            fontWeight: FontWeight.bold,
                                          ), 
                                          ),
                      ),
                ),
            ),
            ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }
}
