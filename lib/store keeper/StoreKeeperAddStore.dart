import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class StoreKeeperAddStore extends StatefulWidget {
  const StoreKeeperAddStore({super.key});

  @override
  State<StoreKeeperAddStore> createState() => _StoreKeeperAddStoreState();
}

class _StoreKeeperAddStoreState extends State<StoreKeeperAddStore> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Add Store")),
      body: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SingleChildScrollView(
            child: Column(
              children: [
                Container(
                    height: 700.h,
                    width: 330.w,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Color(0xffD5F1E9)),
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(top: 20.h),
                            child: Container(
                              width: 280.w,
                              height: 200,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Container(
                                          width: 50.w,
                                          height: 50.w,
                                          decoration: BoxDecoration(

                                              borderRadius: BorderRadius.circular(10),
                                              image: DecorationImage(
                                                  image:
                                                      AssetImage("assets/photo 1.jpg"),
                                                  fit: BoxFit.fill))),
                                    ],
                                  ),
                                ],
                              ),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.white),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 30.w,top: 20.h),
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
                            padding: EdgeInsets.only(left: 30.w,top: 20.h),
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
                                  height: 150.h,
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
                        //
                          Padding(
                            padding: EdgeInsets.only(left: 30.w,),
                            child: Row(
                              children: [
                                Text(
                                  "Pincode",
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
                                          hintText: "  Enter Pincode",
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
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  width: 200.w,
                                  height: 50.h,
                                  child: TextButton(
                                      onPressed: () { Navigator.push(context, MaterialPageRoute(
                                        builder: (context) {
                                          return StoreKeeperAddStore();
                                        },
                                      ));},
                                      child: Text(
                                        "SUBMIT",
                                        style: TextStyle(color: Colors.white),
                                      )),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20.sp),
                                      color: Color(0xff4D6877)),
                                )
                              ],
                            ),
                          ),

                        ],
                      ),
                    )),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
