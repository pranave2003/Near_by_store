import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:near_by_store/user/user%20product%20details.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Fruits extends StatefulWidget {
  const Fruits({
    super.key,
  });

  @override
  State<Fruits> createState() => _FruitsState();
}

class _FruitsState extends State<Fruits> {
  Future<void> getData() async {
    print("ghvhv");
    SharedPreferences spref = await SharedPreferences.getInstance();
    setState(() {
      storeid = spref.getString("storeid")!;
      spref.getString(
        "id",
      );

      print(storeid.toString());
    });
    print("Updated");
  }

  var storeid = '';
  void initState() {
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: FirebaseFirestore.instance
          .collection('Addproduct')
          .where("productstoreid", isEqualTo: storeid)
          .where("product", isEqualTo: "Fruit")
          .get(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }
        if (snapshot.hasError) {
          return Text("Error${snapshot.error}");
        }

        final fruits = snapshot.data?.docs ?? [];

        return Scaffold(
          body: InkWell(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(
                builder: (context) {
                  return UserProductDetails();
                },
              ));
            },
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  mainAxisExtent: 170),
              itemCount: fruits.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: EdgeInsets.only(left: 10.sp),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(10),
                        topRight: Radius.circular(10),
                      ),
                      color: Color(0xffBBE3D8),
                    ),
                    padding: const EdgeInsets.all(8),
                    child: Column(
                      children: [
                        Container(
                            height: 80.h,
                            width: 90.w,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: NetworkImage(fruits[index]['path']),
                                    fit: BoxFit.fill),
                                borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(10),
                                  topRight: Radius.circular(10),
                                ),
                                color: Colors.white)),
                        Text(fruits[index]['productname'],
                            style: TextStyle(
                                fontSize: 15, fontWeight: FontWeight.w800)),
                        Text(
                            "${fruits[index]['quantity']}${fruits[index]['kgOrgram']}"),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.currency_rupee_sharp),
                            Text(fruits[index]['amount'],
                                style: TextStyle(
                                    color: Colors.green.shade700,
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold)),
                          ],
                        )
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        );
      },
    );
  }
}
