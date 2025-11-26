import 'package:flutter/material.dart';

extension SizeExtension on num {
  Widget get spaceVertical => SizedBox(height: toDouble());
  Widget get spaceHorizontal => SizedBox(width: toDouble());
}
