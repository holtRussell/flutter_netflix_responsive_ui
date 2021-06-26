import 'package:flutter/material.dart';

class VerticalIconButton extends StatelessWidget {
  final IconData iconData;
  final String text;
  final Function onTap;
  const VerticalIconButton({Key key, this.iconData, this.text, this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        child: Center(
          child: Column(
            children: [
              Icon(
                iconData,
                color: Colors.white,
              ),
              Text(
                text,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 15.0,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
