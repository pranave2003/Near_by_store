import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:near_by_store/store%20keeper/ST OrderList.dart';
import 'package:near_by_store/store%20keeper/ST%20Profile.dart';
import 'package:near_by_store/store%20keeper/ST%20StoreList.dart';
import 'package:near_by_store/store%20keeper/STReview.dart';
import 'package:near_by_store/store%20keeper/StoreKeeperAddStore.dart';
import 'package:near_by_store/store%20keeper/StoreKeeperOrderView.dart';
import 'package:near_by_store/store%20keeper/StoreKeeperProduct.dart';
import 'package:near_by_store/store%20keeper/StorekeeperEditProfile.dart';
import 'package:near_by_store/user/Fruits.dart';
import 'package:near_by_store/user/Grocery.dart';
import 'package:near_by_store/user/User%20cart.dart';
import 'package:near_by_store/user/UserHome.dart';
import 'package:near_by_store/user/UserLogin.dart';
import 'package:near_by_store/user/UserOrderList.dart';
import 'package:near_by_store/user/UserRegister.dart';
import 'package:near_by_store/user/Vegitables.dart';
import 'package:near_by_store/user/storeList.dart';
import 'package:near_by_store/user/user%20Edit%20Profile.dart';
import 'package:near_by_store/user/user%20Profile.dart';
import 'package:near_by_store/user/user%20product%20details.dart';
import 'package:near_by_store/user/user.dart';
import 'package:near_by_store/user/user_Store_details.dart';

import 'admin/admin Store.dart';
import 'admin/admin home Store List.dart';
import 'admin/admin home user List.dart';
import 'admin/admin home.dart';
import 'admin logo.dart';
import 'admin/admin user.dart';
import 'admin/admin_login.dart';
import 'firebase_options.dart';

void main()async

{ WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
  options: DefaultFirebaseOptions.currentPlatform,
);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(builder: (context, child) =>
      MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: UserLogin()
      ),
      designSize: Size(390, 844),
    );
  }
}

