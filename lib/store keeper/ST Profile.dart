import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'StorekeeperEditProfile.dart';

class STprofile extends StatefulWidget {
  const STprofile({super.key});

  @override
  State<STprofile> createState() => _STprofileState();
}

class _STprofileState extends State<STprofile> {
  void initState() {
    getData();
  }

  var imageURL;
  XFile? _image;

  Future<void> pickimage() async {
    final ImagePicker _picker = ImagePicker();
    try {
      XFile? pickedimage = await _picker.pickImage(source: ImageSource.gallery);
      if (pickedimage != null) {
        setState(() {
          _image = pickedimage;
        });
        print("Image upload succersfully");
        await uploadimage();
      }
    } catch (e) {
      print("Error picking image:$e");
    }
  }

  Future<void> uploadimage() async {
    try {
      if (_image != null) {
        Reference storrageReference =
            FirebaseStorage.instance.ref().child('profile/${_image!.path}');
        await storrageReference.putFile(File(_image!.path));
        imageURL = await storrageReference.getDownloadURL();
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            content: Text(
          "Uploaded succesfully",
          style: TextStyle(color: Colors.green),
        )));

        FirebaseFirestore.instance
            .collection("store")
            .doc(ID)
            .update({"path": imageURL});
        print("/////////picked$imageURL");
      } else
        CircularProgressIndicator();
    } catch (e) {
      print("Error uploading image:$e");
    }
  }

  Future<void> getData() async {
    SharedPreferences spref = await SharedPreferences.getInstance();
    setState(() {
      ID = spref.getString("id")!;

      spref.getString(
        "id",
      );

      print(ID.toString());
    });
    print("Updated");
  }

  var ID = '';

  GEtDtata() async {
    store = await FirebaseFirestore.instance.collection('store').doc(ID).get();
  }

  DocumentSnapshot? store;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: GEtDtata(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }
        if (snapshot.hasError) {
          return Text("Error${snapshot.error}");
        }
        return Scaffold(
          appBar: AppBar(
              automaticallyImplyLeading: false,
              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      icon: Icon(Icons.arrow_back_ios)),
                  Text("Profile"),
                  IconButton(
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(
                          builder: (context) {
                            return StoreKeeperEditprofile();
                          },
                        ));
                      },
                      icon: Icon(Icons.edit))
                ],
              )),
          body: Column(children: [
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    store!['path'] == ''
                        ? CircleAvatar(
                            radius: 40,
                            backgroundImage: AssetImage("assets/Ellipse 4.jpg"),
                          )
                        : CircleAvatar(
                            radius: 40,
                            backgroundImage: NetworkImage(store!["path"]),
                          ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                        onPressed: () {
                          pickimage();
                        },
                        icon: Icon(Icons.camera_alt))
                  ],
                ),
                Text(
                  store!["shopname"],
                  style: TextStyle(fontWeight: FontWeight.bold),
                )
              ],
            ),
            Padding(
              padding: EdgeInsets.only(top: 40.h),
              child: Container(
                height: 400.h,
                width: 350.w,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Color(0xffD5F1E9)),
                child: Column(children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: 80.w,
                          child: Text("Email id",
                              style: TextStyle(fontWeight: FontWeight.w700)),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(":"),
                        ),
                        SizedBox(
                          width: 200.w,
                          child: Text(store!['mail'],
                              style: TextStyle(fontWeight: FontWeight.w700)),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: 80.w,
                          child: Text("Location",
                              style: TextStyle(fontWeight: FontWeight.w700)),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(":"),
                        ),
                        SizedBox(
                          width: 200.w,
                          child: Text(store!['location'],
                              style: TextStyle(fontWeight: FontWeight.w700)),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: 80.w,
                          child: Text("Phone num",
                              style: TextStyle(fontWeight: FontWeight.w700)),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(":"),
                        ),
                        SizedBox(
                          width: 200.w,
                          child: Text(store!['phone'],
                              style: TextStyle(fontWeight: FontWeight.w700)),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: 80.w,
                          child: Text("pincode",
                              style: TextStyle(fontWeight: FontWeight.w700)),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(":"),
                        ),
                        SizedBox(
                          width: 200.w,
                          child: Text(store!['mail'],
                              style: TextStyle(fontWeight: FontWeight.w700)),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 50.h),
                    child: Container(
                      height: 40.h,
                      width: 100.w,
                      decoration: BoxDecoration(
                        color: Color(0xff4D6877),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: TextButton(
                          onPressed: () {},
                          child: Text(
                            "Log out",
                            style: TextStyle(color: Colors.white),
                          )),
                    ),
                  ),
                ]),
              ),
            )
          ]),
        );
      },
    );
  }
}
