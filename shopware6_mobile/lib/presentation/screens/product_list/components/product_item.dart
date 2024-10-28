import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../../core/constants/gaps.dart';
import '../../../../core/constants/ui_constants.dart';
import '../../../../core/extensions/context_extension.dart';
import '../../../../core/extensions/number_extension.dart';
import '../../../../domain/entities/product/product_entity.dart';
import '../../../widgets.dart';

class ProductItem extends StatelessWidget {
  const ProductItem({super.key, this.product});

  final ProductEntity? product;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        border: Border.all(color: context.themeOf.primary),
      ),
      child: Padding(
        padding: kLarge.all,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            CachedNetworkImage(
              imageUrl: product?.cover?.media?.url ?? '',
              fit: BoxFit.contain,
              height: kProductImageHeight,
              width: MediaQuery.sizeOf(context).width,
              errorWidget: (context, url, error) => Icon(
                Icons.image,
                color: context.themeOf.colorScheme.primary,
              ),
              progressIndicatorBuilder: (
                BuildContext context,
                String url,
                DownloadProgress progress,
              ) =>
                  Center(
                child: BusyIndicator(
                  value: progress.progress,
                  valueColor: context.themeOf.colorScheme.onPrimary,
                  backgroundColor: context.themeOf.colorScheme.primary,
                ),
              ),
            ),
            kLarger.v,
            Text(
              product?.translated?.name ?? '',
              style: context.themeOf.title2,
            ),
            kLarge.v,
            Text(
              product?.translated?.description ?? '',
              style: context.themeOf.bodyText1,
              overflow: TextOverflow.ellipsis,
              maxLines: 3,
            ),
            kLarge.v,
            Text(
              '€${product?.calculatedPrice?.totalPrice?.toString() ?? ''}',
              style: context.themeOf.subtitle1,
            ),
            kLarge.v,
            AppButton(
              title: context.translate.btnAddToShoppingCart,
              backgroundColor: context.themeOf.primary,
              radius: 0,
              foregroundColor: context.themeOf.greyScaleLight,
            )
          ],
        ),
      ),
    );
  }
}
