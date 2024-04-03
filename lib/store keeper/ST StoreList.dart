import 'package:cloud_firestore/cloud_firestore.dart';
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
          body: Column(
            children: [
              SafeArea(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Added Store",
                      style:
                          TextStyle(fontWeight: FontWeight.w600, fontSize: 20),
                    )
                  ],
                ),
              ),
              Container(
                height: 650.h,
                child: ListView.builder(
                  itemCount: storesss.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: EdgeInsets.all(10.sp),
                      child: InkWell(
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(
                            builder: (context) {
                              return StoreKeeperProduct(id:storesss[index].id);
                            },
                          ));
                        },
                        child: Container(
                          height: 120.h,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Color(0xffD5F1E9)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  width: 100.w,
                                  height: 100.h,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(15),
                                      image: DecorationImage(
                                          image: NetworkImage(
                                              storesss[index]['path']),
                                          fit: BoxFit.fill)),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(20),
                                child: Column(
                                  children: [
                                    Text(storesss[index]['shopname'],
                                        style: const TextStyle(
                                            fontWeight: FontWeight.w600,
                                            fontSize: 20)),
                                    Text(storesss[index]['catagory'],
                                        style: const TextStyle(
                                            fontWeight: FontWeight.w600,
                                            fontSize: 20)),
                                  ],
                                ),
                              ),
                              IconButton(
                                  onPressed: () {
                                    FirebaseFirestore.instance
                                        .collection("AddStore")
                                        .doc(storesss[index].id)
                                        .delete();
                                    print("deleted");
                                  },
                                  icon: Icon(Icons.delete_rounded))
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
                        onPressed: () {
                          Navigator.push(context, MaterialPageRoute(
                            builder: (context) {
                              return StoreKeeperAddStore();
                            },
                          ));
                        },
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
      },
    );
  }
}
