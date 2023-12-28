import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:near_by_store/admin/admin%20home%20user%20List.dart';
import 'package:near_by_store/user/user.dart';

class UserCart extends StatefulWidget {
  const UserCart({super.key});

  @override
  State<UserCart> createState() => _UserCartState();
}

class _UserCartState extends State<UserCart> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          SafeArea(
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: IconButton(
                      onPressed: () {Navigator.of(context).pop();}, icon: Icon(Icons.arrow_back)),
                ),
                Text(
                  "    Cart",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                )
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 20.w),
            child: Row(
              children: [
                Text(
                  "3 Items in Cart",
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
                )
              ],
            ),
          ),
          Container(
            width: 350.w,
            height: 400.h,
            child: ListView.builder(
              itemCount: 3,
              itemBuilder: (context, index) {
                return Padding(
                  padding: EdgeInsets.all(10.sp),
                  child: InkWell(
                    onTap: () {},
                    child: Container(
                      height: 160.h,
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
                                        width: 100.w,
                                        height: 100.h,
                                        decoration: BoxDecoration(
                                            image: DecorationImage(
                                                image: AssetImage(
                                                    "assets/Apple.jpg"))),
                                      ),
                                    ],
                                  ),
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
                                              fontSize: 20,
                                              color: Colors.green)),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
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
                                        ],
                                      ),
                                      Text("(189)")
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
          Padding(
            padding: EdgeInsets.only(left: 20.w),
            child: Row(
              children: [
                Text(
                  "Price details",
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
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
                    height: 150.h,
                    width: 350.w,
                    color: Color(0xffCFE9E2),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: SizedBox(
                                width: 100.w,
                                child: Text("Price(3 items)",
                                    style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.w600)),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: SizedBox(
                                width: 100.w,
                                child: Text("Rs.759",
                                    style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.w600)),
                              ),
                            )
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: SizedBox(
                                width: 100.w,
                                child: Text("Discount",
                                    style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.w600)),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: SizedBox(
                                width: 100.w,
                                child: Text("Rs.19",
                                    style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.w600)),
                              ),
                            )
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: SizedBox(
                                width: 100.w,
                                child: Text("Total Amount",
                                    style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.w600)),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: SizedBox(
                                width: 100.w,
                                child: Text("Rs.740",
                                    style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.w600)),
                              ),
                            )
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: SizedBox(
                                width: 100.w,
                                child: Text("You will save",
                                    style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.w600)),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: SizedBox(
                                width: 100.w,
                                child: Text("Rs.19",
                                    style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.w600)),
                              ),
                            )
                          ],
                        )
                      ],
                    )),
              ],
            ),
          ),
          Row(mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                  width: 200.w,
                  height: 50.h,
                  decoration: BoxDecoration(
                    color: Color(0xff4D6877),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: TextButton(
                      onPressed: () {Navigator.push(context, MaterialPageRoute(builder: (context) {
                        return UserUser();
                      },));},
                      child: Text(
                        "SUBBMIT",
                        style: TextStyle(
                            fontWeight: FontWeight.w600, color: Colors.white),
                      ))),
            ],
          )
        ],
      ),
    );
  }
}
