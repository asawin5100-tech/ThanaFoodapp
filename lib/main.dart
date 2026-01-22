import 'package:flutter/material.dart';
import 'page/page1.dart';
import 'page/page2.dart';
import 'page/page3.dart';
import 'page/page4.dart';
import 'page/page5.dart';
import 'page/page6.dart';
import 'page/page7.dart';
import 'gps/video/beefwellington_video.dart';
import 'gps/video/brownie_video.dart';
import 'gps/video/cookie_video.dart';
import 'gps/video/duck_video.dart';
import 'gps/video/fishthaicurry_video.dart';
import 'gps/video/steak_video.dart';
import 'gps/video/ice_video.dart';
import 'fire-cal/firebase_options.dart';
import 'fire-cal/firemain.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'mytitle',
      theme: ThemeData(primarySwatch: Colors.blue),
      initialRoute: '/',
      routes: {
        '/': (context) => MainPage(),
        '/page1': (context) => Page1(title: 'วัตถุดิบ'),
        '/page2': (context) => Page2(title: 'วัตถุดิบ'),
        '/page3': (context) => Page3(title: 'วัตถุดิบ'),
        '/page4': (context) => Page4(title: 'วัตถุดิบ'),
        '/page5': (context) => Page5(title: 'วัตถุดิบ'),
        '/page6': (context) => Page6(title: 'วัตถุดิบ'),
        '/page7': (context) => Page7(title: 'วัตถุดิบ'),
        '/firemain': (context) => const FoodCalculatorPage(),
        '/beefwellington_video': (context) => BeefwellingtonVideo(
              title: 'BeefWellington',
              videoUrl: 'assets/beefwellington.mp4',
            ),
        '/brownie_video': (context) =>
            BrownieVideo(title: 'Brownie', videoUrl: 'assets/brownie.mp4'),
        '/TomahawkSteak_video': (context) => SteakVideo(
              title: 'Tomahawk Steak',
              videoUrl: 'assets/TomahawkSteak.mp4',
            ),
        '/duck_video': (context) =>
            DuckVideo(title: 'Roasted Whole Duck', videoUrl: 'assets/duck.mp4'),
        '/Thai_Fish_Curry_video': (context) => Fishthaicurry(
              title: 'Thai Fish Curry',
              videoUrl: 'assets/ThaiFishCurry.mp4',
            ),
        '/cookie_video': (context) =>
            CookieVideo(title: 'Cookies', videoUrl: 'assets/cookie.mp4'),
        '/IceCream_video': (context) =>
            IceVideo(title: 'IceCream', videoUrl: 'assets/IceCream.mp4'),
      },
    );
  }
}

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 233, 233, 67),
      appBar: AppBar(
        title: const Text(
          'Thanapat Rec Foodapp',
          style: TextStyle(
            fontSize: 30,
            color: Color.fromARGB(255, 255, 255, 255),
          ),
        ),
        backgroundColor: const Color.fromARGB(255, 30, 25, 25),
        actions: [
          IconButton(
            icon: const Icon(
              Icons.shopping_cart,
              color: Colors.white,
              size: 28,
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const FoodCalculatorPage()),
              );
            },
          ),
        ],
      ),
      body: const Home(),
    );
  }
}

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/b3.jpg'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.all(5),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.9),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      padding: EdgeInsets.all(8),
                      child: Column(
                        children: [
                          Image.asset(
                            'assets/beef-wellington.jpg',
                            width: 120,
                            height: 120,
                          ),
                          SizedBox(height: 5),
                          Text(
                            'Beef wellington',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          SizedBox(height: 5),
                          Row(
                            children: [
                              ElevatedButton(
                                onPressed: () {
                                  Navigator.pushNamed(context, '/page1');
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.white,
                                  foregroundColor: Colors.black,
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 12,
                                    vertical: 8,
                                  ),
                                ),
                                child: Text('Click'),
                              ),
                              SizedBox(width: 5),
                              ElevatedButton(
                                onPressed: () {
                                  Navigator.pushNamed(
                                    context,
                                    '/beefwellington_video',
                                  );
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.red,
                                  foregroundColor: Colors.white,
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 8,
                                    vertical: 8,
                                  ),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                ),
                                child: Row(
                                  children: [
                                    Icon(Icons.play_circle_fill, size: 16),
                                    SizedBox(width: 3),
                                    Text('วีดีโอ'),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.9),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      padding: EdgeInsets.all(8),
                      child: Column(
                        children: [
                          Image.asset(
                            'assets/TomahawkSteak.jpg',
                            width: 120,
                            height: 120,
                          ),
                          SizedBox(height: 5),
                          Text(
                            'Tomahawk',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          SizedBox(height: 5),
                          Row(
                            children: [
                              ElevatedButton(
                                onPressed: () {
                                  Navigator.pushNamed(context, '/page2');
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.white,
                                  foregroundColor: Colors.black,
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 12,
                                    vertical: 8,
                                  ),
                                ),
                                child: Text('Click'),
                              ),
                              SizedBox(width: 5),
                              ElevatedButton(
                                onPressed: () {
                                  Navigator.pushNamed(
                                    context,
                                    '/TomahawkSteak_video',
                                  );
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.red,
                                  foregroundColor: Colors.white,
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 8,
                                    vertical: 8,
                                  ),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                ),
                                child: Row(
                                  children: [
                                    Icon(Icons.play_circle_fill, size: 16),
                                    SizedBox(width: 3),
                                    Text('วีดีโอ'),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.9),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      padding: EdgeInsets.all(8),
                      child: Column(
                        children: [
                          Image.asset(
                            'assets/RoastedWholeDuck.jpg',
                            width: 120,
                            height: 120,
                          ),
                          SizedBox(height: 5),
                          Text(
                            'Roasted Whole Duck',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          SizedBox(height: 5),
                          Row(
                            children: [
                              ElevatedButton(
                                onPressed: () {
                                  Navigator.pushNamed(context, '/page3');
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.white,
                                  foregroundColor: Colors.black,
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 12,
                                    vertical: 8,
                                  ),
                                ),
                                child: Text('Click'),
                              ),
                              SizedBox(width: 5),
                              ElevatedButton(
                                onPressed: () {
                                  Navigator.pushNamed(context, '/duck_video');
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.red,
                                  foregroundColor: Colors.white,
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 8,
                                    vertical: 8,
                                  ),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                ),
                                child: Row(
                                  children: [
                                    Icon(Icons.play_circle_fill, size: 16),
                                    SizedBox(width: 3),
                                    Text('วีดีโอ'),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.9),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      padding: EdgeInsets.all(8),
                      child: Column(
                        children: [
                          Image.asset(
                            'assets/Thai-Fish-Curry.jpg',
                            width: 120,
                            height: 120,
                          ),
                          SizedBox(height: 5),
                          Text(
                            'Thai Fish Curry',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          SizedBox(height: 5),
                          Row(
                            children: [
                              ElevatedButton(
                                onPressed: () {
                                  Navigator.pushNamed(context, '/page4');
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.white,
                                  foregroundColor: Colors.black,
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 12,
                                    vertical: 8,
                                  ),
                                ),
                                child: Text('Click'),
                              ),
                              SizedBox(width: 5),
                              ElevatedButton(
                                onPressed: () {
                                  Navigator.pushNamed(
                                    context,
                                    '/Thai_Fish_Curry_video',
                                  );
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.red,
                                  foregroundColor: Colors.white,
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 8,
                                    vertical: 8,
                                  ),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                ),
                                child: Row(
                                  children: [
                                    Icon(Icons.play_circle_fill, size: 16),
                                    SizedBox(width: 3),
                                    Text('วีดีโอ'),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.all(5),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.9),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      padding: EdgeInsets.all(6),
                      child: Column(
                        children: [
                          Image.asset(
                            'assets/brownie.jpg',
                            width: 100,
                            height: 100,
                          ),
                          SizedBox(height: 3),
                          Text(
                            'Brownie',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 12,
                            ),
                          ),
                          SizedBox(height: 3),
                          ElevatedButton(
                            onPressed: () {
                              Navigator.pushNamed(context, '/page5');
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.white,
                              foregroundColor: Colors.black,
                              padding: EdgeInsets.symmetric(
                                horizontal: 8,
                                vertical: 6,
                              ),
                            ),
                            child: Text(
                              'Click',
                              style: TextStyle(fontSize: 11),
                            ),
                          ),
                          SizedBox(height: 3),
                          ElevatedButton(
                            onPressed: () {
                              Navigator.pushNamed(context, '/brownie_video');
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.red,
                              foregroundColor: Colors.white,
                              padding: EdgeInsets.symmetric(
                                horizontal: 6,
                                vertical: 6,
                              ),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Icon(Icons.play_circle_fill, size: 14),
                                SizedBox(width: 3),
                                Text('วีดีโอ', style: TextStyle(fontSize: 11)),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.9),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      padding: EdgeInsets.all(6),
                      child: Column(
                        children: [
                          Image.asset(
                            'assets/cookies.jpg',
                            width: 100,
                            height: 100,
                          ),
                          SizedBox(height: 3),
                          Text(
                            'Cookies',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 12,
                            ),
                          ),
                          SizedBox(height: 3),
                          ElevatedButton(
                            onPressed: () {
                              Navigator.pushNamed(context, '/page6');
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.white,
                              foregroundColor: Colors.black,
                              padding: EdgeInsets.symmetric(
                                horizontal: 8,
                                vertical: 6,
                              ),
                            ),
                            child: Text(
                              'Click',
                              style: TextStyle(fontSize: 11),
                            ),
                          ),
                          SizedBox(height: 3),
                          ElevatedButton(
                            onPressed: () {
                              Navigator.pushNamed(context, '/cookie_video');
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.red,
                              foregroundColor: Colors.white,
                              padding: EdgeInsets.symmetric(
                                horizontal: 6,
                                vertical: 6,
                              ),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Icon(Icons.play_circle_fill, size: 14),
                                SizedBox(width: 3),
                                Text('วีดีโอ', style: TextStyle(fontSize: 11)),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.9),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      padding: EdgeInsets.all(6),
                      child: Column(
                        children: [
                          Image.asset(
                            'assets/ice.jpg',
                            width: 100,
                            height: 100,
                          ),
                          SizedBox(height: 3),
                          Text(
                            'Ice Creams',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 12,
                            ),
                          ),
                          SizedBox(height: 3),
                          ElevatedButton(
                            onPressed: () {
                              Navigator.pushNamed(context, '/page7');
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.white,
                              foregroundColor: Colors.black,
                              padding: EdgeInsets.symmetric(
                                horizontal: 8,
                                vertical: 6,
                              ),
                            ),
                            child: Text(
                              'Click',
                              style: TextStyle(fontSize: 11),
                            ),
                          ),
                          SizedBox(height: 3),
                          ElevatedButton(
                            onPressed: () {
                              Navigator.pushNamed(context, '/IceCream_video');
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.red,
                              foregroundColor: Colors.white,
                              padding: EdgeInsets.symmetric(
                                horizontal: 6,
                                vertical: 6,
                              ),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Icon(Icons.play_circle_fill, size: 14),
                                SizedBox(width: 3),
                                Text('วีดีโอ', style: TextStyle(fontSize: 11)),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
