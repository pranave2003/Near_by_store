import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'StoreKeeperAddProduct.dart';

class StoreKeeperProduct extends StatefulWidget {
  const StoreKeeperProduct({super.key});

  @override
  State<StoreKeeperProduct> createState() => _StoreKeeperProductState();
}

class _StoreKeeperProductState extends State<StoreKeeperProduct> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SafeArea(
            child: Row(
              children: [
                IconButton(onPressed: () {Navigator.of(context).pop();}, icon: Icon(Icons.arrow_back)),
                Text("Product List",style: TextStyle(fontWeight: FontWeight.w600,fontSize: 20),)
              ],
            ),
          ),
          Container(height: 650.h,
            child: ListView.builder(
              itemCount: 2,
              itemBuilder: (context, index) {
                return Padding(
                  padding: EdgeInsets.all(10.sp),
                  child: InkWell(
                    onTap: () {},
                    child: Container(
                      height: 130.h,
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
                                        decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),
                                            image: DecorationImage(
                                                image: AssetImage(
                                                    "assets/Apple.jpg"),fit: BoxFit.fill),),
                                      ),
                                    ),
                                  ],
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(20),
                                  child: Column(
                                    children: [
                                      Text("Apple",
                                          style: TextStyle(
                                              fontWeight: FontWeight.w600,
                                              fontSize: 20)),
                                      Text("1 kg",
                                          style: TextStyle(
                                              fontWeight: FontWeight.w600,
                                              fontSize: 20)),
                                      Text("Rs.109.00",
                                          style: TextStyle(
                                              fontWeight: FontWeight.w600,
                                              fontSize: 15,
                                              color: Colors.green)),


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
                    onPressed: () {Navigator.push(context, MaterialPageRoute(builder: (context) {
                      return ADDPRoduct();
                    },));},
                    child: Text(
                      "Add Product",
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
