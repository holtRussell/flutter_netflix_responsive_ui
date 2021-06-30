import 'package:flutter/material.dart';
import 'package:flutter_netflix_responsive_ui/widgets/responsive.dart';

class PlayButton extends StatelessWidget {
  final IconData iconData;
  final String text;
  final Function onTap;
  const PlayButton({Key key, this.iconData, this.text, this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    // todo: Could have also used TextButton - Probably Easier :P

    return FlatButton.icon(
      onPressed: onTap,
      padding: !Responsive.isDesktop(context)
          ? const EdgeInsets.fromLTRB(15.0, 5.0, 20.0, 5.0)
          : const EdgeInsets.fromLTRB(25.0, 10.0, 30.0, 10.0),
      icon: Icon(
        Icons.play_arrow,
        size: 30.0,
      ),
      color: Colors.white,
      label: Text(
        text,
        style: TextStyle(
          fontSize: 16.0,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}

// return GestureDetector(
//   onTap: onTap,
//   child: Container(
//     height: 35.0,
//     width: 90.0,
//     padding: EdgeInsets.symmetric(horizontal: 3.0, vertical: 2.0),
//     child: Row(
//       mainAxisAlignment: MainAxisAlignment.center,
//       children: [
//         Icon(Icons.play_arrow),
//         SizedBox(
//           width: 5.0,
//         ),
//         Text(
//           'Play',
//           style: TextStyle(fontWeight: FontWeight.bold),
//         ),
//       ],
//     ),
//     decoration: BoxDecoration(
//       color: Colors.white,
//       borderRadius: BorderRadius.circular(4.0),
//     ),
//   ),
// );
