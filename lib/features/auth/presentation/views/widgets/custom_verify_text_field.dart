import 'package:flutter/material.dart';

class CustomVerifyTextField extends StatelessWidget {
  CustomVerifyTextField({
    super.key,
    this.controller,
    this.focusNode,
    this.onChanged,
  });
  TextEditingController? controller;
  FocusNode? focusNode;
  void Function(String)? onChanged;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: Container(
          width: 15,
          decoration: BoxDecoration(
            //color: Color(0xFFCFCFCF),
            borderRadius: BorderRadius.circular(10),
          ),
          child: TextFormField(
            focusNode: focusNode,
            controller: controller,
            keyboardType: TextInputType.number,
            maxLength: 1,
            textAlign: TextAlign.start,
            onChanged: onChanged,

            decoration: InputDecoration(
              floatingLabelAlignment: FloatingLabelAlignment.center,
              counterText: " ",
              label: const Text(''),

              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(width: 1),
              ),
              errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
