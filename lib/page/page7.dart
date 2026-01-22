import 'package:flutter/material.dart';
import '../gps/gps7.dart';

class Page7 extends StatefulWidget {
  const Page7({super.key, required this.title});

  final String title;

  @override
  State<Page7> createState() => _Page7State();
}

class _Page7State extends State<Page7> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.title)),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 60),
            Text("นมสด", style: TextStyle(fontSize: 17)),
            Text('วิปปิ้งครีม', style: TextStyle(fontSize: 17)),
            Text('ไข่แดงเบอร์', style: TextStyle(fontSize: 17)),
            Text('น้ำตาลทราย', style: TextStyle(fontSize: 17)),
            Text('นมข้นหวาน', style: TextStyle(fontSize: 17)),

            SizedBox(height: 20),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 140,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black87,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    onPressed: () {
                      Navigator.popUntil(context, ModalRoute.withName('/'));
                    },
                    child: Text(
                      "Home Page",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),

                SizedBox(width: 10),

                SizedBox(
                  width: 140,
                  child: ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => KaitodGps()),
                      );
                    },
                    icon: Icon(
                      Icons.location_on,
                      color: Colors.white,
                      size: 20,
                    ),
                    label: Text("GPS", style: TextStyle(color: Colors.white)),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
