import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';

class ADDPRoduct extends StatefulWidget {
  const ADDPRoduct({super.key, required this.id});
  final id;

  @override
  State<ADDPRoduct> createState() => _ADDPRoductState();
}

class _ADDPRoductState extends State<ADDPRoduct> {
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

  void addproduct() {
    FirebaseFirestore.instance.collection("Addproduct").add({
      'productname': pname.text,
      "product": dropdownproduct,
      "description": pdiscription.text,
      "quantity": quantity.text,
      "amount": pAmount.text,
      "path": imageURL,
      "kgOrgram":dropdownvalue,
      "p": 0,
      "productstoreid": widget.id
    });
    print('add product successfully');
    Navigator.of(context).pop();
  }

  var pname = TextEditingController();
  var pdiscription = TextEditingController();
  var quantity = TextEditingController();
  var pAmount = TextEditingController();

  File? Storeimage;
  var items = ["kg", "gram"];
  var product = ["Fruit", "vegitable", "grocery"];
  String dropdownproduct = 'Fruit';

  String dropdownvalue = 'kg';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Add Product")),
      body: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
              height: 760.h,
              width: 330.w,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Color(0xffD5F1E9)),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: 20.h),
                      child: Container(
                          width: 280.w,
                          height: 200,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.white),
                          child: Storeimage != null
                              ? Image.file(Storeimage!)
                              : InkWell(
                                  onTap: () async {
                                    final img = await ImagePicker()
                                        .pickImage(source: ImageSource.gallery);
                                    setState(() {
                                      Storeimage = File(img!.path);
                                      pickimage();
                                    });
                                  },
                                  child:
                                      Icon(Icons.add_photo_alternate_outlined),
                                )),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 30.w, top: 20.h),
                      child: Row(
                        children: [
                          Text(
                            "Name",
                            style: TextStyle(
                                fontSize: 15, fontWeight: FontWeight.w600),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            width: 290.w,
                            height: 50.h,
                            child: TextFormField(
                                controller: pname,
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'empty productname';
                                  }
                                },
                                cursorColor: Colors.blue,
                                style: TextStyle(),
                                decoration: InputDecoration(
                                    fillColor: Colors.white,
                                    filled: true,
                                    hintText: "Enter Productname",
                                    enabledBorder: OutlineInputBorder(),
                                    border: OutlineInputBorder(
                                        borderSide: BorderSide(),
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(10))))),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 30.w, top: 20.h),
                      child: Row(
                        children: [
                          Text(
                            "Product",
                            style: TextStyle(
                                fontSize: 15, fontWeight: FontWeight.w600),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 30.w),
                      child: Row(
                        children: [
                          DropdownButton(
                            value: dropdownproduct,
                            icon: const Icon(Icons.keyboard_arrow_down),
                            items: product.map((String items) {
                              return DropdownMenuItem(
                                value: items,
                                child: Text(items),
                              );
                            }).toList(),
                            onChanged: (String? newValue) {
                              dropdownproduct = newValue!;

                              setState(() {
                                print(dropdownproduct);
                              });
                            },
                          ),
                        ],
                      ),
                    ),
                    //
                    Padding(
                      padding: EdgeInsets.only(left: 30.w, top: 20.h),
                      child: Row(
                        children: [
                          Text(
                            "Description",
                            style: TextStyle(
                                fontSize: 15, fontWeight: FontWeight.w600),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            width: 290.w,
                            height: 100.h,
                            child: TextFormField(
                                controller: pdiscription,
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'empty description';
                                  }
                                },
                                cursorColor: Colors.blue,
                                style: TextStyle(),
                                maxLines: 5,
                                decoration: InputDecoration(
                                    fillColor: Colors.white,
                                    filled: true,
                                    hintText: "Enter Destriction",
                                    enabledBorder: OutlineInputBorder(),
                                    border: OutlineInputBorder(
                                        borderSide: BorderSide(),
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(10))))),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 30),
                      child: Row(
                        children: [
                          DropdownButton(
                            value: dropdownvalue,
                            icon: const Icon(Icons.keyboard_arrow_down),
                            items: items.map((String items) {
                              return DropdownMenuItem(
                                value: items,
                                child: Text(items),
                              );
                            }).toList(),
                            onChanged: (String? newValue) {
                              dropdownvalue = newValue!;
                              setState(() {
                                print(dropdownvalue);
                              });
                            },
                          ),
                        ],
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              width: 100.w,
                              height: 50.h,
                              child: TextFormField(
                                  controller: quantity,
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return 'empty ';
                                    }
                                  },
                                  cursorColor: Colors.blue,
                                  style: TextStyle(),
                                  decoration: InputDecoration(
                                      fillColor: Colors.white,
                                      filled: true,
                                      hintText: "Enter Quantity",
                                      enabledBorder: OutlineInputBorder(),
                                      border: OutlineInputBorder(
                                          borderSide: BorderSide(),
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(10))))),
                            )
                          ],
                        ),
                        Container(
                          width: 150.w,
                          height: 50.h,
                          child: TextFormField(
                              controller: pAmount,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'empty Email-address';
                                }
                              },
                              cursorColor: Colors.blue,
                              style: TextStyle(),
                              decoration: InputDecoration(
                                  fillColor: Colors.white,
                                  filled: true,
                                  hintText: "Enter Amount",
                                  enabledBorder: OutlineInputBorder(),
                                  border: OutlineInputBorder(
                                      borderSide: BorderSide(),
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(10))))),
                        )
                      ],
                    ),

                    //
                    //
                    //
                    //
                    //
                    //

                    //

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
                                  addproduct();
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
                ),
              )),
        ],
      ),
    );
  }
}
