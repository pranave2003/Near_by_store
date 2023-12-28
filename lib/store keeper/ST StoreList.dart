import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'StoreKeeperAddStore.dart';
import 'StoreKeeperProduct.dart';

class StStoreList extends StatefulWidget {
  const StStoreList({super.key});

  @override
  State<StStoreList> createState() => _StStoreListState();
}

class _StStoreListState extends State<StStoreList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SafeArea(
            child: Row(
              children: [
                IconButton(
                    onPressed: () {

                    },
                    icon: Icon(Icons.arrow_back)),
                Text(
                  "Added Store",
                  style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20),
                )
              ],
            ),
          ),
          Container(
            height: 650.h,
            child: ListView.builder(
              itemCount: 2,
              itemBuilder: (context, index) {
                return Padding(
                  padding: EdgeInsets.all(10.sp),
                  child: InkWell(
                    onTap: () {Navigator.push(context, MaterialPageRoute(builder: (context) {
                      return StoreKeeperProduct();
                    },));},
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
                                Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Container(
                                        width: 100.w,
                                        height: 100.h,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(15),
                                            image: DecorationImage(
                                                image: AssetImage(
                                                    "assets/house.jpg"),
                                                fit: BoxFit.fill)),
                                      ),
                                    ),
                                  ],
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(20),
                                  child: Column(
                                    children: [
                                      Text("Market",
                                          style: TextStyle(
                                              fontWeight: FontWeight.w600,
                                              fontSize: 20)),
                                      Text("Vegitables",
                                          style: TextStyle(
                                              fontWeight: FontWeight.w600,
                                              fontSize: 20)),
                                    ],
                                  ),
                                ),
                                IconButton(
                                    onPressed: () {},
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
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 300.w,
                height: 50.h,
                child: TextButton(
                    onPressed: () { Navigator.push(context, MaterialPageRoute(
                      builder: (context) {
                        return StoreKeeperAddStore();
                      },
                    ));},
                    child: Text(
                      "Add Store",
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
