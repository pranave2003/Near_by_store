import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:near_by_store/store%20keeper/sklogin.dart';

class StoreRegister extends StatefulWidget {
  const StoreRegister({super.key});

  @override
  State<StoreRegister> createState() => _StoreRegisterState();
}

class _StoreRegisterState extends State<StoreRegister> {
  final formkey = GlobalKey<FormState>();
  var namectrl = TextEditingController();
  var emailctrl = TextEditingController();
  var passctrl = TextEditingController();
  var pinctrl = TextEditingController();
  var addressctrl = TextEditingController();
  var phonectrl = TextEditingController();

  Future<dynamic> sigh() async {
    await FirebaseFirestore.instance.collection('store').add({
      "shopname": namectrl.text,
      "pincode": pinctrl.text,
      "mail": emailctrl.text,
      "location": addressctrl.text,
      "password": passctrl.text,
      "phone": phonectrl.text,
      "path": '',
      "status": 0
    }).then((value) {
      print("Success");
      Navigator.push(context, MaterialPageRoute(
        builder: (context) {
          return Sklogin();
        },
      ));
      print("Signup success");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formkey,
      child: Scaffold(
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
                const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: EdgeInsets.all(
                        20,
                      ),
                      child: Text(
                        " Store Keeper Sign Up",
                        style: TextStyle(
                            fontWeight: FontWeight.w800, fontSize: 20),
                      ),
                    )
                  ],
                ),
                // name
                Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 40.w),
                      child: const Row(
                        children: [
                          Text(
                            "Name",
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
                              return 'empty username';
                            }
                          },
                          controller: namectrl,
                          cursorColor: Colors.blue,
                          style: TextStyle(),
                          decoration: InputDecoration(
                              fillColor: Colors.white,
                              filled: true,
                              hintText: "Enter name",
                              enabledBorder: OutlineInputBorder(),
                              border: OutlineInputBorder(
                                  borderSide: BorderSide(),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10))))),
                    ),
                  ],
                ),

                //Email

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
                          controller: emailctrl,
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
                                      BorderRadius.all(Radius.circular(10))))),
                    ),
                  ],
                ),
                //password--------------------------------------

                Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 40.w),
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
                              return 'empty password';
                            }
                          },
                          controller: passctrl,
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
                //
                Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 40.w),
                      child: const Row(
                        children: [
                          Text(
                            "Pin code",
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
                              return 'empty Pincode';
                            }
                          },
                          controller: pinctrl,
                          cursorColor: Colors.blue,
                          style: TextStyle(),
                          decoration: InputDecoration(
                              fillColor: Colors.white,
                              filled: true,
                              hintText: "Enter pincode",
                              enabledBorder: OutlineInputBorder(),
                              border: OutlineInputBorder(
                                  borderSide: BorderSide(),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10))))),
                    ),
                  ],
                ),
                //location
                Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 40.w),
                      child: const Row(
                        children: [
                          Text(
                            "Location",
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
                              return 'empty Location';
                            }
                          },
                          controller: addressctrl,
                          cursorColor: Colors.blue,
                          style: TextStyle(),
                          decoration: InputDecoration(
                              fillColor: Colors.white,
                              filled: true,
                              hintText: "Enter Location",
                              enabledBorder: OutlineInputBorder(),
                              border: OutlineInputBorder(
                                  borderSide: BorderSide(),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10))))),
                    ),
                  ],
                ),
                // phonwe
                Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 40.w),
                      child: const Row(
                        children: [
                          Text(
                            "Phone number",
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
                          keyboardType: TextInputType.number,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'empty phone number';
                            }
                          },
                          controller: phonectrl,
                          cursorColor: Colors.blue,
                          style: TextStyle(),
                          decoration: InputDecoration(
                              fillColor: Colors.white,
                              filled: true,
                              hintText: "Enter phone number",
                              enabledBorder: OutlineInputBorder(),
                              border: OutlineInputBorder(
                                  borderSide: BorderSide(),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10))))),
                    ),
                  ],
                ),

                Padding(
                  padding: EdgeInsets.only(top: 30.h),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: 190.w,
                        height: 50.h,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15.sp),
                            color: Color(0xff4D6877)),
                        child: TextButton(
                            onPressed: () {
                              if (formkey.currentState!.validate()) {
                                sigh();
                              }
                            },
                            child: const Text(
                              "REGISTER",
                              style: TextStyle(color: Colors.white),
                            )),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          TextButton(
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => Sklogin(),
                                    ));
                              },
                              child: const Text(
                                "Login ",
                                style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    color: Colors.black),
                              )),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          )),
    );
  }
}
