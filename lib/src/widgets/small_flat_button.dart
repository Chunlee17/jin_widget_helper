import 'package:flutter/material.dart';

import '../../jin_widget_helper.dart';

class SmallFlatButton extends StatelessWidget {
  final Function onTap;
  final Widget child;
  final EdgeInsets margin;
  final EdgeInsets padding;
  final Color backgroundColor;
  final double borderRadius;
  final double elevation;
  final Color textColor;
  final Widget icon;
  final BorderSide borderSide;

  ///A FlatButton with respectively small margin and shape
  const SmallFlatButton({
    Key key,
    @required this.onTap,
    @required this.child,
    this.margin = const EdgeInsets.all(0),
    this.padding = const EdgeInsets.all(8),
    this.borderRadius = 8,
    this.backgroundColor = Colors.transparent,
    this.elevation = 0.0,
    this.textColor = Colors.black,
    this.icon,
    this.borderSide,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final shape = RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(borderRadius),
      side: borderSide ?? BorderSide.none,
    );
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
          child: DefaultTextStyle.merge(
            style:
                Theme.of(context).textTheme.button.copyWith(color: textColor),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                if (icon != null) ...[icon, SpaceX(8)],
                child,
              ],
            ),
          ),
        ),
      ),
    );
  }
}
