import 'package:flutter/material.dart';

extension SizeExtension on double {
  EdgeInsets get paddingHorizontal => EdgeInsets.symmetric(horizontal: this);
  EdgeInsets get paddingVertical => EdgeInsets.symmetric(vertical: this);
  EdgeInsets get paddingTop => EdgeInsets.only(top: this);
  EdgeInsets get paddingBottom => EdgeInsets.only(bottom: this);
  EdgeInsets get paddingRight => EdgeInsets.only(right: this);
  EdgeInsets get paddingLeft => EdgeInsets.only(left: this);
  EdgeInsets get paddingAll => EdgeInsets.all(this);

  BorderRadius get radiusTopLeft =>
      BorderRadius.only(topLeft: Radius.circular(this));
  BorderRadius get radiusTopRight =>
      BorderRadius.only(topRight: Radius.circular(this));
  BorderRadius get radiusBottomLeft =>
      BorderRadius.only(bottomLeft: Radius.circular(this));
  BorderRadius get radiusBottomRight =>
      BorderRadius.only(bottomRight: Radius.circular(this));
  BorderRadius get radiusAll => BorderRadius.all(Radius.circular(this));

  SizedBox get spaceHorizontal => SizedBox(width: this);
  SizedBox get spaceVertical => SizedBox(height: this);

  Offset get smallY => Offset(0, this);
  Offset get smallX => Offset(this, 0);

}
