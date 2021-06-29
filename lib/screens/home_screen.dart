import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_netflix_responsive_ui/assets.dart';
import 'package:flutter_netflix_responsive_ui/cubits/cubits.dart';
import 'package:flutter_netflix_responsive_ui/data/data.dart';
import 'package:flutter_netflix_responsive_ui/widgets/widgets.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // We don't need this because of Cubits
  // double _scrollOffset = 0.0;
  ScrollController _scrollController;

  @override
  void initState() {
    // TODO: Manages Scroll % for CustomAppBar Opacity
    _scrollController = ScrollController()
      ..addListener(() {
        context.bloc<AppBarCubit>().setOffset(_scrollController.offset);
        // Removed setState because Cubit manages state
        // setState(() {
        //   _scrollOffset = _scrollController.offset;
        // });
      });

    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // todo -- Look into MediaQuery for scalability
    final Size screenSize = MediaQuery.of(context).size;

    return Scaffold(
      extendBodyBehindAppBar: true,
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.cast),
        backgroundColor: Colors.grey[850],
        onPressed: () {
          print('Cast');
        },
      ),
      // todo -- Look into PreferredSize Function
      appBar: Responsive.isDesktop(context)
          ? null
          : PreferredSize(
              preferredSize: Size(screenSize.width, 50.0),
              // todo -- CustomAppBar, Not AppBar
              child: BlocBuilder<AppBarCubit, double>(
                builder: (context, scrollOffset) {
                  return CustomAppBar(
                    scrollOffset: scrollOffset,
                  );
                },
              ),
            ),
      body: CustomScrollView(
        controller: _scrollController,
        slivers: [
          SliverToBoxAdapter(
            child: ContentHeader(featuredContent: sintelContent),
          ),
          SliverToBoxAdapter(
            child: Previews(title: 'Previews', contentList: previews),
          ),
          SliverToBoxAdapter(
            child: ContentList(
              title: 'My List',
              contentList: myList,
            ),
          ),
          SliverToBoxAdapter(
            child: ContentList(
              title: 'Netflix Originals',
              contentList: originals,
              isOriginals: true,
            ),
          ),
          SliverPadding(
            padding: EdgeInsets.only(bottom: 20.0),
            sliver: SliverToBoxAdapter(
              child: ContentList(
                title: 'Trending',
                contentList: trending,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
