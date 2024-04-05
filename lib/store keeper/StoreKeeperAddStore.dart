import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';

class StoreKeeperAddStore extends StatefulWidget {
  const StoreKeeperAddStore({super.key});

  @override
  State<StoreKeeperAddStore> createState() => _StoreKeeperAddStoreState();
}

class _StoreKeeperAddStoreState extends State<StoreKeeperAddStore> {
  var shopenaamectrl = TextEditingController();
  var addressctrl = TextEditingController();
  var pincodectrl = TextEditingController();
  var category = TextEditingController();

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

  Future<dynamic> sigh() async {
    await FirebaseFirestore.instance.collection('AddStore').add({
      "shopname": shopenaamectrl.text,
      "pincode": addressctrl.text,
      "password": pincodectrl.text,
      "path": imageURL,
      "catagory": category.text,
      "storeID": ID,
      "status": 0
    }).then((value) {
      print("Success");
      Navigator.of(context).pop();
      print("Signup success");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Add Store")),
      body: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SingleChildScrollView(
            child: Column(
              children: [
                Container(
                    height: 700.h,
                    width: 330.w,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Color(0xffD5F1E9)),
                    child: ListView(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(left: 10.w, top: 10.h),
                          child: const Row(
                            children: [
                              Text(
                                "Upload image",
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.w600),
                              )
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 1.h),
                          child: Padding(
                            padding: EdgeInsets.all(20.sp),
                            child: Container(
                                width: 250.w,
                                height: 100,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: Colors.white),
                                child: imageURL == null
                                    ? InkWell(
                                        onTap: () {
                                          pickimage();
                                        },
                                        child: Icon(Icons.upload),
                                      )
                                    : Text("data")),
                          ),
                        ),
                        Column(
                          children: [
                            Padding(
                              padding: EdgeInsets.only(left: 10.w, top: 10.h),
                              child: const Row(
                                children: [
                                  Text(
                                    "Shope name",
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w600),
                                  )
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                left: 10,
                                right: 10,
                              ),
                              child: TextFormField(
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return 'empty shopename';
                                    }
                                  },
                                  controller: shopenaamectrl,
                                  cursorColor: Colors.blue,
                                  style: TextStyle(),
                                  decoration: InputDecoration(
                                      fillColor: Colors.white,
                                      filled: true,
                                      hintText: "Enter Shopename",
                                      enabledBorder: OutlineInputBorder(),
                                      border: OutlineInputBorder(
                                          borderSide: BorderSide(),
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(10))))),
                            ),
                          ],
                        ),
                        //
                        Column(
                          children: [
                            Padding(
                              padding: EdgeInsets.only(left: 10.w, top: 10.h),
                              child: const Row(
                                children: [
                                  Text(
                                    "shope address",
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w600),
                                  )
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                left: 10,
                                right: 10,
                              ),
                              child: TextFormField(
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return 'empty shope address';
                                    }
                                  },
                                  controller: addressctrl,
                                  maxLines: 5,
                                  cursorColor: Colors.blue,
                                  style: TextStyle(),
                                  decoration: InputDecoration(
                                      fillColor: Colors.white,
                                      filled: true,
                                      hintText: "Enter address",
                                      enabledBorder: OutlineInputBorder(),
                                      border: OutlineInputBorder(
                                          borderSide: BorderSide(),
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(10))))),
                            ),
                          ],
                        ),
                        //
                        Column(
                          children: [
                            Padding(
                              padding: EdgeInsets.only(left: 10.w, top: 10.h),
                              child: const Row(
                                children: [
                                  Text(
                                    "Shope pincode",
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w600),
                                  )
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                left: 10,
                                right: 10,
                              ),
                              child: TextFormField(
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return 'empty pincode';
                                    }
                                  },
                                  controller: pincodectrl,
                                  cursorColor: Colors.blue,
                                  style: TextStyle(),
                                  decoration: InputDecoration(
                                      fillColor: Colors.white,
                                      filled: true,
                                      hintText: "Enter pincode",
                                      enabledBorder: OutlineInputBorder(),
                                      border: OutlineInputBorder(
                                          borderSide: BorderSide(),
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(10))))),
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            Padding(
                              padding: EdgeInsets.only(left: 10.w, top: 10.h),
                              child: const Row(
                                children: [
                                  Text(
                                    "Shope catagory",
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w600),
                                  )
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                left: 10,
                                right: 10,
                              ),
                              child: TextFormField(
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return 'empty shopename';
                                    }
                                  },
                                  controller: category,
                                  cursorColor: Colors.blue,
                                  style: TextStyle(),
                                  decoration: InputDecoration(
                                      fillColor: Colors.white,
                                      filled: true,
                                      hintText: "Eg;Fancy, Medical shope,",
                                      enabledBorder: OutlineInputBorder(),
                                      border: OutlineInputBorder(
                                          borderSide: BorderSide(),
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(10))))),
                            ),
                          ],
                        ),

                        //
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                width: 200.w,
                                height: 50.h,
                                child: TextButton(
                                    onPressed: () {
                                      sigh();
                                    },
                                    child: Text(
                                      "SUBMIT",
                                      style: TextStyle(color: Colors.white),
                                    )),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20.sp),
                                    color: Color(0xff4D6877)),
                              )
                            ],
                          ),
                        ),
                      ],
                    )),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
