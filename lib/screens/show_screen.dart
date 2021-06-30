import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_netflix_responsive_ui/cubits/cubits.dart';
import 'package:flutter_netflix_responsive_ui/models/content_model.dart';
import 'package:flutter_netflix_responsive_ui/widgets/custom_app_bar.dart';
import 'package:flutter_netflix_responsive_ui/widgets/widgets.dart';

class ShowScreen extends StatefulWidget {
  final Content content;
  const ShowScreen({Key key, @required this.content}) : super(key: key);

  @override
  _ShowScreenState createState() => _ShowScreenState();
}

class _ShowScreenState extends State<ShowScreen> {
  ScrollController _scrollController;

  @override
  void initState() {
    _scrollController = ScrollController()
      ..addListener(() {
        context.bloc<AppBarCubit>().setOffset(_scrollController.offset);
      });

    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    bool isFavorite = false;

    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage(widget.content.imageUrl),
              ),
            ),
          ),
          ListView(
            physics: Responsive.isDesktop(context)
                ? NeverScrollableScrollPhysics()
                : null,
            children: [
              SizedBox(
                height: height / 2,
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    stops: [
                      0.00,
                      0.15,
                      0.50,
                    ],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Colors.transparent,
                      Colors.black.withOpacity(.50),
                      Colors.black
                    ],
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                        width: 250.0,
                        height: 100.0,
                        child: Image.asset(widget.content.titleImageUrl)),
                    SizedBox(
                      width: width - 50,
                      child: Text(
                        widget.content.description,
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            color: Colors.white,
                            height: 1.3,
                            fontSize: 16.0,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        VerticalIconButton(
                          iconData: Icons.add,
                          text: 'Add',
                          onTap: () => print('Add'),
                        ),
                        PlayButton(
                          text: widget.content.isMovie
                              ? 'Play Movie'
                              : 'Play Trailer',
                          onTap: () => print('Play'),
                        ),
                        VerticalIconButton(
                          iconData: isFavorite
                              ? Icons.favorite
                              : Icons.favorite_border,
                          text: 'Add',
                          onTap: () => setState(() {
                            isFavorite = !isFavorite;
                          }),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 30.0,
                    ),
                    widget.content.isMovie
                        ? Text(
                            'Previews',
                            style: TextStyle(
                              fontSize: 22.0,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 1.2,
                            ),
                          )
                        : Text(
                            'Episodes',
                            style: TextStyle(
                              fontSize: 22.0,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 1.2,
                            ),
                          ),
                    SizedBox(
                      height: 20.0,
                    ),
                    Container(
                      height: Responsive.isMobile(context) ? 100 : 300,
                      width: width,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: widget.content.previews.length,
                        itemBuilder: (BuildContext context, int index) =>
                            Container(
                          margin: EdgeInsets.only(
                            right: 20.0,
                          ),
                          width: Responsive.isMobile(context) ? 150 : 400,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15.0),
                            border: Border.all(
                              color: Colors.redAccent,
                              width: 2.0,
                            ),
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image: AssetImage(
                                widget.content.previews[index],
                              ),
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
