import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:pakstore/model/product/product_model.dart';
import 'package:pakstore/res/routes/route_name.dart';
import 'package:pakstore/utils/utils.dart';
import '../../model/cart/cart_model.dart';
import '../../viewmodel/cart_viewmodel/cart_viewmodel.dart';
class CartScreen extends StatelessWidget {
   CartScreen({super.key});
   final CartController cartController = Get.put(CartController());
  @override
  Widget build(BuildContext context) {
    return   Scaffold(
      body: cartController.cart!.isEmpty
        ?
         const Center(child: Text('No Product in Cart',style : TextStyle(color: Colors.black)),)
        : 
         Obx(
             () => Column(
               children: [
                 AppBar(
                  title: const Text('Cart Products'),
                  centerTitle: true,
                 ),
                 Expanded(
                  flex: 5,
                   child: ListView.builder(
                       itemCount: cartController.cart!.length,
                       itemBuilder: (context,index)
                       {
                    return Container(
                      margin: EdgeInsets.symmetric(vertical: 10.h,horizontal: 10.w),
                       height: 90.h,
                       decoration:const BoxDecoration(
                        color: Colors.yellow
                       ),
                      child: ListTile(
                      title: Text(cartController.cart![index].product.name!,
                             style:const TextStyle(color: Colors.black),),
                      subtitle: Text(cartController.cart![index].product.price!.toString(), 
                             style:const TextStyle(color: Colors.black),),
                      trailing: 
                              Wrap(
                              spacing: 0,
                               children: [
                              IconButton(onPressed: (){
                            {
                               int quantity = cartController.cart![index].product.quantity!;
                               int price = cartController.cart![index].product.price!;
                               quantity++;
                               int newPrice = price * quantity;
                                   Product updatedProduct = cartController.cart![index].product.copyWith(
                                  quantity: quantity,
                                  price: newPrice,
                                   );
                                    cartController.cart![index] = CartModel(id: 1, product: updatedProduct);
                                    cartController.addCounter();
                                    cartController.addTotalPrice(cartController.cart![index].product.initialprice!);
                                    }},
                                  icon:const Icon(Icons.add,size: 20,)
                                  ),
                                  Obx(
                                    ()=> Text(cartController.cart![index].product.quantity.toString(),
                                    style:const TextStyle(color: Colors.black),),
                                  ),
                                  IconButton(onPressed: () {
                                  int quantity = cartController.cart![index].product.quantity!;
                                  int price = cartController.cart![index].product.price!;
                                  quantity--;
                                     if (quantity > 0) {
                                       int newPrice = price * quantity;
                                       Product updatedProduct = cartController.cart![index].product.copyWith(
                                         quantity: quantity,
                                         price: newPrice,
                                         );
                                       cartController.cart![index] = CartModel(id: 1, product: updatedProduct);
                                       cartController.removeCounter();
                                       cartController.removeTotalPrice(cartController.cart![index].product.initialprice!);
                                      } 
                                    },
                                  icon:const Icon(Icons.remove,size: 20,)
                                  ),
                                ],
                              ),
                             ),
                    );
                          }
                        ),
                 ),
                 Expanded(
                  flex: 1,
                  child: 
                 Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                   children: [
                     Obx( 
                        ()=>
                        Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: 
                        [
                          const Text('Total item',style: TextStyle(color: Colors.black),),
                          Text(cartController.counter.toString(),style:const TextStyle(color: Colors.black),),
                          const Text('Total Price',style: TextStyle(color: Colors.black),),
                          Text(cartController.totalprice.toString(),style:const TextStyle(color: Colors.black),)
                     
                        ],
                       ),
                     ),
                      Center(child: ElevatedButton(onPressed: 
                       ()
                       {
                        if(cartController.cart!.isNotEmpty)
                        {
                          showDialog(context: context, 
                          builder: (context) {
                            return Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: 
                              [
                                Text('Your Billing Amount is ${cartController.totalprice.toString()}'),
                                const Text('Choose one'),
                                TextButton(onPressed: (){
                                  Get.toNamed(RouteName.stripeview);
                                },child:const Text('Card'),),
                                TextButton(onPressed: (){
                                  Get.toNamed(RouteName.paypalview);
                                },child:const Text('PayPal'),),
                              ],
                            );
                          },
                          );
                        }
                        else 
                        {
                          Utils.showSnackBar('No Item in Cart');
                        }
                       },
                       child:const Text('Go For Payment')),)
                   ],
                 ))
               ],
             ),
         )
              );

          

        }
        
  }
