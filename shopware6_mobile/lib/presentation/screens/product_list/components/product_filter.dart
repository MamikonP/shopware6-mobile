import 'package:flutter/material.dart';

import '../../../../core/constants.dart';
import '../../../../core/extensions/context_extension.dart';
import '../../../../core/extensions/number_extension.dart';
import '../../../widgets.dart';

class ProductFilter extends StatelessWidget {
  const ProductFilter({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        AppButton(
          title: context.translate.lblFilter,
          leadingIcon: Icon(Icons.filter_list, color: context.themeOf.primary),
          border: Border.all(color: context.themeOf.primary),
          foregroundColor: context.themeOf.primary,
          radius: 0,
        ),
        kLarge.v,
        const PaginationWidget(),
        const OutlineDropDownField(options: [
          'Name A-Z',
          'Name Z-A',
        ], label: '')
      ],
    );
  }
}
