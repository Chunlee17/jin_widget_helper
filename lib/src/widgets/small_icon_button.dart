import 'package:flutter/material.dart';
import 'package:jin_widget_helper/jin_widget_helper.dart';

class SmallIconButton extends StatelessWidget {
  final Function onTap;
  final Widget icon;
  final EdgeInsets margin;
  final EdgeInsets padding;
  final Color backgroundColor;
  final double borderRadius;
  final double elevation;

  ///An IconButton with respectively small margin and shape
  const SmallIconButton({
    Key key,
    @required this.onTap,
    @required this.icon,
    this.margin = const EdgeInsets.all(8),
    this.padding = const EdgeInsets.all(8),
    this.borderRadius = 8,
    this.backgroundColor = Colors.transparent,
    this.elevation = 0.0,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final shape = RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(borderRadius));
    return Card(
      shape: shape,
      color: backgroundColor,
      elevation: elevation,
      margin: margin,
      child: InkWell(
        onTap: onTap,
        customBorder: shape,
        child: Padding(
          padding: padding,
          child: icon,
        ),
      ),
    );
  }
}
