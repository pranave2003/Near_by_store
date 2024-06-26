import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:near_by_store/user/Fruits.dart';
import 'package:near_by_store/user/Grocery.dart';
import 'package:near_by_store/user/Vegitables.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserStoreDetails extends StatefulWidget {
  const UserStoreDetails({super.key, required this.id});
  final id;

  @override
  State<UserStoreDetails> createState() => _UserStoreDetailsState();
}

class _UserStoreDetailsState extends State<UserStoreDetails> {
  DocumentSnapshot? Storede;
  //
  //
  //
  getDtata() async {
    Storede = await FirebaseFirestore.instance
        .collection('AddStore')
        .doc(widget.id)
        .get();
    SharedPreferences data = await SharedPreferences.getInstance();

    data.setString('storeid', widget.id);
    print('add sp');

    print("//////////////////////////////${widget.id}");
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
        return DefaultTabController(
          length: 3,
          child: Scaffold(
            body: Column(children: [
              SafeArea(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          IconButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              icon: Icon(Icons.arrow_back)),
                          Text(
                            "Store",
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.w600),
                          )
                        ],
                      ),
                      Icon(
                        Icons.star,
                        color: Colors.grey,
                      )
                    ],
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Storede!['path'] == null
                      ? Container(
                          height: 140.h,
                          width: 140.w,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage("assets/redshope.jpg"),
                                  fit: BoxFit.fill)),
                        )
                      : Container(
                          height: 140.h,
                          width: 140.w,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: NetworkImage(Storede!['path']),
                                  fit: BoxFit.fill)),
                        )
                ],
              ),
              Text(
                Storede!['shopname'],
                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20),
              ),
              Text(Storede!['catagory'],
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600)),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  RatingBar.builder(
                      initialRating: 3,
                      itemCount: 5,
                      itemSize: 20,
                      direction: Axis.horizontal,
                      itemBuilder: (Context, _) =>
                          Icon(Icons.star, color: Colors.amber),
                      onRatingUpdate: (rating) {}),
                  IconButton(onPressed: () {}, icon: Icon(Icons.edit))
                ],
              ),
              Text("(245)"),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  width: 330.w,
                  decoration: BoxDecoration(
                    border: Border.all(
                      width: 1,
                    ),
                    color: Color(0xffD5F1E9),
                  ),
                  child: TabBar(
                      tabs: [
                        Tab(
                          child: Text("Fruits"),
                        ),
                        Tab(
                          child: Text("Vegitables"),
                        ),
                        Tab(
                          child: Text("Grocery"),
                        ),
                      ],
                      indicatorSize: TabBarIndicatorSize.tab,
                      labelColor: Colors.white,
                      indicator: BoxDecoration(color: Color(0xff4D6877))),
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
                                hintText: "   Search product",
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
                  child:
                      TabBarView(children: [Fruits(), Vegitables(), Grocery()]))
            ]),
          ),
        );
      },
    );
  }
}
