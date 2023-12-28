import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class StoreKeeperOrder extends StatefulWidget {
  const StoreKeeperOrder({super.key});

  @override
  State<StoreKeeperOrder> createState() => _StoreKeeperOrderState();
}

class _StoreKeeperOrderState extends State<StoreKeeperOrder> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SafeArea(
            child: Padding(
              padding: EdgeInsets.only(left: 10.sp),
              child: Row(
                children: [
                  IconButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      icon: Icon(Icons.arrow_back)),
                  Text(
                    "Order view",
                    style: TextStyle(fontWeight: FontWeight.w600),
                  )
                ],
              ),
            ),
          ),
          Container(
            height: 70.h,
            width: 340.w,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Color(0xffD5F1E9)),
            child: Row(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: CircleAvatar(
                        radius: 20,
                        backgroundImage: AssetImage("assets/Ellipse 4.jpg"),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: Column(
                        children: [
                          Text("Akshay"),
                          Text("1 min ago"),
                        ],
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    IconButton(
                        onPressed: () {}, icon: Icon(Icons.currency_rupee)),
                    Text("550")
                  ],
                )
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.all(15.sp),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 300.w,
                  height: 50.h,
                  child: TextButton(
                      onPressed: () {
                        showDialog(
                            context: context,
                            builder: (Builder) {
                              return AlertDialog(
                                backgroundColor: Color(0xffD5F1E9),
                                title: Text(""),
                                content: Container(
                                    width: 50.w,
                                    height: 40.h,
                                    child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround,
                                        children: [
                                      Text(
                                        "Packing",
                                        style: TextStyle(color: Colors.green),
                                      ),
                                      IconButton(onPressed: () {

                                      }, icon: Icon(Icons.keyboard_arrow_down))
                                    ]),
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(30),
                                        border: Border.all())),
                                actions: [
                                  Center(
                                    child: ElevatedButton(
                                        style: ButtonStyle(
                                            backgroundColor:
                                                MaterialStateProperty.all(
                                                    Color(0xff668796))),
                                        onPressed: () {Navigator.of(context).pop();},
                                        child: Text(
                                          "SUBMIT",
                                          style: TextStyle(color: Colors.white),
                                        )),
                                  )
                                ],
                              );
                            });
                      },
                      child: Text(
                        "Add Status",
                        style: TextStyle(color: Colors.white),
                      )),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.sp),
                      color: Color(0xff4D6877)),
                )
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 20.sp),
            child: Row(
              children: [
                Text("Lists", style: TextStyle(fontWeight: FontWeight.w500)),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(15),
            child: Container(
              height: 450.h,
              width: 340.w,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Color(0xffD5F1E9)),
              child: Column(children: [
                Padding(
                  padding: EdgeInsets.all(20.sp),
                  child: Row(
                    children: [
                      SizedBox(
                          width: 100.w,
                          child: Text(
                            "Apple",
                            style: TextStyle(
                              fontWeight: FontWeight.w800,
                            ),
                          )),
                      SizedBox(width: 100.w, child: Text("1kg")),
                      SizedBox(
                        width: 100.w,
                        child: Row(children: [
                          Icon(Icons.currency_rupee_sharp, size: 18),
                          Text(
                            "109.00",
                            style: TextStyle(
                                color: Colors.green,
                                fontWeight: FontWeight.w800),
                          )
                        ]),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                          width: 100.w,
                          child: Text(
                            "Maggi",
                            style: TextStyle(
                              fontWeight: FontWeight.w800,
                            ),
                          )),
                      SizedBox(width: 100.w, child: Text("1kg")),
                      SizedBox(
                        width: 100.w,
                        child: Row(children: [
                          Icon(Icons.currency_rupee_sharp, size: 18),
                          Text(
                            "109.00",
                            style: TextStyle(
                                color: Colors.green,
                                fontWeight: FontWeight.w800),
                          )
                        ]),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                          width: 100.w,
                          child: Text(
                            "Orange",
                            style: TextStyle(
                              fontWeight: FontWeight.w800,
                            ),
                          )),
                      SizedBox(width: 100.w, child: Text("1kg")),
                      SizedBox(
                        width: 100.w,
                        child: Row(children: [
                          Icon(Icons.currency_rupee_sharp, size: 18),
                          Text(
                            "109.00",
                            style: TextStyle(
                                color: Colors.green,
                                fontWeight: FontWeight.w800),
                          )
                        ]),
                      )
                    ],
                  ),
                ),
              ]),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 300.w,
                height: 50.h,
                child: TextButton(
                    onPressed: () {},
                    child: Text(
                      "Done",
                      style: TextStyle(color: Colors.white),
                    )),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.sp),
                    color: Color(0xff4D6877)),
              )
            ],
          ),
        ],
      ),
    );
  }
}
