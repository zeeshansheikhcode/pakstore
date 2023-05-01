import 'package:flutter/material.dart';
class MyTextField extends StatelessWidget {
  final String? hinttext;
  final String? label;
  final IconData? iconData;
  final TextEditingController? myController;
  const MyTextField({
    super.key, 
    this.hinttext, 
    this.label, 
    this.iconData, 
    this.myController
    });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
     controller: myController,
     decoration: InputDecoration(
      hintText: hinttext,
      prefixIcon: Icon(iconData),
      label: Text(label!),
       border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
       )
     ),
     validator: (value) {
       if(value!.isEmpty)
       {
         return 'Enter Credentials';
       }
     },
    );
  }
}