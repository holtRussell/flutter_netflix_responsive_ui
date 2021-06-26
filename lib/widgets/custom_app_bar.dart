import 'package:flutter/material.dart';
import 'responsive.dart';
import 'package:flutter_netflix_responsive_ui/assets.dart';

class CustomAppBar extends StatefulWidget {
  // Todo -- Learn THis trick -- ScrollOffset Opacity
  final double scrollOffset;
  const CustomAppBar({Key key, this.scrollOffset}) : super(key: key);

  @override
  _CustomAppBarState createState() => _CustomAppBarState();
}

class _CustomAppBarState extends State<CustomAppBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 24.0, vertical: 6.0),
      decoration: BoxDecoration(
        // Todo -- This is the Opacity Trick
        color: Colors.black.withOpacity(
          (widget.scrollOffset / 350).clamp(0, 1).toDouble(),
        ),
      ),
      child: Responsive.isDesktop(context)
          ? CustomAppBarDesktop()
          : CustomAppBarMobile(),
    );
  }
}

class CustomAppBarMobile extends StatelessWidget {
  const CustomAppBarMobile({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Image(
            image: Responsive.isDesktop(context)
                ? AssetImage(Assets.netflixLogo1)
                : AssetImage(Assets.netflixLogo0),
          ),
          SizedBox(
            width: 30.0,
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _AppBarButton(
                  input: 'TV Shows',
                  onTap: () => print('TV Shows'),
                ),
                _AppBarButton(
                  input: 'Movies',
                  onTap: () => print('Movies'),
                ),
                _AppBarButton(
                  input: 'My List',
                  onTap: () => print('My List'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class CustomAppBarDesktop extends StatelessWidget {
  const CustomAppBarDesktop({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Image(
          image: AssetImage(Assets.netflixLogo1),
        ),
        Expanded(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _AppBarButton(
                input: 'Home',
                onTap: () => print('Home'),
              ),
              _AppBarButton(
                input: 'TV Shows',
                onTap: () => print('TV Shows'),
              ),
              _AppBarButton(
                input: 'Movies',
                onTap: () => print('Movies'),
              ),
              _AppBarButton(
                input: 'Latest',
                onTap: () => print('Latest'),
              ),
              _AppBarButton(
                input: 'My List',
                onTap: () => print('My List'),
              ),
            ],
          ),
        ),
        const Spacer(),
        Expanded(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              IconButton(
                onPressed: () => print('Search'),
                icon: Icon(
                  Icons.search,
                  size: 28.0,
                  color: Colors.white,
                ),
              ),
              _AppBarButton(
                onTap: () => print('Kids'),
                input: 'Kids',
              ),
              _AppBarButton(
                onTap: () => print('DVD'),
                input: 'DVD',
              ),
              IconButton(
                onPressed: () => print('Gift'),
                icon: Icon(
                  Icons.card_giftcard,
                  size: 28.0,
                  color: Colors.white,
                ),
              ),
              IconButton(
                onPressed: () => print('Notifications'),
                icon: Icon(
                  Icons.notifications,
                  size: 28.0,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}

class _AppBarButton extends StatelessWidget {
  String input;
  final Function onTap;
  _AppBarButton({this.input, this.onTap});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onTap,
      child: Text(
        '$input',
        style: TextStyle(
          color: Colors.white,
          fontSize: 16.0,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}

// My Attempt:
//
//
//
// return AppBar(
//   backgroundColor: Color.fromRGBO(255, 255, 255, 0.00),
//   leading: Image(
//     image: AssetImage('${Assets.netflixLogo0}'),
//   ),
//   actions: [
//     TextButton(
//       onPressed: () {
//         print('TV Shows');
//       },
//       child: Text(
//         'TV Shows',
//         style: TextStyle(
//           color: Colors.white,
//           fontSize: 15.0,
//           fontWeight: FontWeight.w600,
//         ),
//       ),
//     ),
//     TextButton(
//       onPressed: () {
//         print('Movies');
//       },
//       child: Text(
//         'Movies',
//         style: TextStyle(
//           color: Colors.white,
//           fontSize: 15.0,
//           fontWeight: FontWeight.w600,
//         ),
//       ),
//     ),
//     TextButton(
//       onPressed: () {
//         print('My List');
//       },
//       child: Text(
//         'My List',
//         style: TextStyle(
//           color: Colors.white,
//           fontSize: 15.0,
//           fontWeight: FontWeight.w600,
//         ),
//       ),
//     ),
//   ],
// );
