import 'package:get/get.dart';
import 'package:pakstore/model/product/product_model.dart';
import 'package:pakstore/utils/utils.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../model/cart/cart_model.dart';

class CartController extends GetxController
{
  RxInt counter = 0.obs ;
  //int get counter  => _counter;

  RxInt totalprice = 0.obs;
  //double get totalprice => _totalprice;

  RxList<CartModel>? cart = RxList<CartModel>([]);
 // Future<List<CartModel>>? get cart => _cart;

//   Future<List<CartModel>> getProduct()
//  {   
//     return _cart = dbHelper.getCart(); 
//  }
  
 
  void addProduct(Product product)
  {
     CartModel cartModel = CartModel(id: 1, product: product); 
     cart!.add(cartModel);
     addTotalPrice(product.price!);
     addCounter();
     Utils.showSnackBar('Item Added');
  }
  void deleteProduct(int id)
  {
        cart!.clear(); 
    //_cart.
  //  dbHelper.delete(id);
  //  dbHelper.getCart();
   
  }

  void _setPrefItems() async
  {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setInt('cart_item', counter.value);
    prefs.setInt('total_price', totalprice.value);

  }

  void _getPrefItems() async
  {
    SharedPreferences prefs = await SharedPreferences.getInstance();
     counter.value    = prefs.getInt('cart_item')!;
     totalprice.value = prefs.getInt('total_price')!;
  }
   

  void addCounter()
  {
    counter.value++;
    _setPrefItems();
  }

  void removeCounter()
  { 
    if(counter.value>0) 
    {
    counter.value--;
    _setPrefItems();
    }
  }

  int getCounter()
  {
    _getPrefItems();
    return counter.value;
  }

  void addTotalPrice(int productPrice)
  {
    totalprice.value = totalprice.value + productPrice;
    print('total price ${totalprice.value}');
    _setPrefItems();
  }

  void removeTotalPrice(int productPrice)
  {
     if(totalprice.value>0)
     {
    totalprice.value = totalprice.value - productPrice;
      _setPrefItems();
     }
   
  }

  int getTotalPrice()
  {
    _getPrefItems();
    return totalprice.value;
  }
}
  
