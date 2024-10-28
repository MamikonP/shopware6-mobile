import 'package:flutter/material.dart';

//TODO: hardcoded pagination for now
class PaginationWidget extends StatelessWidget {
  const PaginationWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.keyboard_double_arrow_left_sharp),
        ),
        const Spacer(),
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.keyboard_double_arrow_right_sharp),
        )
      ],
    );
  }
}
