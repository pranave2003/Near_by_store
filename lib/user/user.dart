import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'UserHome.dart';

class UserUser extends StatefulWidget {
  const UserUser({super.key});

  @override
  State<UserUser> createState() => _UserUserState();
}

class _UserUserState extends State<UserUser> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 130.w,
              height: 150.h,
              decoration: BoxDecoration(

                  image: DecorationImage(
                      image: AssetImage("assets/tick.jpg"), fit: BoxFit.fill)),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Order Verified",
              style: TextStyle(
                  color: Colors.green,
                  fontWeight: FontWeight.w800,
                  fontSize: 20),
            )
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Come to pick orders",
              style: TextStyle(
                  color: Colors.black87,
                  fontWeight: FontWeight.w800,
                  fontSize: 18),
            )
          ],
        ),
        Padding(
          padding: EdgeInsets.only(top: 50.h),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 50.h,
                width: 250.w,
                child: TextButton(
                    onPressed: () {Navigator.push(context, MaterialPageRoute(builder: (context) {
                      return UserHome();
                    },));},
                    child: Text(
                      "Continue shoping",
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.w800),
                    )),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: Color(0xff4D6877)),
              )
            ],
          ),
        )
      ]),
    );
  }
}
