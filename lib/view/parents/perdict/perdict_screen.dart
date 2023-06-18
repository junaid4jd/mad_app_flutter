import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_tflite/flutter_tflite.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:mad_app_flutter/constants.dart';
import 'package:mad_app_flutter/model/questionare_model.dart';
import 'package:mad_app_flutter/view/parents/bottomNavBar/app_bottom_nav_bar_screen.dart';
import 'package:mad_app_flutter/view/parents/questionare/questionare_screen.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:mad_app_flutter/view/specialists/specialist_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PerdictScreen extends StatefulWidget {
  const PerdictScreen({super.key});

  @override
  State<PerdictScreen> createState() => _PerdictScreenState();
}

class _PerdictScreenState extends State<PerdictScreen> {
  String name = '', email = '';
  String text = '',type = '',confidence = '';
  final FirebaseAuth _auth = FirebaseAuth.instance;
  String subject = '';

  // final GoogleSignIn googleSignIn = GoogleSignIn();
  PickedFile? pickedFile;
  String imageLogo = '';
  bool isLoading = false;


  String uid = '',image = '', address = '',gender = '';
  int current = 0;

  getData() async {


    FirebaseFirestore.instance.collection('Users').where('uid',isEqualTo: _auth.currentUser!.uid.toString()).get().then((value) {
      setState(() {
        name = value.docs[0]['name'];
        email = value.docs[0]['email'];
        address = value.docs[0]['address'];
        image = value.docs[0]['image'];
      });
    });




  }

  @override
  void initState() {
    // TODO: implement initState
    getData();
    super.initState();
  }

  // getData() async {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   FirebaseFirestore.instance.collection('Users').doc(prefs.getString('userId')!).get().then((value) {
  //     print('Teachers get');
  //     print(value.data());
  //     setState(() {
  //       email = value.data()!['email'].toString();
  //       name = value.data()!['name'].toString();
  //     });
  //   });
  // }

  _imgFromCamera(bool isProfile) async {
    pickedFile = (await ImagePicker.platform.pickImage(source: ImageSource.camera, imageQuality: 50))!;
    setState(() {
      imageLogo = pickedFile!.path.toString();
      print(pickedFile!.path.toString());
    });
  }

  _imgFromGallery(bool isProfile) async {
    // FilePickerResult? picked = await FilePicker.platform.pickFiles(

    pickedFile = (await ImagePicker.platform.pickImage(source: ImageSource.gallery, imageQuality: 50));
    final file = File(pickedFile!.path);

    setState(() {
      imageLogo = pickedFile!.path.toString();
      print(pickedFile!.path.toString());
    });
  }

  void _showPicker(context, bool isProfile) {
    showModalBottomSheet(
        backgroundColor: Colors.white,
        context: context,
        builder: (BuildContext bc) {
          return SafeArea(
            child: Container(
              child: new Wrap(
                children: <Widget>[
                  new ListTile(
                      leading: new Icon(Icons.photo_library),
                      title: new Text('Photo Library'),
                      onTap: () {
                        _imgFromGallery(isProfile);

                        Navigator.of(context).pop();
                      }),
                  new ListTile(
                    leading: new Icon(Icons.photo_camera),
                    title: new Text('Camera'),
                    onTap: () {
                      _imgFromCamera(isProfile);
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              ),
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final devSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryColor,
        title: Text("Home"),
        centerTitle: true,
      ),
      drawer: Drawer(
        backgroundColor: Colors.white,
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: primaryColor,
              ),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      radius: 40,
                      backgroundImage: NetworkImage('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRNDgyaDCaoDZJx8N9BBE6eXm5uXuObd6FPeg&usqp=CAU'),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Text(
                      name.toString(),
                      style: TextStyle(color: whiteColor, fontSize: 15, letterSpacing: 1),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Text(
                      email.toString(),
                      style: TextStyle(color: whiteColor, fontSize: 12, letterSpacing: 1),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      body: Center(
        child: Column(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Invoke "debug painting" (press "p" in the console, choose the
          // "Toggle Debug Paint" action from the Flutter Inspector in Android
          // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
          // to see the wireframe for each widget.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            SizedBox(
              height: 20,
            ),
            resultImage(),
            SizedBox(
              height: 20,
            ),
            const Text(
              'Upload Skin Picture',
            ),
            GestureDetector(
              onTap: () {
                _showPicker(context, true);
              },
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Center(
                  child: Container(
                    //height: 40,
                    //width: 120,
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), border: Border.all(color: Colors.lightBlueAccent, width: 1)),
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: const Text(
                        'Upload Skin Picture',
                        style: TextStyle(color: Colors.lightBlueAccent),
                      ),
                    ),
                  ),
                ),
              ),
            ),

            SizedBox(
              height: devSize.height * 0.05,
            ),

            imageLogo.toString() == ''
                ? Container()
                : Container(
                    alignment: Alignment.center,
                    height: devSize.height * 0.3,
                    width: devSize.width * 0.5,
                    decoration: BoxDecoration(
                        //color: kLightBlueColor,
                        ),
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        Container(
                          height: devSize.height * 0.3,
                          width: devSize.width * 0.5,
                          padding: EdgeInsets.only(left: 0),
                          decoration: BoxDecoration(
                              // color: kLightBlueColor,
                              ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.file(
                              File(pickedFile!.path),
                              height: devSize.height * 0.3,
                              width: devSize.width * 0.5,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Positioned(
                          //right: 0,
                          //left: 50,,

                          child: Container(
                              height: devSize.height * 0.3,
                              // width: devSize.width*0.035,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      //auth.getPictureID(context);
                                    },
                                    child: MaterialButton(
                                      onPressed: () async {
                                        setState(() {
                                          imageLogo = "";
                                        });
                                        // FirebaseFirestore.instance.collection("users").doc(auth.currentUser!.uid).update({
                                        //   "photos": FieldValue.arrayRemove([
                                        //     _idCardImages[index]
                                        //   ])
                                        // }).then((value) {
                                        //   setState(() {
                                        //     _idCardImages.removeAt(index);
                                        //   });
                                        //
                                        //   Fluttertoast.showToast(
                                        //     msg: "Removed",
                                        //     toastLength: Toast.LENGTH_SHORT,
                                        //     fontSize: 18.0,
                                        //   );
                                        // });
                                        // print('hello'); // tahir@123
                                      },
                                      color: Colors.red,
                                      textColor: Colors.white,
                                      child: Icon(
                                        Icons.cancel,
                                        size: 20,
                                      ),
                                      minWidth: devSize.width * 0.035,
                                      padding: EdgeInsets.all(0),
                                      shape: CircleBorder(),
                                    ),
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      showDialog(
                                        context: context,
                                        builder: (ctx) => AlertDialog(
                                          title: const Text(
                                            "Error",
                                            style: TextStyle(color: Colors.red),
                                          ),
                                          content: Container(
                                            height: devSize.height * 0.2,
                                            child: Column(
                                              children: [
                                                const Text(
                                                  "Error on processing this image\n",
                                                  style: TextStyle(color: Colors.black),
                                                ),
                                                const Text(
                                                  "https://skindetectionerror/ftp/arxiv/papers",
                                                  style: TextStyle(
                                                    color: Colors.blue,
                                                    decoration: TextDecoration.underline,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          actions: <Widget>[
                                            TextButton(
                                              onPressed: () {
                                                Navigator.of(ctx).pop();
                                              },
                                              child: Container(
                                                padding: const EdgeInsets.all(14),
                                                child: const Text("Okay"),
                                              ),
                                            ),
                                          ],
                                        ),
                                      );
                                    },
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Center(
                                        child: InkWell(
                                          onTap: () async {
                                            await classifyImage();
                                          },
                                          child: Container(
                                            //height: 40,
                                            //width: 120,
                                            decoration: BoxDecoration(
                                                borderRadius: BorderRadius.circular(10), color: Colors.black, border: Border.all(color: Colors.lightBlueAccent, width: 1)),
                                            child: Padding(
                                              padding: const EdgeInsets.all(10.0),
                                              child: const Text(
                                                'Process Image',
                                                style: TextStyle(color: Colors.lightBlueAccent, fontSize: 10),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              )),
                        ),
                      ],
                    ),
                  ),

            SizedBox(
              height: 10,
            ),
            imageLogo.toString() == ''
                ? Container()
                :
            SizedBox(
              height: size.height * 0.06,
              width: size.width * 0.85,
              child: ElevatedButton(
                  onPressed: () async {

                    await FirebaseFirestore.instance.collection('Reports').doc().set({

                      'uid': _auth.currentUser!.uid.toString(),
                      'patientName': name.toString(),
                      'type': 'Skin Disease',
                      'date':  DateFormat.yMMMEd().format(DateTime.now()).toString() + ' ' + DateFormat.jm().format(DateTime.now()).toString(),
                      'patientEmail': email,
                      'image': image,
                      'score': confidence.toString(),
                      'case':type,


                    }).then((value) {
                      // setState(() {
                      //   isLoading = false;
                      // });


                      Navigator.pushReplacement(
                        context,
                        PageRouteBuilder(
                          pageBuilder: (c, a1, a2) =>
                              AppBottomNavBarScreen(index: 10, title: '', subTitle: '',),
                          transitionsBuilder: (c, anim, a2, child) => FadeTransition(opacity: anim, child: child),
                          transitionDuration: Duration(milliseconds: 100),
                        ),
                      );



                      print('name updated');
                    });

                  },
                  style: ElevatedButton.styleFrom(
                    primary: primaryColor,
                    shadowColor: Colors.transparent,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(6)),
                  ),
                  child: Text("Consult Doctor", style: subtitleWhite)),
            ),

            SizedBox(height: 10,),


          ],
        ),
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  resultImage() {
    return output == null
        ? Text(' ')
        : Padding(
            padding: const EdgeInsets.only(left: 25, right: 25),
            child: Container(
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.grey.shade200,
              ),
              child: RichText(
                  text:
                      TextSpan(text: prediction().toString(), style: TextStyle(fontWeight: FontWeight.bold, color: Theme.of(context).primaryColor, fontSize: 20), children: const [
                TextSpan(
                    text: "\n The results are not 100% correct, "
                        "please do not apply treatment without consulting your doctor!",
                    style: TextStyle(fontWeight: FontWeight.normal, color: Colors.black, fontSize: 13))
              ])),
            ),
          );
  }

  List? output;
  late String path;

  Future classifyImage() async {
    if (pickedFile != null) {
      output = null;
      await Tflite.loadModel(model: "assets/skin_quant_model.tflite", labels: "assets/labels.txt");
      var result = await Tflite.runModelOnImage(
        path: pickedFile!.path, // image path
        numResults: 4, // number of classes
        threshold: 0.5, // image threshold (defaults to 0.1)
        asynch: true,
      );

      setState(() {
        output = result;
      });
    }
  }

  prediction() {
    setState(() {
      type = output![0]["label"].toString().replaceAll("_", " ").toString();
      confidence = output![0]["confidence"].toString().substring(0, 3).replaceAll("_", " ").toString();
      print(type.toString());
      print(confidence.toString());
    });
    try {
      return "Disease: " + output![0]["label"].toString().replaceAll("_", " ") + " \nConfidence: " + output![0]["confidence"].toString().substring(0, 3).replaceAll("_", " ");
    } catch (e) {
      return "The disease could not be identified. Please try with another photo. ";
    }
  }
}
