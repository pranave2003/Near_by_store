import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';

class ADDPRoduct extends StatefulWidget {
  const ADDPRoduct({super.key});

  @override
  State<ADDPRoduct> createState() => _ADDPRoductState();
}

class _ADDPRoductState extends State<ADDPRoduct> {
  File? Storeimage;
  var items=["kg","gram"];
  var product=["Fruit","vegitable","grocery"];
  String dropdownproduct='Fruit';

  String dropdownvalue='kg';
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
                                  .pickImage(
                                  source: ImageSource.gallery);
                              setState(() {
                                Storeimage = File(img!.path);
                              });
                            },
                            child: Icon(
                                Icons.add_photo_alternate_outlined),
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
                                decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintText: "  Enter name",
                                    hintStyle: TextStyle(color: Colors.grey))),
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.grey, width: 2),
                                borderRadius: BorderRadius.circular(20.sp),
                                color: Colors.white),
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
                      padding:  EdgeInsets.only(left: 30.w),
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
                              setState(() {
                                dropdownproduct = newValue!;
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
                                decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintText: "  Enter Description",
                                    hintStyle: TextStyle(color: Colors.grey))),
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.grey, width: 2),
                                borderRadius: BorderRadius.circular(20.sp),
                                color: Colors.white),
                          )
                        ],
                      ),
                    ),
                   
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Column(
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
                                  setState(() {
                                    dropdownvalue = newValue!;
                                  });
                                },
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    width: 100.w,
                                    height: 50.h,
                                    child:  Row(mainAxisAlignment: MainAxisAlignment.end,children: [IconButton(onPressed: () {

                                    }, icon: Icon(Icons.keyboard_arrow_down))]),
                                    decoration: BoxDecoration(
                                        border: Border.all(color: Colors.grey, width: 2),
                                        borderRadius: BorderRadius.circular(20.sp),
                                        color: Colors.white),
                                  )
                                ],
                              ),

                            ],
                          ),
                        //
                          Column(
                            children: [
                              Text("Price"),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    width: 100.w,
                                    height: 50.h,
                                    child:  Row(mainAxisAlignment: MainAxisAlignment.end,children: [IconButton(onPressed: () {

                                    }, icon: Icon(Icons.keyboard_arrow_down))]),
                                    decoration: BoxDecoration(
                                        border: Border.all(color: Colors.grey, width: 2),
                                        borderRadius: BorderRadius.circular(20.sp),
                                        color: Colors.white),
                                  )
                                ],
                              ),

                            ],
                          ),
                        ],
                      ),
                    ),

                    //
                    Padding(
                      padding: EdgeInsets.only(
                        left: 30.w,
                      ),
                      child: Row(
                        children: [
                          Text(
                            "Quantity",
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
                           child:  Row(mainAxisAlignment: MainAxisAlignment.end,children: [IconButton(onPressed: () {

                           }, icon: Icon(Icons.keyboard_arrow_down))]),
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.grey, width: 2),
                                borderRadius: BorderRadius.circular(20.sp),
                                color: Colors.white),
                          )
                        ],
                      ),
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
