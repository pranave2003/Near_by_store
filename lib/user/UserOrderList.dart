import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class UserOrderList extends StatefulWidget {
  const UserOrderList({super.key});

  @override
  State<UserOrderList> createState() => _UserOrderListState();
}

class _UserOrderListState extends State<UserOrderList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: Text("Order list")),
      body: ListView.builder(
        itemCount: 3,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.all(10.sp),
            child: InkWell(
              onTap: () {},
              child: Container(
                height: 200.h,
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
                                Container(
                                  width: 110.w,
                                  height: 130.h,
                                  decoration: BoxDecoration(
                                      image: DecorationImage(
                                          image:
                                              AssetImage("assets/house.jpg"))),
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    RatingBar.builder(
                                        initialRating: 3,
                                        itemCount: 5,
                                        itemSize: 15,
                                        direction: Axis.horizontal,
                                        itemBuilder: (Context, _) => Icon(
                                            Icons.star,
                                            color: Colors.amber),
                                        onRatingUpdate: (rating) {}),
                                    Icon(Icons.edit),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(20),
                            child: Column(
                              children: [
                                SizedBox(width:100,
                                  child: Text("VMK",
                                      style: TextStyle(
                                          fontWeight: FontWeight.w600,
                                          fontSize: 20)),
                                ),
                                SizedBox(width:100,
                                  child: Text("Super market",
                                      style: TextStyle(
                                          fontWeight: FontWeight.w400,
                                          fontSize: 16)),
                                ),
                                SizedBox(width:100,
                                  child: Text("Date :17/12/2023",
                                      style: TextStyle(
                                          fontWeight: FontWeight.w500,
                                          fontSize: 12)),
                                ), SizedBox(width:100,
                                  child: Text("Total",
                                      style: TextStyle(
                                          fontWeight: FontWeight.w500,
                                          fontSize: 16)),
                                ),
                              ],
                            ),
                          ),
                          Column(
                            children: [
                              Container(
                                height: 25.h,
                                width: 70.w,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: Colors.white,
                                    border: Border.all()),
                                child: Center(
                                    child: Text("PAcking",
                                        style: TextStyle(
                                            color: Colors.green,
                                            fontWeight: FontWeight.w800))),
                              )
                            ],
                          ),
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
  }
}
