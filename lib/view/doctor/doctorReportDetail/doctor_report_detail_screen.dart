import 'package:mad_app_flutter/constants.dart';
import 'package:mad_app_flutter/view/parents/bottomNavBar/app_bottom_nav_bar_screen.dart';
import 'package:mad_app_flutter/view/specialists/specialist_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class DoctorReportDetailScreen extends StatefulWidget {
  final String childName;
  final String childAge;
  final String childGender;
  final String date;
  final String childCase;
  final String childAdvice;
  final String total;
  final String parentUid;
  final String docId;
  final String user;

  const DoctorReportDetailScreen({super.key,
    required this.childName,
    required this.childAge,
    required this.childGender,
    required this.childCase,
    required this.childAdvice,
    required this.date,
    required this.total,
    required this.parentUid,
    required this.docId,
    required this.user,
  });

  @override
  State<DoctorReportDetailScreen> createState() => _DoctorReportDetailScreenState();
}

class _DoctorReportDetailScreenState extends State<DoctorReportDetailScreen> {
  final TextEditingController _evaluateControoler = TextEditingController();
  final FirebaseAuth _auth = FirebaseAuth.instance;
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
                    child: Text(widget.childName, style: TextStyle(color: Colors.black, fontWeight: FontWeight.w500,fontSize: 14),),
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
                    child: Text('Skin Disease', style: TextStyle(color: Colors.blue, fontWeight: FontWeight.w600,fontSize: 13),),
                  ),
                ),

                Container(
                  width: size.width*0.58,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(5),
                    //border: Border.all(color: Colors.blue,width: 0.5)
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(widget.childCase.toString() , style: TextStyle(color: Colors.black, fontWeight: FontWeight.w500,fontSize: 14),),
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
                    child: Text(widget.total, style: TextStyle(color: Colors.black, fontWeight: FontWeight.w500,fontSize: 14),),
                  ),
                ),


              ],),
          ),

          SizedBox(
            height: size.height*0.01,
          ),


          widget.user == 'doctor' ?

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

                    showDialog(
                      context: context,
                      builder: (BuildContext context1) {
                        return StatefulBuilder(builder: (setState, context2) {
                          return AlertDialog(
                            title: Text("Evaluate"),
                            content: Container(
                              decoration: BoxDecoration(color: Colors.white,
                                  borderRadius: BorderRadius.circular(10)),
                              margin: EdgeInsets.only(left: 16,right: 16,bottom: 0),
                              child: TextFormField(
                                controller: _evaluateControoler,
                                keyboardType: TextInputType.name,
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.black,

                                ),
                                onChanged: (value) {
                                  // setState(() {
                                  //   userInput.text = value.toString();
                                  // });
                                },
                                decoration: InputDecoration(
                                  //contentPadding: EdgeInsets.only(top: 15,bottom: 15),
                                  contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                                  focusColor: Colors.white,
                                  //add prefix icon

                                  // errorText: "Error",

                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),

                                  focusedBorder: OutlineInputBorder(
                                    borderSide:
                                    BorderSide(color: darkGreyTextColor1, width: 1.0),
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                  fillColor: Colors.grey,
                                  hintText: "Evaluate",

                                  //make hint text
                                  hintStyle: TextStyle(
                                    color: buttonColor,
                                    fontSize: 16,
                                    fontFamily: "verdana_regular",
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ),
                            ),
                            actions: [
                              TextButton(
                                child: Text("Cancel"),
                                onPressed:  () {
                                  Navigator.pop(context1);
                                },
                              ),
                              TextButton(
                                child: Text("Evaluate"),
                                onPressed:  () async {

                                  if(_evaluateControoler.text.isEmpty) {
                                    Fluttertoast.showToast(
                                      msg: "Enter number between 1-10",
                                      toastLength: Toast.LENGTH_SHORT,
                                      gravity: ToastGravity.BOTTOM,
                                      timeInSecForIosWeb: 4,
                                    );
                                  } else {

                                    if(int.parse(_evaluateControoler.text.toString()) < 11) {

                                      FirebaseFirestore.instance.collection("Bookings").doc(widget.docId).update({
                                        "evaluation": _evaluateControoler.text.toString(),
                                      }).then((value) {
                                        Navigator.pop(context1);
                                        Fluttertoast.showToast(
                                          msg: "Successfully Evaluated",
                                          toastLength: Toast.LENGTH_SHORT,
                                          gravity: ToastGravity.BOTTOM,
                                          timeInSecForIosWeb: 4,
                                        );
                                      });


                                    } else {
                                      Fluttertoast.showToast(
                                        msg: "Evaluate between 1-10",
                                        toastLength: Toast.LENGTH_SHORT,
                                        gravity: ToastGravity.BOTTOM,
                                        timeInSecForIosWeb: 4,
                                      );
                                    }

                                  }


                                },
                              ),
                            ],
                          );
                        });
                      },
                    );

                  }, child: Text('Evaluate', style: buttonStyle)),
            ),
          ) :  SizedBox(
            height: size.height*0.05,
          ),



          SizedBox(
            height: size.height*0.1,
          ),


        ],),
      ),

    );
  }



}
