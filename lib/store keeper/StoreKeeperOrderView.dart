import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'ST OrderList.dart';
import 'ST Profile.dart';
import 'ST StoreList.dart';
import 'STReview.dart';

class StorekeeeperOrderView extends StatefulWidget {
  const StorekeeeperOrderView({super.key});

  @override
  State<StorekeeeperOrderView> createState() => _StorekeeeperOrderViewState();
}

class _StorekeeeperOrderViewState extends State<StorekeeeperOrderView> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      initialIndex: 0,
      child: Scaffold(
          bottomNavigationBar: Container(
            height: 50.h,
            // width: 330.w,
            decoration: BoxDecoration(color: Color(0xffD5F1E9)),
            child: TabBar(
              labelColor: Colors.white,
              unselectedLabelColor: Colors.black,
              indicatorSize: TabBarIndicatorSize.tab,
              indicator: BoxDecoration(
                borderRadius: BorderRadius.circular(1.r),
                color: Color(0xff4D6877),
              ),
              tabs: [
                Tab(
                    child: Text(
                  'Order',
                  style: TextStyle(
                    // color: Colors.black87,
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
                Tab(
                    child: Text(
                  'Review',
                  style: TextStyle(
                    // color: Colors.black,
                    fontSize: 16.sp,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w500,
                    height: 0.h,
                  ),
                )),
                Tab(
                    child: Text(
                  'Profile',
                  style: TextStyle(
                    // color: Colors.black,
                    fontSize: 16.sp,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w500,
                    height: 0.h,
                  ),
                ))
              ],
            ),
          ),
          body: TabBarView(children: [
            StorekeepOrderList(),
            StStoreList(),
            STReview(),
            STprofile()
          ])),
    );
  }
}
