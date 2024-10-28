import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
          ProductBloc(productRepository: RepositoryProvider.of(context))..add(ProductListFetched()),
      child: const ProductListScreen(),
    );
  }

  @override
  final bool maintainState;

  @override
  String? get title => '';
}
