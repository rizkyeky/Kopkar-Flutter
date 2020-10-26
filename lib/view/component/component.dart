import 'package:flutter/material.dart';

import '../../theme.dart';

part 'xbox.dart';
part 'xbutton.dart';
part 'xdropdown.dart';
part 'xtextfield.dart';

SnackBar snackBar({
  String contentText, String labelText, VoidCallback onPressed
}) => SnackBar(
  content: Text(contentText),
  action: SnackBarAction(
    label: labelText,
    onPressed: onPressed,
  ),
);
