import 'package:flutter/cupertino.dart';

import '../../screens.dart';

class ProductListRoute<T> extends PageRoute<T>
    with CupertinoRouteTransitionMixin<T> {
  ProductListRoute({
    super.settings,
    this.maintainState = true,
  });

  @override
  Widget buildContent(BuildContext context) {
    return const ProductListScreen();
  }

  @override
  final bool maintainState;

  @override
  String? get title => '';
}
