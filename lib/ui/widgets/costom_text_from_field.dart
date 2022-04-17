import 'package:airplane/shared/theme.dart';
import 'package:flutter/material.dart';

class CostomTextFromField extends StatelessWidget {
  final String text;
  final String hintext;
  final bool obscureText;
  final TextEditingController controller;

  const CostomTextFromField({
    Key? key,
    required this.text,
    required this.hintext,
    this.obscureText = false,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      child: Form(
        autovalidateMode: AutovalidateMode.onUserInteraction,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              text,
            ),
            const SizedBox(
              height: 6,
            ),
            TextFormField(
              obscureText: obscureText,
              cursorColor: kPrimeryColor,
              controller: controller,
              decoration: InputDecoration(
                hintText: hintext,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(defaultRadius),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(defaultRadius),
                  borderSide: const BorderSide(color: kPrimeryColor),
                ),
              ),
              validator: (value) {
                if (value != null && value.length < 8) {
                  return 'min 8 carakter';
                } else {
                  return null;
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
