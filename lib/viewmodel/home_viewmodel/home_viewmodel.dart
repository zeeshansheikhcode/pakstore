
import 'package:get/get.dart';
import 'package:pakstore/model/product/product_model.dart';

class HomeController extends GetxController
{   
   List<Product> productlist =
   [
     Product(
      id       : '01',
      imageUrl : 'assets/images/handsf.png',
      price    : 1000,
      name     : 'Handree',
      initialprice: 1000,
      quantity : 1,
     ),
     Product(
      id       : '02',
      imageUrl : 'assets/images/handfree.png',
      price    : 1000,
      name     : 'Handree',
      initialprice: 1000,
      quantity : 1,
     ),
      Product(
      id       : '03',
      imageUrl : 'assets/images/tv.png',
      price    : 1000,
      name     : 'Handree',
      initialprice: 1000,
      quantity : 1,
     ),
     Product(
      id       : '04',
      imageUrl : 'assets/images/shoe.png',
      price    : 1000,
      name     : 'Handree',
      quantity : 1,
      initialprice: 1000,
     ),

      Product(
      id       : '05',
      imageUrl : 'assets/images/tv.png',
      price    : 1000,
      name     : 'Handree',
      quantity : 1,
      initialprice: 1000,
     ),
     Product(
      id       : '06',
      imageUrl : 'assets/images/watch.png',
      price    : 1000,
      name     : 'Handree',
      quantity : 1,
      initialprice: 1000,
     ),
      Product(
      id       : '07',
      imageUrl : 'assets/images/watches.png',
      price    : 1000,
      name     : 'Handree',
      quantity : 1,
      initialprice: 1000,
     ),
   ];
}