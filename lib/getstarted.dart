import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: getstarted(),
      darkTheme: ThemeData.dark(),

    );
  }
}
class getstarted extends StatefulWidget {
  const getstarted({Key? key}) : super(key: key);

  @override
  State<getstarted> createState() => _getstartedState();
}

class _getstartedState extends State<getstarted> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: SafeArea(
      child: Container(
      width: double.infinity,
      height: MediaQuery.of(context).size.height,
      padding: EdgeInsets.symmetric(horizontal: 30,vertical: 30),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
        Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            "Hello There!",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 40),
          ),
          SizedBox(height: 30,),
          Text("Automatic identity verification which enable you to verify your identity",
            textAlign: TextAlign.center,
            style: TextStyle(
                color: Colors.grey[700],
                fontSize: 15,
            ),
          ),
        ],
      ),

          Container(
            height: MediaQuery.of(context).size.height/3,
            decoration: const BoxDecoration(
                // image:DecorationImage(image: AssetImage('assets/Illustration.png'))
            ),
          ),


        ]
      )
          )
      )
    );
  }
}
