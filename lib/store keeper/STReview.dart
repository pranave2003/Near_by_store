import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class STReview extends StatefulWidget {
  const STReview({super.key});

  @override
  State<STReview> createState() => _STReviewState();
}

class _STReviewState extends State<STReview> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(
        "Review",
        style: TextStyle(fontWeight: FontWeight.w600),
      )),
      body: ListView.builder(
        itemCount: 5,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.all(10.sp),
            child: InkWell(
              onTap: () {},
              child: Container(
                height: 100.h,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Color(0xffD5F1E9)),
                child: Row(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: CircleAvatar(
                            radius: 30,
                            backgroundImage: AssetImage("assets/Ellipse 4.jpg"),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(20),
                          child: Column(
                            children: [
                              Text("Akshay"),
                              Text("VMK super Market"),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  RatingBar.builder(
                                      initialRating: 3,
                                      itemCount: 5,
                                      itemSize: 20,
                                      direction: Axis.horizontal,
                                      itemBuilder: (Context, _) => Icon(
                                          Icons.star,
                                          color: Colors.amber),
                                      onRatingUpdate: (rating) {}),

                                ],
                              ),
                            ],
                          ),
                        ),
                        Text("(4/5)")
                      ],
                    ),

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
