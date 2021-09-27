import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

void main() => runApp(
      DevicePreview(
        enabled: !kReleaseMode,
        builder: (context) => MyApp(), // Wrap your app
      ),
    );

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      locale: DevicePreview.locale(context), // Add the locale here
      builder: DevicePreview.appBuilder, // Add the builder here
      title: 'SightSeeing_app',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.black,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.only(top: 20, left: 5, right: 5),
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      'Unforgettable \nplaces in Tamale (SCCA)',
                      style: TextStyle(
                        fontSize: 21,
                        fontWeight: FontWeight.w100,
                      ),
                    ),
                    Expanded(child: Container()),
                    Icon(
                      Icons.tune,
                      size: 35,
                    )
                  ],
                ),
                SizedBox(
                  height: 15,
                ),
                Container(
                  height: 400,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: <Widget>[
                      createItem(
                        image: 'assets/images/scca.JPG',
                        title: 'SCCA \n1km from you',
                      ),
                      createItem(image: 'assets/images/sc.JPG', title: 'SCCA')
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  'Loved by Others',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.w100),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  height: 190,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: <Widget>[
                      createItem(
                        image: 'assets/images/scca.JPG',
                        title: 'SCCA',
                      ),
                      createItem(
                        image: 'assets/images/sccaa.JPG',
                        title: 'SCCA',
                      ),
                      createItem(
                        image: 'assets/images/sc.JPG',
                        title: 'SCCA',
                      ),
                      createItem(
                        image: 'assets/images/sca.JPG',
                        title: 'SCCA',
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        type: BottomNavigationBarType.fixed,
        iconSize: 35,
        unselectedFontSize: 12,
        selectedFontSize: 12,
        fixedColor: Colors.black87,
        unselectedItemColor: Colors.black87,
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.space_dashboard_outlined),
              label: 'Explore',
              backgroundColor: Colors.black),
          BottomNavigationBarItem(
              icon: Icon(Icons.search_outlined),
              label: 'Search',
              backgroundColor: Colors.black),
          BottomNavigationBarItem(
              icon: Icon(Icons.favorite_outline),
              label: 'Saved',
              backgroundColor: Colors.black),
          BottomNavigationBarItem(
              icon: Icon(Icons.person_outline),
              label: 'Profile',
              backgroundColor: Colors.black),
        ],
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }

  Widget createItem({image, title}) {
    return AspectRatio(
      aspectRatio: 1 / 1.5,
      child: Container(
        margin: EdgeInsets.only(right: 10),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            image: DecorationImage(image: AssetImage(image), fit: BoxFit.cover),
            gradient: LinearGradient(begin: Alignment.bottomRight, colors: [
              Colors.black.withOpacity(.2),
              Colors.black.withOpacity(.1),
            ])),
        child: Container(
          padding: EdgeInsets.all(10),
          child: Align(
            alignment: Alignment.bottomLeft,
            child: Text(
              title,
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
