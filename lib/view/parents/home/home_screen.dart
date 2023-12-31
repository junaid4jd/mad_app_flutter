import 'package:mad_app_flutter/constants.dart';
import 'package:mad_app_flutter/view/auth/userType/usertype_screen.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ParentHomeScreen extends StatefulWidget {
  const ParentHomeScreen({super.key});

  @override
  State<ParentHomeScreen> createState() => _ParentHomeScreenState();
}



class _ParentHomeScreenState extends State<ParentHomeScreen> {

  List<Map<String, String>> images = [
    {
      "image": "assets/images/facial.png",
      "title": "Acne",
    },
    {
      "image": "assets/images/pimples.png",
      "title": "Rosacea",
    },
    {
      "image": "assets/images/psoriasis.png",
      "title": "Eczema",
    },
    {
      "image": "assets/images/superficial-spreading-melanoma.png",
      "title": "Melanoma ",
    },
  ];
  int _currentindex = 0;
  String name = '' , email = '',uid = '',userType = '';
  String text = '';
  int current = 0;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  getData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    setState(() {
      //userType = prefs.getString('userType')!;
      email = prefs.getString('userEmail')!;
      uid = prefs.getString('userId')!;
    });

    FirebaseFirestore.instance.collection('Users').where('uid',isEqualTo: _auth.currentUser!.uid.toString()).get().then((value) {
      setState(() {
        name = value.docs[0]['name'];
        email = value.docs[0]['email'];
      });
    });




  }


  Widget _buildCont(int index) {
    return Container(
      margin: const EdgeInsets.all(3),
      width: 20,
      height: 10,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(3),
          shape: BoxShape.rectangle,
          color: _currentindex == index
              ? secondary3Color
              : secondaryColor),
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    getData();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return  WillPopScope(
      onWillPop: showExitPopup,
      child: Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.white),
          title: Center(
            child: SizedBox(
              height: 40,
              width: 40,
              child: Image.asset('assets/autism.png', fit: BoxFit.scaleDown,
                height: 80,
                width: 80,),
            ),
          ),
          centerTitle: true,
        ),
        drawer: Drawer(
          backgroundColor: lightButtonGreyColor, //Colors.white,
          child: ListView(
            // Important: Remove any padding from the ListView.
            padding: EdgeInsets.zero,
            children: [

              DrawerHeader(
                decoration: BoxDecoration(
                  color: primaryColor,
                  borderRadius: BorderRadius.only(bottomRight: Radius.circular(50), bottomLeft: Radius.circular(50)),
                  // gradient: LinearGradient(begin: Alignment.topCenter,
                  //   end: Alignment.bottomCenter,
                  //   stops: [
                  //     0.1,
                  //     0.9
                  //   ], colors: [
                  //     darkRedColor,
                  //     lightRedColor,
                  //   ],
                  // ),
                ),
                margin: EdgeInsets.zero,
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset( 'assets/autism.png',height: 90,width: 100,fit: BoxFit.scaleDown,),
                      SizedBox(
                        height: 0,
                      ),
                      Text(name,
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 13,
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(email,
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w400,
                          fontSize: 10,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),

              Padding(
                padding:
                const EdgeInsets.only(top: 4, bottom: 4, left: 10, right: 10),
                child: ListTile(
                  shape: RoundedRectangleBorder(
                    //<-- SEE HERE
                    side: BorderSide(width: 1, color: whiteColor),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  tileColor: whiteColor,
                  leading: Container(

                      width: 30,
                      height: 30,
                      //devSize.height*0.05,
                      child: Image.asset('assets/images/shutdown.png', fit: BoxFit.scaleDown,
                        width: 30,
                        height: 30,
                      ),
                  ),
                  trailing: Icon(
                    Icons.arrow_forward_ios,
                    color: Colors.black,
                    size: 15,
                  ),
                  title: Text('Logout',),
                  onTap: () async {

                    SharedPreferences prefs = await SharedPreferences.getInstance();
                    try {
                      return await _auth.signOut().whenComplete(() {
                        prefs.remove('userEmail');
                        prefs.remove('userType');
                        prefs.remove('userPassword');
                        prefs.remove('userId');
                        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>UserType()));
                      });
                    } catch (e) {
                      return null;
                    }
                  },
                ),
              ),
              SizedBox(
                height: size.height*0.15,
              ),

            ],
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(
                height: 5,
              ),
            const Text(
              'Common Skin Disease Type',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
              const SizedBox(
                height: 5,
              ),
            CarouselSlider.builder(
              options: CarouselOptions(
                  onPageChanged: (index, _) {
                    setState(() {
                      _currentindex = index;
                    });
                  },
                  initialPage: 0,
                  autoPlay: true,
                  height: MediaQuery.of(context).size.height * 0.35),
              itemCount: images.length,
              itemBuilder: (BuildContext context, int index, int pageViewIndex) =>
                  Container(
                    margin:  EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        boxShadow:  [
                          BoxShadow(
                              offset: Offset(1, 0),
                              // The alignment of the effect(x,y)
                              spreadRadius: 0,
                              //Spread radius means how much it will spread
                              blurRadius: 4,
                              //How big the blus will be
                              color: Colors.grey //color of the effect.
                          )
                        ],
                        color:
                        index == 0 ? lightGreenColor :
                        index == 1 ? darkGreenColor :
                        index == 2 ? lightPeachColor :
                        index == 3 ? lightblueColor :
                        index == 4 ? secondaryColor :
                        index == 5 ? bgColor :
                        index == 6 ? oneColor1 :


                        Colors.white,
                        borderRadius: BorderRadius.circular(15)),
                    child: SizedBox(
                      height: MediaQuery.of(context).size.height * 0.25,
                      width: MediaQuery.of(context).size.width - 50,
                      child: Column(
                        children: [
                          const Spacer(),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.25,
                            child: Image.asset(
                              images[index]["image"].toString(),
                              fit: BoxFit.fill,
                            ),
                          ),
                          const Spacer(),
                          FittedBox(
                            child: Text(
                              images[index]["title"].toString(),
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                  fontSize: 21, color: Colors.black, fontWeight: FontWeight.bold),
                            ),
                          ),
                          const Spacer(),
                        ],
                      ),
                    ),
                  ),
            ),
              const SizedBox(
              height: 5,
            ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _buildCont(0),
                  _buildCont(1),
                  _buildCont(2),
                  _buildCont(3),
                  _buildCont(4),
                  _buildCont(5),
                  _buildCont(6),
                  _buildCont(7),
                ],
              ),
              const SizedBox(
                height: 25,
              ),
              Container(
                child: const Text(
                  'Most Rated Centers',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Container(
                // height: 120,
                child:  StreamBuilder(
                  stream: FirebaseFirestore.instance.collection("Doctors").snapshots(),
                  builder: (context, snapshot) {
                    if (!snapshot.hasData) {
                      return Center(
                          child: CircularProgressIndicator(
                            strokeWidth: 1,
                            color: primaryColor,
                          ));
                    } else if (snapshot.hasData && snapshot.data!.docs.isEmpty) {
                      // got data from snapshot but it is empty

                      return Center(child: Text("No Data Found"));
                    } else {
                      return Center(
                        child: Container(
                          width: size.width * 0.95,
                          child: ListView.builder(
                            itemCount: snapshot.data!.docs.length,
                            shrinkWrap: true,
                            scrollDirection: Axis.vertical,
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: const EdgeInsets.only(top: 8),
                                child: Container(
                                  height: 120,
                                  margin: const EdgeInsets.symmetric(horizontal: 10),
                                  width: MediaQuery.of(context).size.width * 0.9,
                                  clipBehavior: Clip.antiAliasWithSaveLayer,
                                  decoration: BoxDecoration(
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.grey.withOpacity(0.4),
                                        offset: const Offset(6, 6),
                                        blurRadius: 8,
                                      ),
                                      BoxShadow(
                                        color: Colors.grey.withOpacity(0.3),
                                        offset: const Offset(4, 4),
                                        blurRadius: 5,
                                      ),
                                    ],
                                    color:
                                    index == 0 ? lightGreenColor :
                                    index == 1 ? darkGreenColor :
                                    index == 2 ? lightPeachColor :
                                    index == 3 ? lightblueColor :
                                    index == 4 ? secondaryColor :
                                    index == 5 ? bgColor :
                                    index == 6 ? oneColor1 :


                                    Colors.white,

                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Stack(
                                    children: [
                                      Container(
                                        width:
                                        MediaQuery.of(context).size.width * 0.6,
                                        height:
                                        MediaQuery.of(context).size.height * 0.5,
                                       color:
                                       index == 0 ? lightGreenColor :
                                       index == 1 ? darkGreenColor :
                                       index == 2 ? lightPeachColor :
                                       index == 3 ? lightblueColor :
                                       index == 4 ? secondaryColor :
                                       index == 5 ? bgColor :
                                       index == 6 ? oneColor1 :


                                       Colors.white
                                        ,
                                      ),
                                      Column(
                                        children: [
                                          Row(
                                            mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                            children: [
                                              Padding(
                                                padding:
                                                const EdgeInsets.only(top: 20,left: 10),
                                                child: Column(
                                                  crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                                  children: [
                                                    Row(
                                                      children: [
                                                        const Icon(
                                                          Icons.location_on_outlined,
                                                          color: Colors.black,
                                                          size: 20,
                                                        ),
                                                        FittedBox(
                                                          fit: BoxFit.contain,
                                                          child: Text(
                                                            snapshot
                                                                .data!
                                                                .docs[index]
                                                            ["address"]
                                                                .toString(),
                                                            style: const TextStyle(
                                                                fontSize: 15,
                                                                fontWeight:
                                                                FontWeight.bold,
                                                                color: Colors.black),
                                                          ),
                                                        )
                                                      ],
                                                    ),
                                                    const SizedBox(
                                                      height: 20,
                                                    ),
                                                    Row(
                                                      children: [
                                                        const Icon(
                                                          Icons.call_outlined,
                                                          color: Colors.black,
                                                          size: 20,
                                                        ),
                                                        Text(
                                                          snapshot
                                                              .data!
                                                              .docs[index]
                                                          ["phone"]
                                                              .toString(),
                                                          style: const TextStyle(
                                                              fontSize: 15,
                                                              fontWeight:
                                                              FontWeight.bold,
                                                              color: Colors.black),
                                                        )
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Expanded(
                                                child: Column(
                                                  children: [
                                                    Padding(
                                                      padding: const EdgeInsets.only(
                                                          top: 10.0, bottom: 5),
                                                      child: CircleAvatar(
                                                        radius: 40,
                                                        foregroundImage: NetworkImage(
                                                          snapshot
                                                              .data!
                                                              .docs[index]
                                                          ["image"]
                                                              .toString(),
                                                        ),
                                                      ),
                                                    ),
                                                    FittedBox(
                                                      child: Text(
                                                        snapshot
                                                            .data!
                                                            .docs[index]
                                                        ["clinicName"]
                                                            .toString(),
                                                        overflow: TextOverflow.fade,
                                                        maxLines: 1,
                                                        style: const TextStyle(
                                                            fontSize: 16,
                                                            fontWeight:
                                                            FontWeight.bold,
                                                            color: Colors.blue),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),

                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                            //Container(child: Text('AdminHome'),),
                          ),
                        ),
                      );
                    }
                  },
                ),
              ),
              const SizedBox(
                height: 25,
              ),
          ],),
        ),
      ),
    );
  }

  Future<bool> showExitPopup() async {
    return await
    showDialog(
      //show confirm dialogue
      //the return value will be from "Yes" or "No" options
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Exit App'),
        content: Text('Do you want to exit the App?'),
        actions:[
          ElevatedButton(
            style: ElevatedButton.styleFrom(
                primary: primaryColor,
                textStyle: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold)),
            onPressed: () => Navigator.of(context).pop(false),
            //return false when click on "NO"
            child:Text('No'),
          ),

          ElevatedButton(
            onPressed: () => Navigator.of(context).pop(true),
            //return true when click on "Yes"
            style: ElevatedButton.styleFrom(
                primary: redColor,
                textStyle: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold)),
            child:Text('Yes'),
          ),

        ],
      ),
    )??false; //if showDialouge had returned null, then return false
  }

}
