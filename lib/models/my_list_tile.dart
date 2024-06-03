import 'package:flutter/material.dart';

class MyListTile extends StatelessWidget {
  const MyListTile(
      {super.key, required this.text, required this.icon, required this.onTap});
  final String text;
  final IconData icon;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 18),
      child: ListTile(
        leading: Icon(
          icon,
          color: Colors.grey[300],
        ),
        title: Text(text,style: TextStyle(color: Colors.grey[300])),
        onTap: onTap,
      ),
    );
  }
}