import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart' as intl;

extension Extensions on num? {
  Widget get ws => SizedBox(width: double.tryParse(toString())?.w);

  Widget get hs => SizedBox(height: double.tryParse(toString())?.h);

  String numberFormat() {
    if (this == null) return '0';
    if (this is double && this!.toInt() != this) {
      return intl.NumberFormat('###,##0.00').format(this);
    } else {
      return intl.NumberFormat('###,###').format(this);
      // return toStringAsFixed(3);
    }
  }
}
