import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'admin home Store List.dart';
import 'admin home user List.dart';

class AdminHome extends StatefulWidget {
  const AdminHome({super.key});

  @override
  State<AdminHome> createState() => _AdminHomeState();
}

class _AdminHomeState extends State<AdminHome> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(length: 2,initialIndex: 0,
      child: Scaffold(
        bottomNavigationBar: BottomAppBar(color: Colors.white,child:  Padding(
          padding: const EdgeInsets.only(left: 10, right: 10,top: 20).r,
          child: Container(
            height: 100.h,
            // width: 330.w,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.r),
                color: Color(0xffD5F1E9)),
            child: TabBar(
              labelColor: Colors.white,
              unselectedLabelColor: Colors.black,
              indicatorSize: TabBarIndicatorSize.tab,
              indicator: BoxDecoration(
                borderRadius: BorderRadius.circular(10.r),
                color: Color(0xff4D6877),
              ),
              tabs: [
                Tab(
                    child: Text(
                      'User',
                      style: TextStyle(
                        // color: Colors.white,
                        fontSize: 16.sp,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w500,
                        height: 0.h,
                      ),
                    )),

                Tab(
                    child: Text(
                      'Store',
                      style: TextStyle(
                        // color: Colors.black,
                        fontSize: 16.sp,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w500,
                        height: 0.h,
                      ),
                    )),

              ],

            ),
          ),
        ),
        ),
        body: Container(child: TabBarView(children: [User(),Store()])),
      ),
    );
  }
}
