import 'package:flutter/material.dart';
import '../gps/gps6.dart';

class Page6 extends StatefulWidget {
  const Page6({super.key, required this.title});

  final String title;

  @override
  State<Page6> createState() => _Page6State();
}

class _Page6State extends State<Page6> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.title)),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 60),
            Text("แป้งสาลีอเนกประสงค์", style: TextStyle(fontSize: 17)),
            Text('เนยสดชนิดเค็ม', style: TextStyle(fontSize: 17)),
            Text('น้ำตาลทรายแดง', style: TextStyle(fontSize: 17)),
            Text('น้ำตาลทรายขาว', style: TextStyle(fontSize: 17)),
            Text('ไข่ไก่', style: TextStyle(fontSize: 17)),
            Text('กลิ่นวานิลลา', style: TextStyle(fontSize: 17)),
            Text('เบกกิ้งโซดา', style: TextStyle(fontSize: 17)),
            Text('ผงฟู', style: TextStyle(fontSize: 17)),
            Text('ดาร์กช็อกโกแลต', style: TextStyle(fontSize: 17)),
            Text('ไวท์ช็อกโกแลต', style: TextStyle(fontSize: 17)),

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
