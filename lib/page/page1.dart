import 'package:flutter/material.dart';
import '../gps/gps1.dart';

class Page1 extends StatefulWidget {
  const Page1({super.key, required this.title});

  final String title;

  @override
  State<Page1> createState() => _Page1State();
}

class _Page1State extends State<Page1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.title)),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 60),
            Text("เนื้อสันในวัว", style: TextStyle(fontSize: 17)),
            Text('น้ำมันมะกอกสำหรับทอด', style: TextStyle(fontSize: 17)),
            Text('เห็ดป่ารวม', style: TextStyle(fontSize: 17)),
            Text('กิ่งไธม์', style: TextStyle(fontSize: 17)),
            Text('แป้งพัฟ', style: TextStyle(fontSize: 17)),
            Text('พาร์มาแฮม', style: TextStyle(fontSize: 17)),
            Text(
              'ไข่แดง 2 ฟอง ตีให้เข้ากันกับน้ำ 1 ช้อนโต๊ะ และเกลือเล็กน้อย',
              style: TextStyle(fontSize: 17),
            ),
            Text('เกลือทะเลและพริกไทยดำบดสด', style: TextStyle(fontSize: 17)),
            Text('น้ำมันมะกอก', style: TextStyle(fontSize: 17)),
            Text('เนื้อวัวส่วนแต่ง', style: TextStyle(fontSize: 17)),
            Text('หอมแดงขนาดใหญ่', style: TextStyle(fontSize: 17)),
            Text('พริกไทยดำ', style: TextStyle(fontSize: 17)),
            Text('ใบกระวาน', style: TextStyle(fontSize: 17)),
            Text('ก้านไทม์', style: TextStyle(fontSize: 17)),
            Text('น้ำส้มสายชูไวน์แดงเล็กน้อย', style: TextStyle(fontSize: 17)),
            Text('ไวน์แดง', style: TextStyle(fontSize: 17)),
            Text('น้ำสต๊อกเนื้อ', style: TextStyle(fontSize: 17)),

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
