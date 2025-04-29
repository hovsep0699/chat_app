import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../core/themes/app_colors.dart';
import '../../../resources/assets/assets.gen.dart';

class SimpleAppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  const SimpleAppBarWidget({
    super.key,
    this.showBackButton = false,
    this.actions,
    this.leadingIcon,
    this.onTrailingPress,
    this.contentPadding,
    this.toolBarHeight = kToolbarHeight,
    this.onLeadingPress,
    this.title,
  });

  final EdgeInsets? contentPadding;
  final bool showBackButton;
  final Widget? leadingIcon;
  final double toolBarHeight;
  final void Function(BuildContext)? onLeadingPress;
  final VoidCallback? onTrailingPress;
  final Widget? title;
  final List<Widget>? actions;

  @override
  Widget build(BuildContext context) {
    return AppBar(
        systemOverlayStyle: SystemUiOverlayStyle.light,
        surfaceTintColor: white,
        centerTitle: true,
        actions: actions ??
            [
              IconButton(
                onPressed: onTrailingPress,
                icon: Icon(
                  Icons.logout,
                  color: ColorScheme.of(context).primary,
                ),
              ),
            ],
        title: title,
        leading: showBackButton
            ? const AutoLeadingButton()
            : Builder(
                builder: (context) => IconButton(
                  onPressed: () => onLeadingPress?.call(context),
                  icon: leadingIcon != null
                      ? leadingIcon!
                      : Assets.icons.menu.svg(
                          colorFilter:
                              ColorFilter.mode(ColorScheme.of(context).primary, BlendMode.srcIn)),
                ),
              ));
  }

  @override
  Size get preferredSize => Size.fromHeight(toolBarHeight);
}
