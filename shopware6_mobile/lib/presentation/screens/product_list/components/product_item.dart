import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../../core/constants/gaps.dart';
import '../../../../core/constants/ui_constants.dart';
import '../../../../core/extensions/context_extension.dart';
import '../../../../core/extensions/number_extension.dart';
import '../../../widgets.dart';

class ProductItem extends StatelessWidget {
  const ProductItem({super.key});

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
              imageUrl: '',
              fit: BoxFit.cover,
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
            Text(
              'title',
              style: context.themeOf.title2,
            ),
            Text(
              'data',
              style: context.themeOf.bodyText1,
            ),
            Text(
              'price',
              style: context.themeOf.subtitle1,
            ),
            AppButton(
              title: context.translate.lblDetails,
              backgroundColor: context.themeOf.secondary.withOpacity(0.1),
              radius: 0,
              foregroundColor: context.themeOf.greyScaleLight100,
            )
          ],
        ),
      ),
    );
  }
}
