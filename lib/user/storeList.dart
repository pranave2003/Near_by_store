import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:near_by_store/user/user%20Profile.dart';
import 'package:near_by_store/user/user_Store_details.dart';

import 'UserOrderList.dart';

class StoreList extends StatefulWidget {
  const StoreList({super.key});

  @override
  State<StoreList> createState() => _StoreListState();
}

class _StoreListState extends State<StoreList> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: FirebaseFirestore.instance.collection("AddStore").get(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          if (snapshot.hasError) {
            return Center(
              child: Text("Error:${snapshot.error}"),
            );
          }
          final storesss = snapshot.data?.docs ?? [];

          return Scaffold(
            body: Column(children: [
              SafeArea(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text("Near By stores",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w800)),
                    Row(
                      children: [
                        IconButton(
                            onPressed: () {
                              Navigator.push(context, MaterialPageRoute(
                                builder: (context) {
                                  return UserOrderList();
                                },
                              ));
                            },
                            icon: Icon(Icons.shopping_bag_outlined)),
                        InkWell(
                          onTap: () {
                            Navigator.push(context, MaterialPageRoute(
                              builder: (context) {
                                return UserProfile();
                              },
                            ));
                          },
                          child: CircleAvatar(
                            radius: 15,
                            backgroundImage: AssetImage("assets/Ellipse 4.jpg"),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 50.h,
                    width: 330.w,
                    child: Row(children: [
                      Center(
                          child: Padding(
                        padding: const EdgeInsets.only(left: 20),
                        child: Icon(Icons.search),
                      )),
                      SizedBox(
                          width: 200.w,
                          child: TextFormField(
                            decoration: InputDecoration(
                                hintText: "   Search store",
                                border: InputBorder.none),
                          ))
                    ]),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Color(0xffDDEEE9)),
                  )
                ],
              ),
              Expanded(
                child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 20,
                  ),
                  itemCount: storesss.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: EdgeInsets.only(left: 10.sp),
                      child: InkWell(
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(
                            builder: (context) {
                              return UserStoreDetails(id: storesss[index].id);
                            },
                          ));
                        },
                        child: Container(
                          decoration: BoxDecoration(
                              color: Color(0xffBBE3D8),
                              borderRadius: BorderRadius.circular(10.sp)),
                          padding: const EdgeInsets.all(8),
                          child: Column(
                            children: [
                              Container(
                                  height: 100.h,
                                  width: 150.h,
                                  decoration: BoxDecoration(
                                      image: DecorationImage(
                                          image: NetworkImage(
                                              storesss[index]['path']),
                                          fit: BoxFit.fill),
                                      borderRadius: BorderRadius.circular(10),
                                      color: Colors.white)),
                              Text(storesss[index]['shopname'],
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w800)),
                              Text(storesss[index]['catagory']),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  RatingBar.builder(
                                      initialRating: 3,
                                      itemCount: 5,
                                      itemSize: 15,
                                      direction: Axis.horizontal,
                                      itemBuilder: (Context, _) =>
                                          Icon(Icons.star, color: Colors.amber),
                                      onRatingUpdate: (rating) {}),
                                ],
                              ),
                              Text("(150)")
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              )
            ]),
          );
        });
  }
}
