import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'admin Store.dart';

class Store extends StatefulWidget {
  const Store({super.key});

  @override
  State<Store> createState() => _StoreState();
}

class _StoreState extends State<Store> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Row(children: [
      //   IconButton(onPressed: () {
      //
      // }, icon: Icon(Icons.arrow_back))
        Text("Store")],)),
      body: ListView.builder(
        itemCount: 5,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.all(10.sp),
            child: InkWell(onTap: () {
Navigator.push(context, MaterialPageRoute(builder: (context) {
  return AdminStore();
},));
            },
              child: Container(
                height: 140.h,
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
                                Container(width: 100.w,height: 100.h,decoration: BoxDecoration(image: DecorationImage(image: AssetImage("assets/Rectangle 32.jpg"))),),

                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(20),
                            child: Column(
                              children: [
                                Text("Market",style: TextStyle(fontWeight: FontWeight.w600,fontSize: 20)),
                                Text("Vegetables",style: TextStyle(fontWeight: FontWeight.w600,fontSize: 20)),

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
