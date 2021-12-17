import 'package:flutter/material.dart';
import 'package:minimal_notes/constants.dart';

class RoundedButton extends StatelessWidget {
  final Image icon;
  final void Function()? onTap;

  const RoundedButton({
    Key? key,
    required this.icon,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 50,
      height: 50,
      decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(15)),
          color: roundedButtonColor),
      child: InkWell(
        child: icon,
        onTap: onTap,
      ),
    );
  }
}
