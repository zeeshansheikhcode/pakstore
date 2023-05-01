
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../services/auth_services.dart';
import '../../services/services_locator.dart';
import '../../utils/utils.dart';

class AuthenticationViewModel extends GetxController 
{
  RxBool isLogin = true.obs;
  dynamic result;
  File? imagefile;
  final nameController     = TextEditingController();
  final emailController    = TextEditingController();
  final passwordController = TextEditingController();

  final AuthenticationServices _authenticationService = locator<AuthenticationServices>();
  

  //  Future<dynamic> googlecreateAccount(BuildContext context) async
  //  {    
       
  //   try
  //    {      
  //       final res = await _authenticationService.signInWithGoogle(context: context);
  //       if(res is bool != false)
  //       {
  //         emailController.dispose();
  //         passwordController.dispose();
  //         result   = true;
  //         notifyListeners();
  //         Utils.showSnackBar('Successfully Register', context);
  //         Navigator.pushNamed(context, RoutesName.searchview);
        
  //       }
          
  //    } 
  //     catch(e)
  //    { print('error $e');
  //       e.toString();    
  //    }
  // }

    Future<dynamic> createAccount() async
   {    
       if(emailController.text.isEmpty && passwordController.text.isEmpty )
        {
          result = 'Enter Credentials';
          Utils.showSnackBar(result);
          return result;
          
        }
    try
     {  
       
        final res = await _authenticationService.registerNewUser(
          emailController.text,
          passwordController.text,
          nameController.text,
          );
        if(res is bool != false)
        {
          
          emailController.clear();
          passwordController.clear();
          result   = true;
          Utils.showSnackBar('Successfully Register',);
          
           return result;
        }
        else 
        { 
          result = res ;
          Utils.showSnackBar(result,);
          return result;
        }
     } 
      catch(e)
     { print('erorr $e');
        e.toString();    
     }
  }

  Future<dynamic> logIn() async
  { 
     if(emailController.text.isEmpty && passwordController.text.isEmpty )
        {
          result ='Enter Credentials';
          Utils.showSnackBar(result);
          return result;
        }
  
   try
   {  
         final res = await _authenticationService.signInWithEmailAndPassword(emailController.text,  passwordController.text);
           if(res is bool != false)
           {
            emailController.clear();
            passwordController.clear();
            result = true;
            Utils.showSnackBar('Successfully login', );
           }
           else {
             result = res;
             Utils.showSnackBar(result,);
             
           }
          
   } 
   catch(e)
    {
      e.toString();    
    }
  }

  Future<dynamic> forgotPassword(BuildContext context) async
  {
     
     if(emailController.text==null)
     {
       result = 'Enter Credentials';
       return result;
     }
     try
     {
       final res = await _authenticationService.forgotPassword(emailController.text);
      
     }
     catch(e)
     {
      e.toString();
     }   
  }

  void loggingOut(context) async
  {
    final res =  await _authenticationService.logOut();
 
    print(res);
    if(res==true)
    {

    }
  }


}