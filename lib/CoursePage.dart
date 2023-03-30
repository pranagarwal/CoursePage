import 'package:flutter/material.dart';

class CoursePage extends StatefulWidget {
  const CoursePage({Key? key}) : super(key: key);

  @override
  State<CoursePage> createState() => _CoursePageState();
}

class _CoursePageState extends State<CoursePage> {
  late String chosenImg;
  late String chosenTitle;
  @override
  Widget build(BuildContext context) {
    final Map arguments = ModalRoute.of(context)?.settings.arguments as Map;
    chosenImg = arguments['img'];
    chosenTitle = arguments['title'];
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: Container(
          padding: EdgeInsets.all(5),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(20)),
            color: Color(0xffe1eaff),
          ),
          child: IconButton(
            onPressed: (){
              Navigator.pop(context);
            }, icon: Icon(Icons.arrow_back_ios),
            color: Color(0xff2657ce),
          ),
        ),
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("$chosenTitle", style: TextStyle(
              color: Color(0xff2657ce),
              fontSize: 27,
            ),),
            Text("Pranshu Agarwal", style: TextStyle(
              color: Colors.black.withOpacity(0.6),
              fontSize: 20,
            ),),
            SizedBox(height: 20,),
            Container(
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(30)),
                color: Color(0xffff5954),
              ),
              child: Hero(
                tag: '$chosenImg',
                child: Container(
                  height: 200,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/$chosenImg.png'),
                    )
                  ),
                ),
              ),
            ),
            SizedBox(height: 20,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Course", style: TextStyle(
                  fontSize: 45,
                  fontWeight: FontWeight.w600,
                ),),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 2),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(15)),
                    color: Color(0xffd3defa),
                  ),
                  child: Row(
                    children: [
                      Container(
                        width: 35,
                        child: IconButton(
                          icon: Icon(
                            Icons.timer_outlined,
                            color: Colors.blue,
                          ), onPressed: () {  },
                        ),
                      ),
                      Text("3 Hours, 20 Min", style: TextStyle(
                        color: Colors.black.withOpacity(0.7),
                      ),),
                    ],
                  ),
                )
              ],
            ),
            SizedBox(height: 10,),
            Expanded(child: SingleChildScrollView(
              child: Column(
                children: [
                  productListing('Introduction', 'Introduction of the Course', 'active'),
                  productListing('Language of Color', 'Physcology of Language', 'inactive'),
                  productListing('Different Color', 'Different types of Color', 'inActive'),
                  productListing('Summary', 'Summary of the Course', 'inctive'),
                ],
              ),
            ))
          ],
        ),
      )
    );
  }
  Column productListing(String title, String info,String activeOrinactive)
  {
    return Column(
      children: [
        SizedBox(height: 10,),
        Row(
          children: [
            Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                color: (activeOrinactive == 'active') ? Color(0xff2657ce): Color(0xffd3defa),
                borderRadius: BorderRadius.all(Radius.circular(17)),
              ),
              child: IconButton(
                icon: Icon(Icons.play_arrow), onPressed: () {  },
                color: (activeOrinactive == 'active') ? Colors.white: Color(0xff2657ce),
              ),
            ),
            SizedBox(width: 20,),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('$title', style: TextStyle(
                  fontSize: 20,
                ),),
                Text('$info', style: TextStyle(
                  fontSize: 18,
                  color: Colors.grey,
                ),)
              ],
            ),
          ],
        ),
        Center(
          child: Container(
            margin: EdgeInsets.symmetric(vertical: 10),
            width: MediaQuery.of(context).size.width*0.85,
            height: 0.5,
            color: Colors.grey,
          ),
        ),
        SizedBox(height: 20,),
      ],
    );
  }
}
