import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NavbarItem extends StatelessWidget {
  const NavbarItem(
      {super.key, required this.icon, this.onPressed, required this.index});
  final IconData icon;
  final void Function()? onPressed;

  final int index;

  @override
  Widget build(BuildContext context) {
    return IconButton(
        onPressed: onPressed,
        icon: Icon(
          icon,
          color: Colors.blueAccent,
        ));
  }
}
