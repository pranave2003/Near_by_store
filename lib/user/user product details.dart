import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:near_by_store/user/User%20cart.dart';

class UserProductDetails extends StatefulWidget {
  const UserProductDetails({super.key});

  @override
  State<UserProductDetails> createState() => _UserProductDetailsState();
}

class _UserProductDetailsState extends State<UserProductDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        SafeArea(
          child: Row(
            children: [
              IconButton(onPressed: () {Navigator.of(context).pop();}, icon: Icon(Icons.arrow_back)),
              Text(
                "Product",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
              )
            ],
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 200.h,
              width: 200.h,
              decoration: BoxDecoration(
                  color: Colors.amber,
                  borderRadius: BorderRadius.circular(20),
                  image: DecorationImage(
                      image: AssetImage("assets/Apple.jpg"), fit: BoxFit.fill)),
            )
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Apple",
              style: TextStyle(fontWeight: FontWeight.w800, fontSize: 18),
            )
          ],
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("1kg "),
              Text(
                "Rs.109.00",
                style: TextStyle(
                    color: Colors.green,
                    fontWeight: FontWeight.w800,
                    fontSize: 18),
              )
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.all(20.sp),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                height: 40.h,
                width: 130.w,
                child: Row(
                  children: [
                    Container(
                        width: 40.w,
                        height: 40.h,
                        child: IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.remove_rounded,
                              color: Colors.white,
                            )),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(10),
                              bottomLeft: Radius.circular(10),
                            ),
                            color: Color(0xff4D6877))),
                    SizedBox(
                        width: 50.w,
                        child: Center(
                            child: Text(
                          "1",
                          style: TextStyle(fontSize: 20.sp),
                        ))),
                    Container(
                        width: 40.w,
                        height: 40.h,
                        child: Center(
                          child: IconButton(
                              onPressed: () {},
                              icon: Icon(
                                Icons.add,
                                color: Colors.white,
                              )),
                        ),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                              bottomRight: Radius.circular(10),
                              topRight: Radius.circular(10),
                            ),
                            color: Color(0xff4D6877))),
                  ],
                ),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Color(0xffD5F1E9)),
              ),
              Container(
                height: 40.h,
                width: 130.w,
                child: Row(
                  children: [
                    Container(
                        width: 40.w,
                        height: 40.h,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(10),
                              bottomLeft: Radius.circular(10),
                            ),
                            color: Color(0xffD5F1E9))),
                    SizedBox(
                        width: 50.w,
                        child: Center(
                            child: Text(
                          "kg",
                          style: TextStyle(fontSize: 20.sp),
                        ))),
                    Container(
                        width: 40.w,
                        height: 40.h,
                        child: Center(
                          child: IconButton(
                              onPressed: () {},
                              icon: Icon(
                                Icons.keyboard_arrow_down,
                                color: Colors.white,
                              )),
                        ),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                              bottomRight: Radius.circular(10),
                              topRight: Radius.circular(10),
                            ),
                            color: Color(0xff4D6877))),
                  ],
                ),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Color(0xffD5F1E9)),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: SizedBox(
            width: 330.w,
            height: 300.h,
            child: Text(
                "Fruits are the means by which flowering Plants "
                "disseminate their seeds.Edible fruits in"
                " particular have long propogated using the "
                "movements of humans and other animals in a"
                " that is the means for the one group and for"
                " the other,in fact ,humans and many other "
                "animals have become dependent on fruts a "
                "source of food",
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600)),
          ),
        ),
        Container(
          height: 50.h,
          width: 330.w,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Color(0xff4D6877)),
          child: TextButton(
              onPressed: () {Navigator.push(context, MaterialPageRoute(builder: (context) {
                return UserCart();
              },));},
              child: Text(
                "Add to Cart",
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
              )),
        )
      ]),
    );
  }
}
