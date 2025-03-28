import 'package:flutter/material.dart';

class AppTextField extends StatelessWidget {
  const AppTextField({super.key, required this.onChanged});
  final Function(String) onChanged;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Color(0XFF424242),
        borderRadius: BorderRadius.circular(10),
      ),
      child: TextFormField(
        autofocus: true,
        cursorColor: Colors.green,
        style: TextStyle(color: Colors.white),
        decoration: InputDecoration(
          contentPadding: EdgeInsets.only(left: 10, top: 05, bottom: 05),
          border: InputBorder.none,
          hintText: 'New To-Do',
          hintStyle: TextStyle(color: Color(0XFF9E9E9E)),
        ),
        onChanged: onChanged,
      ),
    );
  }
}
