import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TextFField extends StatelessWidget {
   const TextFField({super.key, required this.icon, required this.controller});

  final Icon icon;
  final TextEditingController controller;
 
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        prefixIcon: icon,
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(18.0),
          ),
        ),
        prefixIconConstraints:const  BoxConstraints(
        minWidth: 70,
      ),
        contentPadding: const EdgeInsets.symmetric(vertical: 22),
        hintText: 'Entrer le nouveau numéro ',
        hintStyle: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.w500),
      ),
    );
  }
}