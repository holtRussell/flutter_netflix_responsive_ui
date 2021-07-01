import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_netflix_responsive_ui/data/data.dart';
import 'package:flutter_netflix_responsive_ui/models/content_model.dart';
import 'package:flutter_netflix_responsive_ui/widgets/video_box.dart';
import 'package:flutter_netflix_responsive_ui/widgets/widgets.dart';

// todo -- Note -- Alt enter has a search function :0

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key key}) : super(key: key);

  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Responsive.isDesktop(context)
          ? SearchScreenDesktop()
          : SingleChildScrollView(child: SearchScreenMobile()),
    );
  }
}

class SearchScreenMobile extends StatefulWidget {
  const SearchScreenMobile({Key key}) : super(key: key);

  @override
  _SearchScreenMobileState createState() => _SearchScreenMobileState();
}

class _SearchScreenMobileState extends State<SearchScreenMobile> {
  bool isActive = false;
  String inputString;
  List<Content> searchResults;
  //List<Content> allTitles;

  void updateSearch() {
    final List<Content> searchResults = allShows.where(
      (content) {
        final titleLowerCase = content.name.toLowerCase();
        return titleLowerCase.contains(inputString);
      },
    ).toList();

    setState(() {
      this.searchResults = searchResults;
    });
  }

  @override
  void initState() {
    inputString = '';
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: width - 50,
            height: 50.0,
            margin: EdgeInsets.symmetric(horizontal: 25.0),
            padding: EdgeInsets.symmetric(
              horizontal: 20.0,
              vertical: 10.0,
            ),
            decoration: BoxDecoration(
              border: Border.all(
                width: 1.0,
                color: isActive ? Colors.white : Colors.white38,
              ),
              borderRadius: BorderRadius.circular(30.0),
            ),
            child: TextField(
              onChanged: (value) => setState(
                () {
                  inputString = value.toLowerCase();
                  updateSearch();
                },
              ),
              style: TextStyle(color: Colors.white),
              decoration: InputDecoration(
                icon: Icon(
                  Icons.search,
                  color: Colors.white,
                  size: 30.0,
                ),
                hintText: 'Search Titles',
                hintStyle: TextStyle(color: Colors.white),
              ),
            ),
          ),
          inputString == '' || searchResults == null
              ? Text('Enter Something Dummy!')
              : Container(
                  height: height - 130.0,
                  width: 500,
                  child: ListView.builder(
                    itemCount: searchResults.length == 1
                        ? 1
                        : searchResults.length % 2 == 0
                            ? (searchResults.length ~/ 2)
                            : (searchResults.length ~/ 2) + 1,
                    itemBuilder: (BuildContext context, int index) => Container(
                      padding: EdgeInsets.symmetric(
                          horizontal: 10.0, vertical: 10.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          VideoBox(
                            content: searchResults[(index) * 2],
                          ),
                          searchResults.length <= index * 2 + 1
                              ? SizedBox(
                                  width: 130.0,
                                )
                              : VideoBox(
                                  content: searchResults[(index * 2 + 1)],
                                ),
                        ],
                      ),
                    ),
                  ),
                ),
        ],
      ),
    );
  }
}

class SearchScreenDesktop extends StatefulWidget {
  const SearchScreenDesktop({Key key}) : super(key: key);

  @override
  _SearchScreenDesktopState createState() => _SearchScreenDesktopState();
}

class _SearchScreenDesktopState extends State<SearchScreenDesktop> {
  bool isActive = false;
  String inputString;
  List<Content> searchResults;
  //List<Content> allTitles;

  void updateSearch() {
    final List<Content> searchResults = allShows.where(
      (content) {
        final titleLowerCase = content.name.toLowerCase();
        return titleLowerCase.contains(inputString);
      },
    ).toList();

    setState(() {
      this.searchResults = searchResults;
    });
  }

  @override
  void initState() {
    inputString = '';
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            height: height,
            width: width / 3,
            child: Column(
              children: [
                SizedBox(
                  height: 30.0,
                ),
                Container(
                  width: width - 50,
                  height: 50.0,
                  margin: EdgeInsets.symmetric(horizontal: 25.0),
                  padding: EdgeInsets.symmetric(
                    horizontal: 20.0,
                    vertical: 10.0,
                  ),
                  decoration: BoxDecoration(
                    border: Border.all(
                      width: 1.0,
                      color: isActive ? Colors.white : Colors.white38,
                    ),
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                  child: TextField(
                    onChanged: (value) => setState(
                      () {
                        inputString = value.toLowerCase();
                        updateSearch();
                      },
                    ),
                    style: TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                      icon: Icon(
                        Icons.search,
                        color: Colors.white,
                        size: 30.0,
                      ),
                      hintText: 'Search Titles',
                      hintStyle: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    child: inputString == '' || searchResults == null
                        ? Text('Enter Something Dummy!')
                        : ListView.builder(
                            itemCount: searchResults.length,
                            itemBuilder: (BuildContext context, int index) {
                              return TextButton(
                                onPressed: () =>
                                    print(searchResults[index].name),
                                child: Text(searchResults[index].name),
                              );
                            }),
                  ),
                ),
              ],
            ),
          ),
          inputString == '' || searchResults == null
              ? Text('Enter Something Dummy!')
              : Container(
                  height: height / 2,
                  width: 2 * width / 3,
                  decoration: BoxDecoration(color: Colors.black26),
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: searchResults.length,
                    itemBuilder: (BuildContext context, int index) =>
                        LimitedBox(
                      maxHeight: height / 2,
                      child: Container(
                        margin: EdgeInsets.only(right: 50.0),
                        child: VideoBox(
                          content: searchResults[(index)],
                        ),
                      ),
                    ),
                  ),
                ),
        ],
      ),
    );
  }
}
