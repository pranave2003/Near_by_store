import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'StoreKeeperOrder.dart';

class StorekeepOrderList extends StatefulWidget {
  const StorekeepOrderList({super.key});

  @override
  State<StorekeepOrderList> createState() => _StorekeepOrderListState();
}

class _StorekeepOrderListState extends State<StorekeepOrderList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              IconButton(onPressed: () {}, icon: Icon(Icons.arrow_back)),
              Text("Order view",style: TextStyle(fontWeight: FontWeight.w600),)
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: CircleAvatar(
              radius: 15,
              backgroundImage: AssetImage("assets/Ellipse 4.jpg"),
            ),
          ),


        ],
      )),
      body: ListView.builder(
        itemCount: 5,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.all(10.sp),
            child: InkWell(
              onTap: () {Navigator.push(context, MaterialPageRoute(builder: (context) {
                return StoreKeeperOrder();
              },));},
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
