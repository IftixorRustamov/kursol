import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart'; // ✅ Iconly ni uladik

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Row(
        children: [
          Image.asset(
            'assets/icons/logo.png',
            height: 30,
          ),
          const SizedBox(width: 8),
          const Text(
            'My Courses',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ],
      ),
      actions: [
        IconButton(
          icon: const Icon(IconlyLight.search),
          onPressed: () {},
        ),
        IconButton(
          icon: const Icon(IconlyLight.more_circle),
          onPressed: () {},
        ),
        IconButton(
          icon: const Icon(IconlyLight.more_circle),
          onPressed: () {

          },
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
