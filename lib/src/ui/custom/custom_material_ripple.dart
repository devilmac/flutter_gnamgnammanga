import 'package:flutter/material.dart';

class MaterialRipple extends StatelessWidget {
  final VoidCallback onPressed;

  const MaterialRipple({Key key, this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      type: MaterialType.transparency,
      child: InkWell(
        onTap: onPressed,
      ),
    );
  }
}
