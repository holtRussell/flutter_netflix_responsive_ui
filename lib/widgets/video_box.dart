import 'package:flutter/material.dart';
import 'package:flutter_netflix_responsive_ui/models/content_model.dart';
import 'package:flutter_netflix_responsive_ui/widgets/responsive.dart';

class VideoBox extends StatelessWidget {
  final Content content;
  const VideoBox({Key key, @required this.content}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Responsive.isDesktop(context) ? 500 : 200,
      width: Responsive.isDesktop(context) ? 350 : 130,
      decoration: BoxDecoration(
        image: DecorationImage(
            image: AssetImage(content.imageUrl), fit: BoxFit.cover),
      ),
    );
  }
}
