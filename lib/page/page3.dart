import 'package:flutter/material.dart';
import '../gps/gps3.dart';

class Page3 extends StatefulWidget {
  const Page3({super.key, required this.title});

  final String title;

  @override
  State<Page3> createState() => _Page3State();
}

class _Page3State extends State<Page3> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.title)),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 60),
            Text("เนื้อเป็ดทั้งตัว", style: TextStyle(fontSize: 17)),
            Text('ผงพะโล้', style: TextStyle(fontSize: 17)),
            Text('ซีอิ้วดำหวาน', style: TextStyle(fontSize: 17)),
            Text('ผงปรุงรสไก่', style: TextStyle(fontSize: 17)),
            Text('น้ำมันหอย', style: TextStyle(fontSize: 17)),
            Text('ซอสปรุงรส', style: TextStyle(fontSize: 17)),
            Text('น้ำส้มสายชู', style: TextStyle(fontSize: 17)),
            Text('เกลือป่น', style: TextStyle(fontSize: 17)),
            Text('ผงกระเทียม', style: TextStyle(fontSize: 17)),
            Text('พริกไทยขาวป่น', style: TextStyle(fontSize: 17)),

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
