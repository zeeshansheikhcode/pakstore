import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:get/get.dart';
import 'package:pakstore/res/routes/routes.dart';
import 'package:pakstore/services/services_locator.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  setup();
  Stripe.publishableKey = 'pk_test_51LrlEBSCcGYFpsOzNBAzVAeN5ErZbS0IKYnJRgRHol0dDWw6IRk5v6JpyKmMjxq4Z02dFNxPawV200AocyPslBE700g7mgoFXU';
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
       return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context , child) {
          return GetMaterialApp(
              debugShowCheckedModeBanner: false,
              title: 'Private Chat',
              theme: ThemeData(
                primarySwatch: Colors.blue,
                textTheme: Typography.englishLike2018.apply(fontSizeFactor: 1.sp),
              ),
            
              getPages: AppRoutes.appRoutes(),
        );
      }
    );    
  }
}



