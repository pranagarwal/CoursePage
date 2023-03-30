import 'package:flutter/material.dart';
import 'package:app1/mainPage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
    debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Avenir',
      ),
      home: MyHomePage(),
      routes: {
      '/mainPage': (context) =>mainPage(),
      },

    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffff5954),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.only(left: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  child: Text("Online Learning", style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w900,
                    fontSize: 40,
                    height: 1,
                  ),),
                ),
                Container(
                  child: Text("is not the next", style: TextStyle(
                    color: Colors.white,
                    fontSize: 40,
                    fontWeight: FontWeight.w500,
                    height: 1,
                  ),),
                ),Container(
                  child: Text("big thing,", style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w900,
                    fontSize: 40,
                    height: 1,
                  ),),
                ),
                Container(
                  child: Text("It is now the", style: TextStyle(
                    color: Colors.white,
                    fontSize: 40,
                    fontWeight: FontWeight.w500,
                    height: 1,
                  ),),
                ),
                Container(
                child: Text("BIG THING", style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w900,
                fontSize: 40,
                height: 1,
      ),),
                ),
              ],
            ),
          ),
          Stack(
            children: [
              Container(
                alignment: Alignment.bottomCenter,
                height: MediaQuery.of(context).size.height*0.6,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/splash.png'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Positioned(
                bottom: 50,
                left: 0,
                right: 0,
                child: Center(
                  child: InkWell(
                    onTap: (){
                      openMainPage();
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(40)),
                      ),
                      child: const Text("Continue..", style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                      ),),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
  void openMainPage()
  {
    Navigator.pushNamed(context, '/mainPage');
  }
}
