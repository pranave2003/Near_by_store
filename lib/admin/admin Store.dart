import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AdminStore extends StatefulWidget {
  const AdminStore({super.key});

  @override
  State<AdminStore> createState() => _AdminStoreState();
}

class _AdminStoreState extends State<AdminStore> {
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
              IconButton(onPressed: () {}, icon: Icon(Icons.delete_rounded))
            ],
          )),
      body: Column(children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(width: 100.w,height: 100.h,decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),image: DecorationImage(image: AssetImage("assets/Rectangle 32.jpg"),fit: BoxFit.fill)),)

          ],
        ),
        Padding(
          padding: EdgeInsets.only(top: 40.h),
          child: Container(
            height: 605.h,
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
                      "Market",
                      style: TextStyle(
                          fontSize: 20.sp, fontWeight: FontWeight.w600),
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
                      "Vegetables",
                      style: TextStyle(fontSize: 15.sp),
                    )
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "vettam,padium,CHC",
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
                      " 676102",
                      style: TextStyle(fontSize: 15.sp),
                    )
                  ],
                ),
              ),

              Padding(
                padding:  EdgeInsets.only(top: 300.h,bottom: 10.h),
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
