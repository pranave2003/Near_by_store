import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Vegitables extends StatefulWidget {
  const Vegitables({super.key});

  @override
  State<Vegitables> createState() => _VegitablesState();
}

class _VegitablesState extends State<Vegitables> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            mainAxisExtent: 170
        ),
        itemCount: 10,
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
                          image: DecorationImage(image: AssetImage("assets/Carrot.png")),
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(10),
                            topRight: Radius.circular(10),
                          ),
                          color: Colors.white)),
                  Text("Carrot",
                      style:
                      TextStyle(fontSize: 15, fontWeight: FontWeight.w800)),
                  Text("1kg"),
                  Row(mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.currency_rupee_sharp),
                      Text("35.00",style: TextStyle(color: Colors.green.shade700)),
                    ],
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
