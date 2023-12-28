import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class StoreKeeperEditprofile extends StatefulWidget {
  const StoreKeeperEditprofile({super.key});

  @override
  State<StoreKeeperEditprofile> createState() => _StoreKeeperEditprofileState();
}

class _StoreKeeperEditprofileState extends State<StoreKeeperEditprofile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // IconButton(
              //   onPressed: () {},
              //   icon: Icon(Icons.arrow_back),
              //
              // ),
              Text("Profile"),
              IconButton(onPressed: () {

              }, icon: Icon(Icons.edit))
            ],
          )),
      body: SingleChildScrollView(
        child: Column(children: [
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

            ],
          ),
          Padding(
            padding: EdgeInsets.only(top: 40.h),
            child: Container(
              height: 500.h,
              width: 350.w,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Color(0xffD5F1E9)),
              child: SingleChildScrollView(
                child: Column(children: [
                  Padding(
                    padding: EdgeInsets.only(left: 50.w,top: 50.h),
                    child: Row(
                      children: [
                        Text(
                          "Email id",
                          style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
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
                                  hintText: "  Enter emaild id",
                                  hintStyle: TextStyle(color: Colors.grey))),
                          decoration: BoxDecoration(border: Border.all(color: Colors.grey,width: 2),
                              borderRadius: BorderRadius.circular(20.sp),
                              color: Colors.white),
                        )
                      ],
                    ),
                  ),
                  //
                  Padding(
                    padding: EdgeInsets.only(left: 50.w),
                    child: Row(
                      children: [
                        Text(
                          "Password",
                          style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
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
                                  hintText: "  Enter password",
                                  hintStyle: TextStyle(color: Colors.grey))),
                          decoration: BoxDecoration(border: Border.all(color: Colors.grey,width: 2),
                              borderRadius: BorderRadius.circular(20.sp),
                              color: Colors.white),
                        )
                      ],
                    ),
                  ),
                  //
                  Padding(
                    padding: EdgeInsets.only(left: 50.w),
                    child: Row(
                      children: [
                        Text(
                          "Pin code",
                          style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
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
                                  hintText: "  Enter pincode",
                                  hintStyle: TextStyle(color: Colors.grey))),
                          decoration: BoxDecoration(border: Border.all(color: Colors.grey,width: 2),
                              borderRadius: BorderRadius.circular(20.sp),
                              color: Colors.white),
                        )
                      ],
                    ),
                  ),
                  //
                  Padding(
                    padding: EdgeInsets.only(left: 50.w),
                    child: Row(
                      children: [
                        Text(
                          "Address",
                          style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
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
                                  hintText: "  Enter address",
                                  hintStyle: TextStyle(color: Colors.grey))),
                          decoration: BoxDecoration(border: Border.all(color: Colors.grey,width: 2),
                              borderRadius: BorderRadius.circular(20.sp),
                              color: Colors.white),
                        )
                      ],
                    ),
                  ),

                ]),
              ),
            ),
          )
        ]),
      ),
    );
  }
}
