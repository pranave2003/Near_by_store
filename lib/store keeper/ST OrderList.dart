import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'ST Profile.dart';
import 'StoreKeeperOrder.dart';

class StorekeepOrderList extends StatefulWidget {
  const StorekeepOrderList({super.key});

  @override
  State<StorekeepOrderList> createState() => _StorekeepOrderListState();
}

class _StorekeepOrderListState extends State<StorekeepOrderList> {
  bool isloading = true;
  Future<void> getData() async {
    SharedPreferences spref = await SharedPreferences.getInstance();
    setState(() {
      ID = spref.getString("id")!;

      spref.getString(
        "id",
      );

      print(ID.toString());
    });
    GEtDtata();
    print("Updated");
  }

  var ID = '';

  GEtDtata() async {
    store = await FirebaseFirestore.instance.collection('store').doc(ID).get();
    isloading = false;
    print(isloading);
    print("getfb");
  }

  DocumentSnapshot? store;
  void initState() {
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Text(
                    "Order view",
                    style: TextStyle(fontWeight: FontWeight.w600),
                  )
                ],
              ),
              InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => STprofile(),
                      ));
                },
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CircleAvatar(
                    radius: 15,
                    backgroundImage: AssetImage("assets/Ellipse 4.jpg"),
                  ),
                ),
              )
            ],
          )),
      body: ListView.builder(
        itemCount: 5,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.all(10.sp),
            child: InkWell(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(
                  builder: (context) {
                    return StoreKeeperOrder();
                  },
                ));
              },
              child: Container(
                height: 100.h,
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
                            radius: 30,
                            backgroundImage: AssetImage("assets/Ellipse 4.jpg"),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(20),
                          child: Column(
                            children: [
                              Text("Name"),
                              Text("Time"),
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
            ),
          );
        },
      ),
    );
  }
}
