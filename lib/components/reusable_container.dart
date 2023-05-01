import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:pakstore/model/product/product_model.dart';
import 'package:pakstore/viewmodel/cart_viewmodel/cart_viewmodel.dart';
class ReusableContainer extends StatelessWidget {
  final double? height;
  final double? width;
  final Product? product;
   ReusableContainer({super.key,
    this.height,
    this.width, 
    this.product,
    });
    final CartController cartController = Get.put(CartController());
 
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: 
            ()
           {
              cartController.addProduct(product!);

           },
      child: Container(
          height: height,
          width: width,
          decoration:  BoxDecoration(
            color: Colors.black,
            borderRadius: BorderRadius.circular(20)
          ),
          padding: EdgeInsets.symmetric(vertical: 5.h),
          margin: EdgeInsets.symmetric(vertical: 5.h , horizontal: 10.w),
          child: Column(
            children: 
            [
              Expanded(child: Image.asset(product!.imageUrl!)),
              SizedBox(height: 5.h,),
              Text(product!.name!),
              SizedBox(height: 5.h,),
              Text(product!.price!.toString()),
              SizedBox(height: 5.h,),
            ],
          ),
      ),
    );
  }
}