import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../components/reusable_container.dart';
import '../../viewmodel/home_viewmodel/home_viewmodel.dart';
class CategoriesView extends StatelessWidget {
   CategoriesView({super.key});
  final HomeController homeController = Get.put(HomeController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:const Text('Category'),
        centerTitle: true,
      ),
      body: GridView.builder(
                        gridDelegate:const SliverGridDelegateWithFixedCrossAxisCount(
               crossAxisCount: 2, // number of columns in the grid
               mainAxisSpacing: 10, // spacing between rows
               crossAxisSpacing: 10, // spacing between columns
               childAspectRatio: 1, // aspect ratio of each item
                        ),
                physics: const NeverScrollableScrollPhysics(),
                itemCount: homeController.productlist.length,
                itemBuilder: (BuildContext context, int index) {
                   return ReusableContainer(
                     height: 250.h,
                     width : 0.4.sw,
                      product: homeController.productlist[index] ,
                   );
                  }
                 ),
    );
  }
}