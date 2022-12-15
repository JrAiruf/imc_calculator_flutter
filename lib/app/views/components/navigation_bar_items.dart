import 'package:flutter/material.dart';

import 'navigation_bar_enum.dart';

class NavigationBarItems extends StatelessWidget {
  const NavigationBarItems(
      {super.key,
      this.navigate,
      required this.position,
      @required this.title,
      @required this.icon,
      this.primaryColor,
      this.color});

  final void Function()? navigate;
  final NavigationBarPosition? position;
  final String? title;
  final IconData? icon;
  final Color? primaryColor;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: navigate,
      child: Container(
        decoration: BoxDecoration(color: primaryColor ?? Colors.purple),
        child: Column(
          children: [
            Icon(
              icon ?? Icons.add,
              color: color ?? Colors.white,
            ),
            Text(
              title!,
              style: TextStyle(
                color: color ?? Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
