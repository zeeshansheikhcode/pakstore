import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../components/reusable_container.dart';
import '../../viewmodel/home_viewmodel/home_viewmodel.dart';
class HomeView extends StatelessWidget {
   HomeView({super.key});
  final HomeController homeController = Get.put(HomeController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:const Text('Pak Store'),
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      body: 
         SingleChildScrollView(
           child: Column(
           children: [
            SizedBox(height: 30.h,),
             Padding(
           padding:  EdgeInsets.symmetric(horizontal: 10.w),
           child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: 
            [ 
              
              SizedBox(
                height: 60.h,
                width: 300.w,
                child: TextFormField
                (
                   validator: (value) {
                  if (value!.isEmpty) {
                   return 'Please enter an address';
                   }
                   return null;
                   },
                    
                  style:const TextStyle(color: Colors.black),
                  decoration: InputDecoration(
                    hintText: 'Search',
                    focusedBorder: InputBorder.none,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ), 
                   ),  
                 ),
              ),
              SizedBox(
                width: 5.w,
              ),
           ]
              ),
             ),
             Center(
               child: SizedBox(
                height: 150.h,
                width:  0.9.sw,
                child: Center(
                  child: Image.asset(
                                'assets/images/homeslide.png', 
                  fit: BoxFit.cover,
                  ),
                ),
               ),
             ),
             SizedBox(height: 10.h,),
             Text('Featured' , style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20.sp,color: Colors.black),),
             SizedBox(
               height: 120.h,
               child: ListView.builder(          
                 scrollDirection: Axis.horizontal,
                // physics: NeverScrollableScrollPhysics(),
                 itemCount: homeController.productlist.length,
                 itemBuilder: ((context, index) {
                   return ReusableContainer(
                     height: 200.h,
                     width : 100.w,
                     product: homeController.productlist[index] ,
                   );
                 })
                 ),
             ),
             SizedBox(height: 10.h,),
             Text('All' , style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20.sp,color: Colors.black),),
             SizedBox(
                height: 700.h,
               child: GridView.builder(
                gridDelegate:const SliverGridDelegateWithFixedCrossAxisCount(
               crossAxisCount: 2, // number of columns in the grid
               mainAxisSpacing: 10, // spacing between rows
               crossAxisSpacing: 10, // spacing between columns
               childAspectRatio: 1, // aspect ratio of each item
                        ),
                 physics:const NeverScrollableScrollPhysics(),
                itemCount: homeController.productlist.length,
                itemBuilder: (BuildContext context, int index) {
                   return ReusableContainer(
                     height: 250.h,
                     width : 0.4.sw,
                     product: homeController.productlist[index],
                   );
                  }
                 ),
             ),
               ],
               ),
         )
    ); 
  }
}
