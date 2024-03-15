import 'package:flutter/material.dart';

abstract class AppPadding {
  static const EdgeInsetsGeometry zero = EdgeInsets.zero;
  static const EdgeInsetsGeometry tiny = EdgeInsets.all(2);
  static const EdgeInsetsGeometry small = EdgeInsets.all(4);
  static const EdgeInsetsGeometry def = EdgeInsets.all(8);
  static const EdgeInsetsGeometry smallImage = small;
  static const EdgeInsetsGeometry largeImage = EdgeInsets.all(15);
  static const EdgeInsetsGeometry smallHorizontal = EdgeInsets.symmetric(horizontal: 6);
  static const EdgeInsetsGeometry smallVertical = EdgeInsets.symmetric(vertical: 6);
  static const EdgeInsetsGeometry choiceChipPadding = EdgeInsets.symmetric(horizontal: 20, vertical: 8);
  static const EdgeInsetsGeometry appBarLeadingPadding = EdgeInsetsDirectional.only(start: 12);
  static const EdgeInsetsGeometry appBarActionsPadding = EdgeInsetsDirectional.only(end: 12);
  static const EdgeInsetsGeometry pagePadding = EdgeInsets.all(24);
  static const EdgeInsetsGeometry pagePaddingVertical = EdgeInsets.only(left: 24, right: 24);
  static const EdgeInsetsGeometry pagePaddingHorizontal = EdgeInsets.symmetric(vertical: 2, horizontal: 24);
  static const EdgeInsetsGeometry listViewPadding = EdgeInsets.symmetric(vertical: 12, horizontal: 24);
  static const EdgeInsetsGeometry gridViewPadding = EdgeInsets.symmetric(vertical: 6, horizontal: 24);
  static const EdgeInsetsGeometry bottomSheetPadding = EdgeInsets.symmetric(vertical: 0, horizontal: 25);
  static const EdgeInsetsGeometry bottomContainerPadding = EdgeInsets.symmetric(vertical: 16, horizontal: 24);
  static const EdgeInsetsGeometry horizontalCardPadding = EdgeInsets.symmetric(horizontal: 10);
  static const EdgeInsetsGeometry notificationPadding = EdgeInsets.all(10);
  static const EdgeInsetsGeometry dialogPadding = EdgeInsets.all(30.0);
  static const EdgeInsetsGeometry dialogButtonPadding = EdgeInsets.symmetric(horizontal: 10.0);
  static const EdgeInsetsGeometry cardPadding = EdgeInsets.only(right: 20.0, left: 10);
  static const EdgeInsetsGeometry innerCardPadding = EdgeInsets.symmetric(horizontal: 12, vertical: 12);
  static const EdgeInsetsGeometry innerCardPaddingHorizontal = EdgeInsets.symmetric(horizontal: 18, vertical: 0);
  static const EdgeInsetsGeometry tapBarPadding = EdgeInsets.symmetric(horizontal: 10, vertical: 6);
  static const EdgeInsetsGeometry outerDialogPadding = EdgeInsets.all(50.0);
  static const EdgeInsetsGeometry buttonPadding = EdgeInsets.all(10);
}
