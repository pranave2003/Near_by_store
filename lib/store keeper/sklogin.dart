import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'StoreKeeperOrderView.dart';
import 'StoreRegister.dart';

class Sklogin extends StatefulWidget {
  const Sklogin({super.key});

  @override
  State<Sklogin> createState() => _SkloginState();
}

class _SkloginState extends State<Sklogin> {
  bool isloading = true;
  var username = TextEditingController();
  var password = TextEditingController();
  final formkey = GlobalKey<FormState>();
  String id = '';

  void userLogin() async {
    final user = await FirebaseFirestore.instance
        .collection('store')
        .where('mail', isEqualTo: username.text)
        .where('password', isEqualTo: password.text)
        .where('status', isEqualTo: 1)
        .get();

    if (user.docs.isNotEmpty) {
      id = user.docs[0].id;

      SharedPreferences data = await SharedPreferences.getInstance();

      data.setString('id', id);
      print("shared preference id got");

      setState(() {
        isloading = false;
      });
      print("Sighn up sucess");
      Navigator.push(context, MaterialPageRoute(
        builder: (context) {
          return StorekeeeperOrderView();
        },
      ));
    } else {
      setState(() {
        isloading = false;
      });

      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          elevation: BorderSide.strokeAlignOutside,
          content: Text(
            "username and password error",
            style: TextStyle(color: Colors.red),
          )));
    }
  }

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
                      " SHOPE KEEPER LOGIN",
                      style:
                          TextStyle(fontWeight: FontWeight.w800, fontSize: 20),
                    ),
                  )
                ],
              ),
              Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 40.w),
                    child: const Row(
                      children: [
                        Text(
                          "Email id",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w600),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 40,
                      right: 40,
                    ),
                    child: TextFormField(
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'empty Email-address';
                          }
                        },
                        controller: username,
                        cursorColor: Colors.blue,
                        style: TextStyle(),
                        decoration: InputDecoration(
                            fillColor: Colors.white,
                            filled: true,
                            hintText: "Enter email id",
                            enabledBorder: OutlineInputBorder(),
                            border: OutlineInputBorder(
                                borderSide: BorderSide(),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10))))
                    ),
                  ),
                ],
              ),
              Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 40.w, top: 10.h),
                    child: const Row(
                      children: [
                        Text(
                          "Password",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w600),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 40,
                      right: 40,
                    ),
                    child: TextFormField(
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'empty Password';
                          }
                        },
                        controller: password,
                        cursorColor: Colors.blue,
                        style: TextStyle(),
                        decoration: InputDecoration(
                            fillColor: Colors.white,
                            filled: true,
                            hintText: "Enter password",
                            enabledBorder: OutlineInputBorder(),
                            border: OutlineInputBorder(
                                borderSide: BorderSide(),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10))))),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.only(top: 90.h),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 190.w,
                      height: 50.h,
                      child: TextButton(
                          onPressed: () {
                            userLogin();
                          },
                          child: Text(
                            "LOGIN",
                            style: TextStyle(color: Colors.white),
                          )),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15.sp),
                          color: Color(0xff4D6877)),
                    )
                  ],
                ),
              ),
              TextButton(
                  onPressed: () {
                    Navigator.pushReplacement(context, MaterialPageRoute(
                      builder: (context) {
                        return StoreRegister();
                      },
                    ));
                  },
                  child: Text(
                    "Sing up",
                    style: TextStyle(color: Colors.black87),
                  ))
            ],
          ),
        ));
  }
}
