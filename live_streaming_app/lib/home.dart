import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:podoriginals/partials/cards.dart';
import 'package:podoriginals/partials/data.dart';
import 'package:podoriginals/partials/data.dart';
import 'package:podoriginals/partials/movie_api.dart';
import 'package:podoriginals/single.dart';
import 'package:podoriginals/watchlist.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:flutter/cupertino.dart';
import 'partials/section.dart';
import 'partials/data.dart';
import 'partials/hero.dart';
import 'settings.dart';
import 'search.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  double _panelHeightOpen = 575.0;
  double _panelHeightClosed = 65.0;

  var currentPage = images;

  @override
  void initState() {
    super.initState();
  }

  @override
  build(BuildContext context) {
    print(MediaQuery.of(context).size.width);
    // PageController controller = PageController(initialPage: images.length - 1);
    // controller.addListener(() {
    //   setState(() {
    //     currentPage = controller.page;
    //   });
    // });
    return Scaffold(
      body: Stack(
        children: [
          Container(
            color: CupertinoColors.darkBackgroundGray,
            child: ListView(
              physics: ClampingScrollPhysics(),
              children: [
                // HeroSection(),
                Container(
                  child: Column(
                    children: [
                      Container(
                        child: Column(
                          children: [
                            Container(
                              padding: EdgeInsets.all(10),
                              child: Row(
                                children: [
                                  Container(
                                    width: 10,
                                    height: 10,
                                    decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: Colors.red),
                                  ),
                                  SizedBox(
                                    width: 8,
                                  ),
                                  Text(
                                    ' Live ',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontFamily: 'poppins-regular',
                                      fontSize: 16,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Stack(
                              children: [
                                // CardScrollWidget(currentPage),
                                CarouselSlider.builder(
                                  itemCount: 5,
                                  options: CarouselOptions(
                                    // enableInfiniteScroll: true,
                                    autoPlayCurve: Curves.fastOutSlowIn,
                                    autoPlay: true,
                                    aspectRatio: 16 / 10,
                                    autoPlayAnimationDuration:
                                        Duration(milliseconds: 800),
                                    viewportFraction: 1.0,
                                  ),
                                  itemBuilder: (context, index, realIdx) {
                                    return InkWell(
                                      onTap: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (index) =>
                                                    Single(testMovie)));
                                      },
                                      child: Container(
                                        margin: EdgeInsets.all(5),
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(12),
                                          image: DecorationImage(
                                            image: NetworkImage(
                                                'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTqLdc0I7fPsbda8oR1Ju8HlNIL7TILrgnltw&usqp=CAU'
                                                // ApiConstant.media_base_url+sliderController.items[index].image.toString()
                                                ),
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                    );
                                  },
                                ),
                                // Positioned.fill(
                                //   child: PageView.builder(
                                //     itemCount: images.length,
                                //     controller: controller,
                                //     reverse: true,
                                //     itemBuilder: (context, index) {
                                //       return InkWell(
                                //         onTap: () {
                                //           Navigator.push(
                                //               context,
                                //               MaterialPageRoute(
                                //                   builder: (index) =>
                                //                       Single(testMovie)));
                                //         },
                                //         child: Container(),
                                //       );
                                //     },
                                //   ),
                                // )
                              ],
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 25,
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Section(data[1]["name"], data[1]["images"]),
                BigMovieCard('assets/6.png'),
                SizedBox(
                  height: 20,
                ),
                Section(data[2]["name"], data[2]["images"]),
                Section(data[3]["name"], data[3]["images"]),
                BigMovieCard('assets/7.png'),
                SizedBox(
                  height: 20,
                ),
                Section(data[4]["name"], data[4]["images"]),
                Section(data[5]["name"], data[5]["images"]),
                SizedBox(
                  height: 60,
                ),
              ],
            ),
          ),
          SlidingUpPanel(
            maxHeight: _panelHeightOpen,
            minHeight: _panelHeightClosed,
            parallaxEnabled: true,
            parallaxOffset: .5,
            panel: _panel(),
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(18.0),
                topRight: Radius.circular(18.0)),
          ),
        ],
      ),
    );
  }

  _panel() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 12.0,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 30,
              height: 5,
              decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.all(Radius.circular(12.0))),
            ),
          ],
        ),
        SizedBox(
          height: 2.0,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Explore",
              style: TextStyle(
                fontWeight: FontWeight.normal,
                fontSize: 24.0,
                fontFamily: 'poppins-regular',
              ),
            ),
            Text(
              " pod",
              style: TextStyle(
                  fontWeight: FontWeight.normal,
                  fontSize: 24.0,
                  fontFamily: 'Cocon',
                  color: Colors.red),
            ),
          ],
        ),
        SizedBox(
          height: 36.0,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _button("Home", Icons.video_library, Colors.blue),
            GestureDetector(
              child: _button("Search", Icons.search, Colors.red),
              onTap: () {
                Navigator.of(context, rootNavigator: true).push(
                  CupertinoPageRoute<bool>(
                    fullscreenDialog: true,
                    builder: (BuildContext context) => Search(),
                  ),
                );
              },
            ),
            GestureDetector(
              child: _button("Watch List", Icons.folder_open, Colors.amber),
              onTap: () {
                Navigator.of(context, rootNavigator: true).push(
                  CupertinoPageRoute<bool>(
                    fullscreenDialog: true,
                    builder: (BuildContext context) => Watchlist(),
                  ),
                );
              },
            ),
            GestureDetector(
              child: _button("More", Icons.settings, Colors.green),
              onTap: () {
                Navigator.of(context, rootNavigator: true).push(
                  CupertinoPageRoute<bool>(
                    fullscreenDialog: true,
                    builder: (BuildContext context) => ProfilePage(),
                  ),
                );
              },
            ),
          ],
        ),
        SizedBox(
          height: 30.0,
        ),
        Container(
          padding: const EdgeInsets.only(left: 24.0, right: 24.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    height: 150,
                    width: MediaQuery.of(context).size.width / 2 - 40,
                    child: ClipRRect(
                      borderRadius: new BorderRadius.circular(10.0),
                      child: Image.asset(
                        'assets/core/1.png',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Container(
                    height: 150,
                    width: MediaQuery.of(context).size.width / 2 - 40,
                    child: ClipRRect(
                      borderRadius: new BorderRadius.circular(10.0),
                      child: Image.asset(
                        'assets/core/2.png',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 12,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    height: 150,
                    width: MediaQuery.of(context).size.width / 2 - 40,
                    child: ClipRRect(
                      borderRadius: new BorderRadius.circular(10.0),
                      child: Image.asset(
                        'assets/core/3.png',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Container(
                    height: 150,
                    width: MediaQuery.of(context).size.width / 2 - 40,
                    child: ClipRRect(
                      borderRadius: new BorderRadius.circular(10.0),
                      child: Image.asset(
                        'assets/core/4.png',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        SizedBox(
          height: 36.0,
        ),
      ],
    );
  }

  _button(String label, IconData icon, Color color) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(16.0),
          child: Icon(
            icon,
            color: Colors.white,
          ),
          decoration:
              BoxDecoration(color: color, shape: BoxShape.circle, boxShadow: [
            BoxShadow(
              color: Color.fromRGBO(0, 0, 0, 0.15),
              blurRadius: 8.0,
            )
          ]),
        ),
        SizedBox(
          height: 12.0,
        ),
        Text(label),
      ],
    );
  }
}
