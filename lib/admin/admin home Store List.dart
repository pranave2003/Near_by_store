import 'package:cloud_firestore/cloud_firestore.dart';
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
    return FutureBuilder(
      future: FirebaseFirestore.instance.collection("store").get(),
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
        final _store = snapshot.data?.docs ?? [];
        return Scaffold(
          appBar: AppBar(
              automaticallyImplyLeading: false,
              title: const Row(
                children: [
                  //   IconButton(onPressed: () {
                  //
                  // }, icon: Icon(Icons.arrow_back))
                  Text(
                    "Store",
                    style: TextStyle(fontWeight: FontWeight.w500),
                  )
                ],
              )),
          body: ListView.builder(
            itemCount: _store.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: EdgeInsets.all(10.sp),
                child: InkWell(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(
                      builder: (context) {
                        return AdminStore(id:_store[index].id);
                      },
                    ));
                  },
                  child: Container(
                    height: 140.h,
                    width: 150.w,
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
                                    _store[index]['path'] == ''
                                        ? Container(
                                            width: 100.w,
                                            height: 100.h,
                                            decoration: const BoxDecoration(
                                                image: DecorationImage(
                                                    image: AssetImage(
                                                        "assets/Rectangle 32.jpg"))),
                                          )
                                        : CircleAvatar(
                                            radius: 30,
                                            backgroundImage: NetworkImage(
                                                _store[index]['path']),
                                          )
                                  ],
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.all(20),
                                child: Column(
                                  children: [
                                    Text(_store[index]['shopname'],
                                        style: TextStyle(
                                            fontWeight: FontWeight.w600,
                                            fontSize: 20)),
                                    Text("Vegetables",
                                        style: TextStyle(
                                            fontWeight: FontWeight.w600,
                                            fontSize: 20)),
                                  ],
                                ),
                              ),
                              IconButton(
                                  onPressed: () {
                                    setState(() {
                                      FirebaseFirestore.instance
                                          .collection('store')
                                          .doc(_store[index].id)
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
