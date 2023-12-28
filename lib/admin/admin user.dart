import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class adminUser extends StatefulWidget {
  const adminUser({super.key});

  @override
  State<adminUser> createState() => _adminUserState();
}

class _adminUserState extends State<adminUser> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          // IconButton(
          //   onPressed: () {},
          //   icon: Icon(Icons.arrow_back),
          // ),
          IconButton(onPressed: () {}, icon: Icon(Icons.more_vert))
        ],
      )),
      body: Column(children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 40,
              backgroundImage: AssetImage("assets/Ellipse 4.jpg"),
            ),
          ],
        ),
        Padding(
          padding: EdgeInsets.only(top: 40.h),
          child: Container(
            height: 630.h,
            width: 390.w,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
                color: Color(0xffD5F1E9)),
            child: Column(children: [
              Padding(
                padding: const EdgeInsets.all(20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Name",
                      style: TextStyle(
                          fontSize: 20.sp, fontWeight: FontWeight.w800),
                    )
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Malappuram,tirur,vettom",
                    style: TextStyle(fontSize: 15.sp),
                  )
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Pin : 676102",
                      style: TextStyle(fontSize: 15.sp),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "9123456421",
                      style: TextStyle(fontSize: 15.sp),
                    )
                  ],
                ),
              ),
              Padding(
                padding:  EdgeInsets.only(top: 330.h),
                child: Container(
                  height: 40.h,
                  width: 300.w,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.green),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: TextButton(
                      onPressed: () {},
                      child: Text(
                        "Accept",
                        style: TextStyle(color: Colors.green),
                      )),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: 40.h,
                  width: 300.w,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.red),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: TextButton(
                      onPressed: () {},
                      child: Text(
                        "Reject",
                        style: TextStyle(color: Colors.red),
                      )),
                ),
              )
            ]),
          ),
        )
      ]),
    );
  }
}
