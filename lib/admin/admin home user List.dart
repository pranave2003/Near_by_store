import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'admin user.dart';

class User extends StatefulWidget {
  const User({super.key});

  @override
  State<User> createState() => _UserState();
}

class _UserState extends State<User> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Row(children: [
      //   IconButton(onPressed: () {
      //
      // }, icon: Icon(Icons.arrow_back)),
        Text("User")
      ],)
      ),
      body: ListView.builder(
        itemCount: 5,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.all(10.sp),
            child: InkWell(onTap: () {
Navigator.push(context, MaterialPageRoute(builder: (context) {
  return adminUser();
},));
            },
              child: Container(
                height: 100.h,
                width: 100.w,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Color(0xffD5F1E9)),
                child: Row(
                  children: [
                    Column(children: [
                      Row(mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(20),
                            child: Column(
                              children: [
                                CircleAvatar(radius: 30,
                                  backgroundImage: AssetImage("assets/Ellipse 4.jpg"),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(20),
                            child: Column(
                              children: [
                                Text("Name"),
                                Text("Number"),

                              ],
                            ),
                          ),
                          IconButton(onPressed: () {

                          }, icon: Icon(Icons.delete_rounded))
                        ],
                      )

                    ]),
                  ],
                ),
              ),
            ),
          );
        },
      ),


    );
  }
}
