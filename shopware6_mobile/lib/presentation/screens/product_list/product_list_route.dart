import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/constants/enums/product_filter.dart';
import '../../../domain/entities/product/product_param_entity.dart';
import '../../logic/product/product_bloc.dart';
import '../../screens.dart';

class ProductListRoute<T> extends PageRoute<T>
    with CupertinoRouteTransitionMixin<T> {
  ProductListRoute({
    super.settings,
    this.maintainState = true,
  });

  @override
  Widget buildContent(BuildContext context) {
    return BlocProvider<ProductBloc>(
      create: (context) =>
          ProductBloc(productRepository: RepositoryProvider.of(context))
            ..add(
              ProductListFetched(
                entity: ProductParamEntity(page: 1, limit: 100, sort: [
                  SortParamEntity(
                    field: 'name',
                    order: ProductFilterCategory.nameAsc.value,
                  ),
                ]),
              ),
            ),
      child: const ProductListScreen(),
    );
  }

  @override
  final bool maintainState;

  @override
  String? get title => '';
}
