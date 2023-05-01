import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:pakstore/components/reusable_btn.dart';
import 'package:pakstore/components/textfield_components.dart';
import 'package:pakstore/viewmodel/authentication_viewmodel/authentication_viewmodel.dart';
class AuthenticationScreen extends StatelessWidget {
   AuthenticationScreen({super.key});
  
  final AuthenticationViewModel authenticationViewModel = Get.put(AuthenticationViewModel());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() =>
         Padding(
          padding:  EdgeInsets.symmetric(horizontal: 10.w),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children:
             [
        
               SizedBox(height: 50.h,),
               Center(
                 child: Text('Welcome To PakStore',
                 style: TextStyle(
                  fontSize: 20.sp,
                  fontWeight: FontWeight.bold,
                  color: Colors.black
                  ),
                 ),
               ),
               SizedBox(height: 30.h,),
               if(authenticationViewModel.isLogin.value== false)
               Stack(
                children: 
                [
                  CircleAvatar(
                    backgroundColor: Colors.grey,
                    radius: 40,
                    child:Center() 
                    
                    // Image.file(authenticationViewModel.imagefile!)
                   ),
                  Positioned(
                    right: 0,
                    bottom: 0,
                    child: 
                    IconButton(
                      icon:const Icon(Icons.add_a_photo,),
                      onPressed: (){},))
                ],
               ),
               SizedBox(height: 30.h,),
               if(authenticationViewModel.isLogin.value==false)
               MyTextField(
               hinttext: 'Enter Name',
               label: 'Name',
               iconData: Icons.person,
               myController: authenticationViewModel.nameController,
               ),
               SizedBox(height: 30.h,),
               MyTextField(
               hinttext: 'Enter Email',
               label: 'Email',
               iconData: Icons.email,
               myController: authenticationViewModel.emailController,
               ),
               SizedBox(height: 35.h,),
               MyTextField(
               hinttext: 'Enter Password',
               label: 'Password',
               iconData: Icons.password,
               myController: authenticationViewModel.passwordController,
               ),
               SizedBox(height: 30.h,),
               ReusableButton(
                 ontap: ()
                 {
                   if(authenticationViewModel.isLogin.value)
                   {
                     authenticationViewModel.logIn();
                   }
                   else 
                   {
                    authenticationViewModel.createAccount();
                   }
                 },
                 height: 50.h,
                 width: 200.w,
                 title: authenticationViewModel.isLogin.value ?  'Login'   : 'Sign up',
                 color: Colors.orange,
                ),
                
                Center(child: TextButton(
                  onPressed: ()
                  {
                    authenticationViewModel.isLogin.value = !authenticationViewModel.isLogin.value;
                  },
                  child: Text(
                    authenticationViewModel.isLogin.value
                    ?
                    'create account?'
                    :
                    'Go for Login if already register'
                    ),
                   ),
                  )
        
             ],
          ),
        ),
      ),
    );
  }
}