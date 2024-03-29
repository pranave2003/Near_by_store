import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class adminUser extends StatefulWidget {
  const adminUser({super.key, required this.id});
  final id;
  @override
  State<adminUser> createState() => _adminUserState();
}

class _adminUserState extends State<adminUser> {
  DocumentSnapshot? user;
  //
  //
  //
  getDtata() async {
    user = await FirebaseFirestore.instance
        .collection('User')
        .doc(widget.id)
        .get();
  }

  //
  //
  //
  void accept(id) {
    setState(() {
      FirebaseFirestore.instance
          .collection('User')
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
          .collection('User')
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
          return const Center(child: CircularProgressIndicator());
        }
        if (snapshot.hasError) {
          return Text("Error${snapshot.error}");
        }
        return Scaffold(
          appBar: AppBar(
              title: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              // IconButton(
              //   onPressed: () {},
              //   icon: Icon(Icons.arrow_back),
              // ),
              IconButton(onPressed: () {}, icon: Icon(Icons.more_vert))
            ],
          )),
          body: Column(children: [
            user!['path'] == ''
                ? const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CircleAvatar(
                        radius: 40,
                        backgroundImage: AssetImage("assets/Ellipse 4.jpg"),
                      ),
                    ],
                  )
                : Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CircleAvatar(
                        radius: 40,
                        backgroundImage: NetworkImage(user!['path']),
                      ),
                    ],
                  ),
            Padding(
              padding: EdgeInsets.only(top: 40.h),
              child: Container(
                height: 630.h,
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
                          user!["username"],
                          style: TextStyle(
                              fontSize: 20.sp, fontWeight: FontWeight.w800),
                        )
                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        user!['location'],
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
                          "Pin : ${user!['pincode']}",
                          style: TextStyle(
                              fontSize: 15.sp, fontWeight: FontWeight.w500),
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
                          user!['phone'],
                          style: TextStyle(fontSize: 15.sp),
                        )
                      ],
                    ),
                  ),
                  user!['status'] == 0
                      ? Column(
                          children: [
                            Padding(
                              padding: EdgeInsets.only(top: 330.h),
                              child: Container(
                                height: 40.h,
                                width: 300.w,
                                decoration: BoxDecoration(
                                  border: Border.all(color: Colors.green),
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
                                    onPressed: () {
                                      rejects(widget.id);
                                    },
                                    child: Text(
                                      "Reject",
                                      style: TextStyle(color: Colors.red),
                                    )),
                              ),
                            )
                          ],
                        )
                      : user!['status'] == 1
                          ? Padding(
                              padding: EdgeInsets.only(top: 330.h),
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
                                      "Accepted",
                                      style: TextStyle(color: Colors.green),
                                    )),
                              ),
                            )
                          : Padding(
                              padding: EdgeInsets.only(top: 330.h),
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
                                      "Rejected",
                                      style: TextStyle(color: Colors.red),
                                    )),
                              ),
                            ),
                ]),
              ),
            )
          ]),
        );
      },
    );
  }
}
