import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class UserRegister extends StatefulWidget {
  const UserRegister({super.key});

  @override
  State<UserRegister> createState() => _UserRegisterState();
}

class _UserRegisterState extends State<UserRegister> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(top: 50.h),
                child: SafeArea(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        height: 140.h,
                        width: 140.w,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage("assets/store 1.jpg"),
                                fit: BoxFit.fill)),
                      )
                    ],
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(
                      20,
                    ),
                    child: Text(
                      "LOGIN",
                      style:
                      TextStyle(fontWeight: FontWeight.w800, fontSize: 20),
                    ),
                  )
                ],
              ),
              Padding(
                padding: EdgeInsets.only(left: 50.w),
                child: Row(
                  children: [
                    Text(
                      "Name",
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
                              hintText: "  Enter name",
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
                      " Email id",
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
                              hintText: "   Enter password",
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
                      " Pincode",
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
                padding: EdgeInsets.only(left: 50.w,),
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        " Address",
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.w600),
                      ),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(),
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
                      decoration: BoxDecoration(border: Border.all(width: 2,color: Colors.grey),
                          borderRadius: BorderRadius.circular(20.sp),
                          color: Colors.white),
                    )
                  ],
                ),
              ),

              Padding(
                padding: EdgeInsets.only(top: 30.h),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 190.w,
                      height: 50.h,
                      child: TextButton(
                          onPressed: () {},
                          child: Text(
                            "REGISTER",
                            style: TextStyle(color: Colors.white),
                          )),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15.sp),
                          color: Color(0xff4D6877)),
                    )
                  ],
                ),
              ),


            ],
          ),
        ));
  }
}
