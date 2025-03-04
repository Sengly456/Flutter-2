import 'package:flutter/material.dart';
import 'package:flutter2/theme/theme.dart';
import 'package:flutter2/widgets/actions/bla_button.dart';

class RidePrefInputTile extends StatelessWidget {
  final String title;
  final VoidCallback onPressed;
  final IconData leftIcon;

  // If true the text is displayed lighter
  final bool isPlaceHolder;

  // A right button can be optionally provided
  final IconData? rightIcon;
  final VoidCallback? onRightIconPressed;

  const RidePrefInputTile(
      {super.key,
      required this.title,
      required this.onPressed,
      required this.leftIcon,
      this.rightIcon, //   optional
      this.onRightIconPressed, //   optional
      this.isPlaceHolder = false});

  @override
  Widget build(BuildContext context) {
    Color textColor =
        isPlaceHolder ? BlaColors.textLight : BlaColors.textNormal;

    return ListTile(
      onTap: onPressed,
      title: Text(title,
          style: BlaTextStyles.button.copyWith(fontSize: 14, color: textColor)),
      leading: Icon(
        leftIcon,
        size: BlaSize.icon,
        color: BlaColors.iconLight,
      ),
      trailing: rightIcon != null
          ? BlaButton(
              label: "",
              onPressed: onRightIconPressed ?? () {},
              icon: rightIcon,
            )
          : null,
    );
  }
}
