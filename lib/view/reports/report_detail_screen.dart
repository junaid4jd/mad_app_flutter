import 'package:mad_app_flutter/constants.dart';
import 'package:mad_app_flutter/view/parents/bottomNavBar/app_bottom_nav_bar_screen.dart';
import 'package:mad_app_flutter/view/specialists/specialist_screen.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class ReportDetailScreen extends StatefulWidget {
  final String name;
  final String date;
  final String Case;
  final String total;

  const ReportDetailScreen({super.key,
  required this.name,
  required this.Case,
  required this.date,
  required this.total,
  });

  @override
  State<ReportDetailScreen> createState() => _ReportDetailScreenState();
}

class _ReportDetailScreenState extends State<ReportDetailScreen> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: whiteColor, size: 25),
        automaticallyImplyLeading: true,
        elevation: 0,
        backgroundColor: appBarColor,
        title: Text(
          'Report',
          style: TextStyle(fontSize: 19, fontWeight: FontWeight.w600,color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(children: [

          SizedBox(
            height: size.height*0.02,
          ),



          SizedBox(
            height: size.height*0.01,
          ),

          Container(
            decoration: BoxDecoration(
              // color: Colors.white,
              // borderRadius: BorderRadius.circular(5)

            ),
            width: size.width*0.9,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(child: Text('Skin Disease Detection', style: TextStyle(color: Colors.blue, fontWeight: FontWeight.w600,fontSize: 15),)),
            ),
          ),

          SizedBox(
            height: size.height*0.01,
          ),


          Center(
            child: Container(
              width: size.width*0.9,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(5)

                    ),
                    width: size.width*0.3,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text('Date', style: TextStyle(color: Colors.blue, fontWeight: FontWeight.w600,fontSize: 13),),
                    ),
                  ),

                  Container(
                    width: size.width*0.58,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(5)
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(DateFormat('dd-MM-yyyy').format(DateTime.now()), style: TextStyle(color: Colors.black, fontWeight: FontWeight.w600,fontSize: 14),),
                    ),
                  ),


                ],),
            ),
          ),
          SizedBox(
            height: size.height*0.01,
          ),

          Container(
            width: size.width*0.9,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(5)

                  ),
                  width: size.width*0.3,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text('Patient Name', style: TextStyle(color: Colors.blue, fontWeight: FontWeight.w600,fontSize: 13),),
                  ),
                ),

                Container(
                  width: size.width*0.58,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(5)
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(widget.name, style: TextStyle(color: Colors.black, fontWeight: FontWeight.w500,fontSize: 14),),
                  ),
                ),


              ],),
          ),

          SizedBox(
            height: size.height*0.01,
          ),




          Container(
            width: size.width*0.9,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(5)

                  ),
                  width: size.width*0.3,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text('Confidence', style: TextStyle(color: Colors.blue, fontWeight: FontWeight.w600,fontSize: 13),),
                  ),
                ),

                Container(
                  width: size.width*0.58,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(5)
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(widget.total.toString() , style: TextStyle(color: Colors.black, fontWeight: FontWeight.w500,fontSize: 14),),
                  ),
                ),
              ],
            ),
          ),

          SizedBox(
            height: size.height*0.01,
          ),

          Container(
            width: size.width*0.9,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(5)

                  ),
                  width: size.width*0.3,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text('Disease Type', style: TextStyle(color: Colors.blue, fontWeight: FontWeight.w600,fontSize: 13),),
                  ),
                ),

                Container(
                  width: size.width*0.58,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(5)
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(widget.Case
                      , style: TextStyle(color: Colors.black, fontWeight: FontWeight.w500,fontSize: 14),),
                  ),
                ),
              ],
            ),
          ),

          SizedBox(
            height: size.height*0.01,
          ),

          Container(
            width: size.width*0.9,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(5)

                  ),
                  width: size.width*0.3,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text('Advice', style: TextStyle(color: Colors.blue, fontWeight: FontWeight.w600,fontSize: 13),),
                  ),
                ),

                Container(
                  width: size.width*0.58,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(5)
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'Consult to the skin specialist'

                      , style: TextStyle(color: Colors.black, fontWeight: FontWeight.w500,fontSize: 14),),
                  ),
                ),


              ],),
          ),

          SizedBox(
            height: size.height*0.05,
          ),

          Padding(
            padding: const EdgeInsets.only(left: 16,right: 16),
            child: Container(

              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                      color: Colors.black26, offset: Offset(0, 4), blurRadius: 5.0)
                ],
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  stops: [0.0, 1.0],
                  colors: [
                    fourColor,
                    fourColor,

                  ],
                ),
                borderRadius: BorderRadius.circular(5),
              ),
              child: ElevatedButton(
                  style: ButtonStyle(
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                    ),
                    minimumSize: MaterialStateProperty.all(Size(size.width, 50)),
                    backgroundColor:
                    MaterialStateProperty.all(Colors.transparent),
                    // elevation: MaterialStateProperty.all(3),
                    shadowColor:
                    MaterialStateProperty.all(Colors.transparent),
                  ),

                  onPressed: () async {



                    Navigator.push(
                      context,
                      PageRouteBuilder(
                        pageBuilder: (c, a1, a2) => SpecialistScreen(),
                        transitionsBuilder: (c, anim, a2, child) => FadeTransition(opacity: anim, child: child),
                        transitionDuration: Duration(milliseconds: 100),
                      ),
                    );


                  }, child: Text('Consult a Specialists', style: buttonStyle)),
            ),
          ),

          SizedBox(
            height: size.height*0.025,
          ),

          Padding(
            padding: const EdgeInsets.only(left: 16,right: 16),
            child: Container(

              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                      color: Colors.black26, offset: Offset(0, 4), blurRadius: 5.0)
                ],
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  stops: [0.0, 1.0],
                  colors: [
                    fourColor,
                    fourColor,

                  ],
                ),
                borderRadius: BorderRadius.circular(5),
              ),
              child: ElevatedButton(
                  style: ButtonStyle(
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                    ),
                    minimumSize: MaterialStateProperty.all(Size(size.width, 50)),
                    backgroundColor:
                    MaterialStateProperty.all(Colors.transparent),
                    // elevation: MaterialStateProperty.all(3),
                    shadowColor:
                    MaterialStateProperty.all(Colors.transparent),
                  ),

                  onPressed: () async {


                    Navigator.pushReplacement(
                      context,
                      PageRouteBuilder(
                        pageBuilder: (c, a1, a2) =>
                            AppBottomNavBarScreen(index: 0, title: '', subTitle: '',),
                        transitionsBuilder: (c, anim, a2, child) => FadeTransition(opacity: anim, child: child),
                        transitionDuration: Duration(milliseconds: 100),
                      ),
                    );



                  }, child: Text('Go Home', style: buttonStyle)),
            ),
          ),

          SizedBox(
            height: size.height*0.1,
          ),


        ],),
      ),

    );
  }
}
