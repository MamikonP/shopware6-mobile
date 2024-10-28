import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/constants.dart';
import '../../../core/extensions/context_extension.dart';
import '../../../core/extensions/number_extension.dart';
import '../../logic/product/product_bloc.dart';
import 'components/product_filter.dart';
import 'components/product_header_menu.dart';
import 'components/product_item.dart';

class ProductListScreen extends StatelessWidget {
  const ProductListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: kLarge.horizontal,
        child: BlocConsumer<ProductBloc, ProductState>(
          listener: (context, state) {
            if (state is ProductListFail) {
              context.showErrorSnackbar(state.error ?? '');
            }
          },
          builder: (context, state) {
            return CustomScrollView(
              slivers: [
                SliverAppBar(
                  title: Text(
                    context.translate.lblDemoStore,
                    style: context.themeOf.title1,
                  ),
                ),
                const SliverToBoxAdapter(
                  child: ProductHeaderMenu(),
                ),
                const SliverToBoxAdapter(
                  child: ProductFilter(),
                ),
                SliverList(
                  delegate: SliverChildBuilderDelegate(
                    (context, index) => Padding(
                      padding: kLarge.vertical,
                      child: ProductItem(product: state.products[index]),
                    ),
                    childCount: state.products.length,
                  ),
                )
              ],
            );
          },
        ),
      ),
    );
  }
}
