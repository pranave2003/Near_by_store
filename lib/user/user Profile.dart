import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:near_by_store/user/user%20Edit%20Profile.dart';

class UserProfile extends StatefulWidget {
  const UserProfile({super.key});

  @override
  State<UserProfile> createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          // IconButton(
          //   onPressed: () {},
          //   icon: Icon(Icons.arrow_back),
          // ),
        ],
      )),
      body: Column(children: [
        Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: 40,
                  backgroundImage: AssetImage("assets/Ellipse 4.jpg"),
                ),
              ],
            ),
            IconButton(onPressed: () {}, icon: Icon(Icons.camera_alt)),
            Text("Hey,Adithyan !")
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
              Row(mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  IconButton(onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) {
                      return UserEditProfile();
                    },));

                  }, icon: Icon(Icons.edit)),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 80.w,
                      child: Text("Email id",style: TextStyle(fontWeight: FontWeight.w700)),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(":"),
                    ),
                    SizedBox(
                      width: 200.w,
                      child: Text("apijoij@gmail.com",style: TextStyle(fontWeight: FontWeight.w700)),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 80.w,
                      child: Text("Password",style: TextStyle(fontWeight: FontWeight.w700)),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(":"),
                    ),
                    SizedBox(
                      width: 200.w,
                      child: Text("12345678",style: TextStyle(fontWeight: FontWeight.w700)),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 80.w,
                      child: Text("Pincode",style: TextStyle(fontWeight: FontWeight.w700)),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(":"),
                    ),
                    SizedBox(
                      width: 200.w,
                      child: Text("673634",style: TextStyle(fontWeight: FontWeight.w700)),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 80.w,
                      child: Text("Address",style: TextStyle(fontWeight: FontWeight.w700)),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(":"),
                    ),
                    SizedBox(
                      width: 200.w,
                      child: Text("Vettam,padiyam,CHC,Vettam,Pin:673634",style: TextStyle(fontWeight: FontWeight.w700)),
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
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text("Terms & Condition"),
              )
            ]),
          ),
        )
      ]),
    );
  }
}
