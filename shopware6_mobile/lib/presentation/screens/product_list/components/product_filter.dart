import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/constants.dart';
import '../../../../core/constants/enums/product_filter.dart';
import '../../../../core/extensions/context_extension.dart';
import '../../../../core/extensions/number_extension.dart';
import '../../../../core/main_repository_provider.dart';
import '../../../../domain/entities/product/product_param_entity.dart';
import '../../../logic/product/product_bloc.dart';
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
        // const PaginationWidget(),
        OutlineDropDownField(
          options: ProductFilterCategory.values
              .map(
                (e) => e.title,
              )
              .toList(),
          onChanged: (value) {
            final filterBy = ProductFilterCategory.fromTitle(value ?? '');
            context.read<ProductBloc>().add(ProductListFetched(
                  entity: ProductParamEntity(page: 1, limit: 100, sort: [
                    SortParamEntity(
                        field: filterBy.field, order: filterBy.value),
                  ]),
                ));
          },
        ),
      ],
    );
  }
}
