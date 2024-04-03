import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AdminStore extends StatefulWidget {
  const AdminStore({super.key, required this.id});
  final id;

  @override
  State<AdminStore> createState() => _AdminStoreState();
}

class _AdminStoreState extends State<AdminStore> {
  DocumentSnapshot? store;
  //
  //
  //
  getDtata() async {
    store = await FirebaseFirestore.instance
        .collection('store')
        .doc(widget.id)
        .get();
  }

  //
  //
  //
  void accept(id) {
    setState(() {
      FirebaseFirestore.instance
          .collection('store')
          .doc(id)
          .update({'status': 1});
      //
      //
      //
      //
    });
  }

  void rejects(id) {
    setState(() {
      FirebaseFirestore.instance
          .collection('store')
          .doc(id)
          .update({'status': 2});
    });
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: getDtata(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        if (snapshot.hasError) {
          return Center(
            child: Text("Error:${snapshot.error}"),
          );
        }
        return Scaffold(
          appBar: AppBar(
              title: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              IconButton(onPressed: () {}, icon: Icon(Icons.delete_rounded))
            ],
          )),
          body: Column(children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                store!["path"] == ''
                    ? Container(
                        width: 100.w,
                        height: 100.h,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            image: DecorationImage(
                                image: AssetImage("assets/Rectangle 32.jpg"),
                                fit: BoxFit.fill)),
                      )
                    : Container(
                        width: 100.w,
                        height: 100.h,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(60),
                            image: DecorationImage(
                                image: NetworkImage(store!['path']),
                                fit: BoxFit.fill)),
                      )
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
                          store!['shopname'],
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
                        store!['location'],
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
                          store!['pincode'],
                          style: TextStyle(fontSize: 15.sp),
                        )
                      ],
                    ),
                  ),
                  Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(top: 300.h, bottom: 10.h),
                        child: Container(
                          height: 40.h,
                          width: 300.w,
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.green,width: 2),
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: TextButton(
                              onPressed: () {
                                accept(widget.id);
                              },
                              child: Text(
                                "Accept",
                                style: TextStyle(color: Colors.green),
                              )),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      height: 40.h,
                      width: 300.w,
                      decoration: BoxDecoration(

                        border: Border.all(color: Colors.red,width: 2),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: TextButton(
                          onPressed: () {
                            rejects(widget.id);
                          },
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
      },
    );
  }
}
