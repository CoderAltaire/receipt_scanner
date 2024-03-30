import 'package:flutter/material.dart';

// ignore: must_be_immutable
class DefaultButton extends StatelessWidget {
  DefaultButton({
    super.key,
    this.height = 7.55,
    required this.text,
    required this.isButtonEnabled,
    this.onPress,
    this.isErrorButton = false,
  });
  double height;
  final String text;
  final bool isButtonEnabled;
  final VoidCallback? onPress;
  final bool isErrorButton;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      focusNode: FocusNode(skipTraversal: true),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      color: isErrorButton
          ? Theme.of(context).errorColor
          : Theme.of(context).primaryColor,
      disabledColor: isErrorButton
          ? Theme.of(context).errorColor.withOpacity(.5)
          : Theme.of(context).primaryColor.withOpacity(.5),
      minWidth: double.infinity,
      height: 50,
      onPressed: isButtonEnabled ? onPress : null,
      textColor: Colors.white,
      disabledTextColor: Colors.white.withOpacity(.8),
      child: Text(
        text,
        textAlign: TextAlign.center,
      ),
    );
  }
}
