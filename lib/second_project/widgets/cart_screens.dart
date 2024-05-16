import 'package:building/second_project/components/colors.dart';
import 'package:flutter/material.dart';

class ListViewButtonForFavoriteScreen extends StatelessWidget {
  const ListViewButtonForFavoriteScreen({
    super.key,
    required this.title,
    required this.subtitle,
    required this.leading,
    required this.onTap,
  });
  final String title;
  final String subtitle;
  final Widget leading;
  final Function() onTap;
  @override
  Widget build(BuildContext context) {
    return ListTile(
        contentPadding: EdgeInsets.symmetric(
            vertical: size(context).width * 0.03,
            horizontal: size(context).height * 0.03),
        leading: leading,
        title: Text(title),
        subtitle: Text(subtitle),
        titleTextStyle: const TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 24,
          color: minorColor,
        ),
        subtitleTextStyle: const TextStyle(
          fontSize: 18,
          color: minorColor,
        ),
        tileColor: mainColor,
        shape: RoundedRectangleBorder(
          side: const BorderSide(width: 2),
        ),
        visualDensity: VisualDensity.comfortable,
        onTap: onTap);
  }
}
