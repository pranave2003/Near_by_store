import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'admin user.dart';

class User extends StatefulWidget {
  const User({super.key});

  @override
  State<User> createState() => _UserState();
}

class _UserState extends State<User> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: FirebaseFirestore.instance.collection("User").get(),
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
        final user = snapshot.data?.docs ?? [];
        return Scaffold(
          appBar: AppBar(
              automaticallyImplyLeading: false,
              title: const Row(
                children: [
                  //   IconButton(onPressed: () {
                  //
                  // }, icon: Icon(Icons.arrow_back)),
                  Text(
                    "User",
                    style: TextStyle(fontWeight: FontWeight.w500),
                  )
                ],
              )),
          body: ListView.builder(
            itemCount: user.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: EdgeInsets.all(10.sp),
                child: InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => adminUser(id:user[index].id),
                        ));
                  },
                  child: Container(
                    height: 120.h,
                    width: 100.w,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Color(0xffD5F1E9)),
                    child: Row(
                      children: [
                        Column(children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(20),
                                child: Column(
                                  children: [
                                    user[index]['path'] == ""
                                        ? const CircleAvatar(
                                            radius: 30,
                                            backgroundImage: AssetImage(
                                                "assets/Ellipse 4.jpg"),
                                          )
                                        : CircleAvatar(
                                            radius: 30,
                                            backgroundImage: NetworkImage(
                                                user[index]['path']),
                                          )
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(20),
                                child: Column(
                                  children: [
                                    Text(user[index]['username']),
                                    Text(user[index]['phone']),
                                  ],
                                ),
                              ),
                              IconButton(
                                  onPressed: () {
                                    setState(() {
                                      FirebaseFirestore.instance
                                          .collection('User')
                                          .doc(user[index].id)
                                          .delete();
                                    });
                                  },
                                  icon: Icon(Icons.delete_rounded))
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
      },
    );
  }
}
