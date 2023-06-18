import 'package:mad_app_flutter/constants.dart';
import 'package:flutter/material.dart';

class AboutUsScreen extends StatefulWidget {
  const AboutUsScreen({super.key});

  @override
  State<AboutUsScreen> createState() => _AboutUsScreenState();
}

class _AboutUsScreenState extends State<AboutUsScreen> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(

        iconTheme: IconThemeData(color: whiteColor, size: 25),
        leading: IconButton(onPressed: (){
          Navigator.of(context).pop();

        }, icon: Icon(Icons.arrow_back_ios, size: 18,color: whiteColor,)),
        automaticallyImplyLeading: true,
        elevation: 0,
        backgroundColor: appBarColor,
        title: Text(
          'About Us',
          style: TextStyle(fontSize: 19, fontWeight: FontWeight.w600,color: Colors.white),
        ),
        centerTitle: true,
      ),

      body: Column(children: [

        SizedBox(
          height: 10,
        ),

        Center(
          child: Container(
            width: size.width*0.95,
            child: Text(
              'About Us\n\n'
                  'In this app we are detecting skin disease\n\n'
                  'Skin diseases are more common than other diseases. Skin diseases may be caused by fungal infection, bacteria, allergy, or viruses, etc.\n\nThe advancement of lasers and Photonics based medical technology has made it possible to diagnose the skin diseases much more quickly and accurately. But the cost of such diagnosis is still limited and very expensive. '
              ,
              style: TextStyle(fontSize: 19, fontWeight: FontWeight.w400,color: Colors.black),
            ),
          ),
        ),

      ],),


    );
  }
}
