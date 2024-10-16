import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class OtbWidget extends StatelessWidget {
  const OtbWidget({required this.controller,super.key});

  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,),
      controller: controller,
      keyboardType: TextInputType.number,
      onChanged: (value){if(value.length==1){
        FocusScope.of(context).nextFocus();
      }},
      inputFormatters: [
        FilteringTextInputFormatter.digitsOnly,
        LengthLimitingTextInputFormatter(1),
      ],
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        hintText: ""
      ),
    );
  }
}
