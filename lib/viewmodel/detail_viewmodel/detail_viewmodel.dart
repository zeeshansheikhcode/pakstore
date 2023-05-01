
import 'package:get/get.dart';
import 'package:pakstore/model/product/product_model.dart';


class DetailController extends GetxController
{
  late final Product productData;

  @override
  void onInit() {
    super.onInit();
    productData = Get.arguments;
  }
}