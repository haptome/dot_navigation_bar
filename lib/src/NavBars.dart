import 'package:dot_navigation_bar/src/body.dart';
import 'package:flutter/material.dart';

import 'DotNavigationBarItem.dart';

class DotNavigationBar extends StatelessWidget {
  const DotNavigationBar({
    super.key,
    required this.items,
    this.currentIndex = 0,
    this.onTap,
    this.selectedItemColor,
    this.unselectedItemColor,
    this.margin = const EdgeInsets.all(8),
    this.itemPadding = const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
    this.duration = const Duration(milliseconds: 500),
    this.curve = Curves.easeOutQuint,
    this.dotIndicatorColor,
    this.marginR,
    this.paddingR,
    this.borderRadius = 30,
    this.splashBorderRadius,
    this.backgroundColor = Colors.white,
    this.boxShadow = const [
      BoxShadow(
        color: Colors.transparent,
        spreadRadius: 0,
        blurRadius: 0,
        offset: Offset(0, 0), // changes position of shadow
      ),
    ],
    this.enableFloatingNavBar = true,
    this.enablePaddingAnimation = true,
    this.splashColor,
  });

  /// A list of tabs to display, ie `Home`, `Profile`,`Cart`, etc
  final List<DotNavigationBarItem> items;

  /// The tab to display.
  final int currentIndex;

  /// Returns the index of the tab that was tapped.
  final Function(int)? onTap;

  /// The color of the icon and text when the item is selected.
  final Color? selectedItemColor;

  /// The color of the icon and text when the item is not selected.
  final Color? unselectedItemColor;

  /// A convenience field for the margin surrounding the entire widget.
  final EdgeInsets margin;

  /// The padding of each item.
  final EdgeInsets itemPadding;

  /// The transition duration
  final Duration duration;

  /// The transition curve
  final Curve curve;

  /// The color of the Dot indicator.
  final Color? dotIndicatorColor;

  /// margin for the bar to give some radius
  final EdgeInsetsGeometry? marginR;

  /// padding for the bar to give some radius
  final EdgeInsetsGeometry? paddingR;

  /// border radius
  final double? borderRadius;

  ///bgd colors for the nav bar
  final Color? backgroundColor;

  /// List of box shadow
  final List<BoxShadow> boxShadow;
  final bool enableFloatingNavBar;
  final bool enablePaddingAnimation;

  /// Color of the item's Splash Color
  ///
  /// To disable, use `Colors.transparent`
  final Color? splashColor;

  /// Color of the item's Splash Color
  ///
  /// To disable, use `Colors.transparent`
  final double? splashBorderRadius;
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return enableFloatingNavBar
        ? BottomAppBar(
            color: Colors.transparent,
            elevation: 0,
            child: Padding(
              padding: marginR ?? EdgeInsets.zero,
              child: Container(
                padding: paddingR ?? EdgeInsets.zero,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(borderRadius!),
                  color: backgroundColor,
                  boxShadow: boxShadow,
                ),
                width: double.infinity,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: Body(
                    items: items,
                    currentIndex: currentIndex,
                    curve: curve,
                    duration: duration,
                    selectedItemColor: selectedItemColor,
                    theme: theme,
                    unselectedItemColor: unselectedItemColor,
                    onTap: onTap!,
                    itemPadding: itemPadding,
                    dotIndicatorColor: dotIndicatorColor,
                    enablePaddingAnimation: enablePaddingAnimation,
                    splashColor: splashColor,
                    splashBorderRadius: splashBorderRadius,
                  ),
                ),
              ),
            ),
          )
        : Container(
            padding: EdgeInsets.symmetric(vertical: 16),
            color: backgroundColor,
            child: Padding(
              padding: margin,
              child: Body(
                  items: items,
                  currentIndex: currentIndex,
                  curve: curve,
                  duration: duration,
                  selectedItemColor: selectedItemColor,
                  theme: theme,
                  unselectedItemColor: unselectedItemColor,
                  onTap: onTap!,
                  itemPadding: itemPadding,
                  dotIndicatorColor: dotIndicatorColor,
                  enablePaddingAnimation: enablePaddingAnimation,
                  splashColor: splashColor,
                  splashBorderRadius: splashBorderRadius),
            ),
          );
  }
}
