import 'package:flutter/material.dart';

class BuildAppBar extends StatelessWidget {
  const BuildAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      snap: false,
      pinned: false,
      title: const Text('To-Dos', style: TextStyle(color: Colors.white)),
      backgroundColor: Color(0XFF212121),
      centerTitle: false,
      floating: true,
      // s
    );
  }
}
