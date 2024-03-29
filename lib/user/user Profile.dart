import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:near_by_store/user/user%20Edit%20Profile.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'UserLogin.dart';

class UserProfile extends StatefulWidget {
  const UserProfile({super.key});

  @override
  State<UserProfile> createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
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
            .collection("User")
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
    user = await FirebaseFirestore.instance.collection('User').doc(ID).get();
  }

  DocumentSnapshot? user;
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
              title: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [],
          )),
          body: Column(children: [
            Column(
              children: [
                user!['path'] == ''
                    ? Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CircleAvatar(
                            radius: 40,
                            backgroundImage: AssetImage("assets/Ellipse 4.jpg"),
                          ),
                        ],
                      )
                    : Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CircleAvatar(
                            radius: 40,
                            backgroundImage: NetworkImage(user!['path']),
                          ),
                        ],
                      ),
                IconButton(
                    onPressed: () {
                      pickimage();
                    },
                    icon: Icon(Icons.camera_alt)),
                Text(
                  "Hey,${user!['username']}!",
                  style: TextStyle(fontWeight: FontWeight.w500),
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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      IconButton(
                          onPressed: () {
                            Navigator.push(context, MaterialPageRoute(
                              builder: (context) {
                                return UserEditProfile();
                              },
                            ));
                          },
                          icon: Icon(Icons.edit)),
                    ],
                  ),
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
                          child: Text(user!['mail'],
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
                          child: Text("Phone ",
                              style: TextStyle(fontWeight: FontWeight.w700)),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(":"),
                        ),
                        SizedBox(
                          width: 200.w,
                          child: Text(user!['phone'],
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
                          child: Text("Pincode",
                              style: TextStyle(fontWeight: FontWeight.w700)),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(":"),
                        ),
                        SizedBox(
                          width: 200.w,
                          child: Text(user!['pincode'],
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
                          child: Text(user!['location'],
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
                          onPressed: () {
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => UserLogin(),
                                ));
                          },
                          child: Text(
                            "Log out",
                            style: TextStyle(color: Colors.white),
                          )),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text("Terms & Condition"),
                  )
                ]),
              ),
            )
          ]),
        );
      },
    );
  }
}
