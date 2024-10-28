import 'package:flutter/material.dart';

class ProductHeaderMenu extends StatelessWidget {
  const ProductHeaderMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.menu),
        ),
        const Spacer(),
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.search),
        ),
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.favorite_border),
        ),
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.person_2_outlined),
        ),
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.shopping_bag_outlined),
        ),
      ],
    );
  }
}
