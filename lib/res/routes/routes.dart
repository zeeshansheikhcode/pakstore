
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:get/get_navigation/src/routes/transitions_type.dart';
import 'package:pakstore/payment_method/paypal_method.dart';
import 'package:pakstore/res/routes/route_name.dart';
import 'package:pakstore/view/authentication/authentication_page.dart';
import '../../model/product/product_model.dart';
import '../../payment_method/stripe_method.dart';
import '../../view/bottom_bar.dart';
import '../../view/detail/detail_screen.dart';
import '../../view/home/home_screen.dart';
import '../../view/splash_view.dart';
import '../../viewmodel/detail_viewmodel/detail_viewmodel.dart';

class AppRoutes 
{
  static appRoutes() => 
  [
    GetPage(
      name: RouteName.splashScreen, page: ()=> SplashView(),
      transitionDuration:const Duration(milliseconds: 250), 
      transition: Transition.leftToRightWithFade
     ),
    
     GetPage(
      name: RouteName.authview, page: ()=> AuthenticationScreen(),
      transitionDuration:const Duration(milliseconds: 250), 
      transition: Transition.leftToRightWithFade
     ),
     GetPage(
      name: RouteName.stripeview, page: ()=> StripeMethod(),
      transitionDuration:const Duration(milliseconds: 250), 
      transition: Transition.leftToRightWithFade
     ),

     GetPage(
      name: RouteName.homeview, page: ()=> HomeView(),
      transitionDuration:const Duration(milliseconds: 250), 
      transition: Transition.leftToRightWithFade
     ),

     GetPage(
      name: RouteName.barview, page: ()=> AppTabBar(),
      transitionDuration:const Duration(milliseconds: 250), 
      transition: Transition.leftToRightWithFade
     ),
     GetPage(
      name: RouteName.stripeview, page: ()=> StripeMethod(),
      transitionDuration:const Duration(milliseconds: 250), 
      transition: Transition.leftToRightWithFade
     ),
     GetPage(
      name: RouteName.paypalview, page: ()=> PaypalMethod(),
      transitionDuration:const Duration(milliseconds: 250), 
      transition: Transition.leftToRightWithFade
     ),
     GetPage(
      name: RouteName.detailview, page: () => DetailView(),
      transitionDuration:const Duration(milliseconds: 250), 
      transition: Transition.leftToRightWithFade,
      binding: BindingsBuilder(() {
      Get.lazyPut(() => DetailController());
     }),
     arguments: Product(),
     ),
  ];
}