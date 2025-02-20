import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_netflix_responsive_ui/cubits/app_bar/app_bar_cubit.dart';
import 'package:flutter_netflix_responsive_ui/data/data.dart';
import 'package:flutter_netflix_responsive_ui/screens/screens.dart';
import 'package:flutter_netflix_responsive_ui/widgets/widgets.dart';

class NavScreen extends StatefulWidget {
  const NavScreen({Key key}) : super(key: key);

  @override
  _NavScreenState createState() => _NavScreenState();
}

class _NavScreenState extends State<NavScreen> {
  final List<Widget> _screens = [
    HomeScreen(
      // todo -- Research Keys to maintain state of page

      key: PageStorageKey('homeScreen'),
    ),
    SearchScreen(),
    ShowScreen(
      content: allShows[1],
    ),
    PlayVideoScreen(
      videoURL: allShows[0].videoUrl,
    ),
    Scaffold(),
  ];

  final Map<String, IconData> _icons = const {
    'Home': Icons.home,
    'Search': Icons.search,
    'Featured': Icons.queue_play_next,
    'Downloads': Icons.file_download,
    'More': Icons.menu,
  };

  int currentIndex = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: Responsive.isDesktop(context)
          ? PreferredSize(
              preferredSize: Size(width, 50.0),
              // todo -- CustomAppBar, Not AppBar
              child: CustomAppBar(
                scrollOffset: 0,
                onPressed: (value) {
                  //print('Did it :)');
                  setState(() => currentIndex = value);
                },
              ))
          : null,
      body: BlocProvider<AppBarCubit>(
        // todo -- Note -- (_) makes passed context private
        // todo -- b/c it won't be used

        create: (_) => AppBarCubit(),
        child: _screens[currentIndex],
      ),
      bottomNavigationBar: Responsive.isDesktop(context)
          ? null
          : BottomNavigationBar(
              backgroundColor: Colors.black,
              type: BottomNavigationBarType.fixed,
              items: _icons
                  .map(
                    (title, icon) => MapEntry(
                      title,
                      BottomNavigationBarItem(
                        icon: Icon(
                          icon,
                          size: 30.0,
                        ),
                        title: Text(title),
                      ),
                    ),
                  )
                  .values
                  .toList(),
              currentIndex: currentIndex,
              selectedItemColor: Colors.white,
              selectedFontSize: 11.0,
              unselectedItemColor: Colors.grey,
              unselectedFontSize: 11.0,
              onTap: (index) => setState(() => currentIndex = index),
            ),
    );
  }
}
