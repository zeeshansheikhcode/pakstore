import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Utils 
{
  static  fieldFocusChange(BuildContext context, FocusNode current,FocusNode next)
  {
    current.unfocus();
    FocusScope.of(context).requestFocus(next);
  }



 static  showSnackBar(String message)
   {
     return Get.snackbar(
           'Alert', 
            message,
            snackPosition: SnackPosition.TOP    
            );
     
   }


}