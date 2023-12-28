import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ADDPRoduct extends StatefulWidget {
  const ADDPRoduct({super.key});

  @override
  State<ADDPRoduct> createState() => _ADDPRoductState();
}

class _ADDPRoductState extends State<ADDPRoduct> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Add Store")),
      body: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
              height: 730.h,
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
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                    width: 50.w,
                                    height: 50.w,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        image: DecorationImage(
                                            image:
                                                AssetImage("assets/photo 1.jpg"),
                                            fit: BoxFit.fill))),
                              ],
                            ),
                          ],
                        ),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.white),
                      ),
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
                              Text("KG"),
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
