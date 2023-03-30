import 'package:flutter/material.dart';
import 'CoursePage.dart';

class mainPage extends StatelessWidget {
  const mainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MainPage(),
      routes: {'/coursePage': (context) => CoursePage(),
      }
    );
  }
}

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xfff4f6fd),
        body: Container(
          padding: EdgeInsets.only(top: 40, left: 30, right: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Hello Developers",
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.blueAccent,
                    ),
                  ),
                  Container(
                    height: 40,
                    width: 40,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        image: AssetImage('assets/profilePic.png'),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 40,
              ),
              Text(
                "What do you \nwant to \nlearn today?",
                style: TextStyle(
                  fontSize: 35,
                  height: 1.3,
                  fontWeight: FontWeight.w700,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width * 0.4,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              courseWidget('MultiMedia', 'Animation Course',
                                  'img1', Color(0xffff6a65), Color(0xffff5954)),
                              SizedBox(
                                height: 20,
                              ),
                              courseWidget(
                                  'Social Media',
                                  'Social Media Monitoring',
                                  'img2',
                                  Color(0xffe9eefa),
                                  Colors.white),
                            ],
                          ),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width * 0.4,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SizedBox(
                                height: 50,
                              ),
                              courseWidget(
                                  'Programming',
                                  'Python for everybody',
                                  'img3',
                                  Color(0xffe9eefa),
                                  Colors.white),
                              SizedBox(
                                height: 20,
                              ),
                              courseWidget(
                                  'Graphic Design',
                                  'Fundamentals of Design',
                                  'img4',
                                  Color(0xffbdcddfa),
                                  Color(0xffcedaff)),
                            ],
                          ),
                        ),
                      ]),
                ),
              ),
              Container(
                padding: EdgeInsets.all(20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      icon: Icon(Icons.subscriptions,
                    color: Color(0xff2657ce),
                      size: 40 ,
                    ), onPressed: () {  },
                    ),
                    IconButton(
                      icon: Icon(Icons.play_circle_filled,
                    color: Color(0xff2657ce).withOpacity(0.5),
                      size: 40 ,
                    ), onPressed: () {  },
                    ),IconButton(
                      icon: Icon(Icons.account_circle,
                    color: Color(0xff2657ce).withOpacity(0.5),
                      size: 40 ,
                    ), onPressed: () {  },
                    ),
                  ],
                ),
              )
            ],
          ),
        ));
  }

  Container courseWidget(String category, String title, String img,
      Color categoryColor, Color bgColor) {
    return Container(
      padding: EdgeInsets.only(top: 20, left: 20, right: 20, bottom: 10),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.all(Radius.circular(30)),
      ),
      child: InkWell(
        onTap: () {openCoursePage("$img", '$title');},
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: categoryColor,
                borderRadius: BorderRadius.all(Radius.circular(20)),
              ),
              child: Text(
                category,
                style: TextStyle(
                  color: (categoryColor == Color(0xffe9eefa)
                      ? Color(0xff2657ce)
                      : Colors.white),
                ),
              ),
            ),
            SizedBox(height: 10,),
            Text('$title', style: TextStyle(
              color: (bgColor == Color(0xffff5954)) ? Colors.white: Colors.black,
              fontSize: 20,
              height: 1,
            ),),
            SizedBox(height: 10,),
            Row(
              children: [
                Container(
                  height: 5,
                  width: 100,
                  color: (bgColor == Color(0xffff5954)) ? Colors.red: Color(0xff2657ce),
                ),
                Expanded(child: Container(
                  height: 5,
                  color: (bgColor == Color(0xffff5954)) ? Colors.white.withOpacity(0.5): Color(0xff2657ce).withOpacity(0.5),
                ))
              ],
            ),
            SizedBox(height: 10,),
            Hero(tag: '$img', child: Container(
              height: 80,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/$img.png'),
                )
              ),
            )),
          ],
        ),
      ),
    );
  }
  void openCoursePage(String img, String title)
  {
    Navigator.pushNamed(context, '/coursePage', arguments: {'img': '$img', 'title': '$title'});
  }
}
