import 'package:flutter/material.dart';
import 'package:flutter_netflix_responsive_ui/models/models.dart';

class Previews extends StatelessWidget {
  final String title;
  final List<Content> contentList;

  const Previews({
    Key key,
    this.title,
    this.contentList,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Text(
            title,
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 20.0,
            ),
          ),
        ),
        Container(
          height: 165.0,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: contentList.length,
            itemBuilder: (BuildContext context, int index) {
              final Content content = contentList[index];
              return GestureDetector(
                onTap: () => print(content.name),
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Container(
                      margin: const EdgeInsets.symmetric(horizontal: 16.0),
                      height: 130.0,
                      width: 130.0,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage(content.imageUrl),
                            fit: BoxFit.cover),
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: content.color,
                          width: 4.0,
                        ),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(horizontal: 16.0),
                      height: 130.0,
                      width: 130.0,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            Colors.black87,
                            Colors.black45,
                            Colors.transparent
                          ],
                          stops: [0, 0.25, 1],
                          begin: Alignment.bottomCenter,
                          end: Alignment.topCenter,
                        ),
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: content.color,
                          width: 4.0,
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 0.0,
                      left: 0.0,
                      right: 0.0,
                      child: SizedBox(
                        height: 60.0,
                        child: Image(
                          image: AssetImage(content.titleImageUrl),
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
