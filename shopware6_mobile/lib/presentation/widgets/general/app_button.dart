import 'package:flutter/material.dart';

import '../../../../core/constants.dart';
import '../../../core/extensions/context_extension.dart';
import '../../../core/extensions/number_extension.dart';
import '../../widgets.dart';

class AppButton extends StatelessWidget {
  const AppButton({
    super.key,
    required this.title,
    this.onTap,
    this.size,
    this.radius = kMedium,
    this.backgroundColor,
    this.foregroundColor,
    this.border,
    this.padding,
    this.busy = false,
    this.leadingIcon,
  });

  final String title;
  final VoidCallback? onTap;
  final Size? size;
  final double radius;
  final Color? backgroundColor;
  final Color? foregroundColor;
  final Border? border;
  final EdgeInsetsGeometry? padding;
  final bool busy;
  final Widget? leadingIcon;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 350),
        width: size?.width,
        height: size?.height,
        alignment: Alignment.center,
        decoration: BoxDecoration(
            color: backgroundColor ?? Colors.transparent,
            borderRadius: BorderRadius.circular(radius),
            border: border),
        padding: padding ?? kLarge.all,
        child: !busy
            ? Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  if (leadingIcon != null) leadingIcon!,
                  kLarge.h,
                  Text(
                    title,
                    style: context.themeOf.subtitle1
                        .copyWith(color: foregroundColor),
                  ),
                ],
              )
            : Column(
                children: <Widget>[
                  BusyIndicator(
                    valueColor: context.themeOf.colorScheme.primary,
                    backgroundColor: context.themeOf.colorScheme.onPrimary,
                  ),
                ],
              ),
      ),
    );
  }
}
