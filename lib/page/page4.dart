import 'package:flutter/material.dart';
import '../gps/gps4.dart';

class Page4 extends StatefulWidget {
  const Page4({super.key, required this.title});

  final String title;

  @override
  State<Page4> createState() => _Page4State();
}

class _Page4State extends State<Page4> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.title)),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 60),
            Text("น้ำมันพืช", style: TextStyle(fontSize: 17)),
            Text('กระเทียม', style: TextStyle(fontSize: 17)),
            Text('ขิงหั่นเป็นชิ้นขนาด', style: TextStyle(fontSize: 17)),
            Text('พริกหวานสีเขียว', style: TextStyle(fontSize: 17)),
            Text('น้ำพริกแกงแดงไทย', style: TextStyle(fontSize: 17)),
            Text('บรอกโคลีแช่แข็ง', style: TextStyle(fontSize: 17)),
            Text("เนื้อปลาขาวแช่แข็ง", style: TextStyle(fontSize: 17)),
            Text('น้ำสต๊อกผัก', style: TextStyle(fontSize: 17)),
            Text('นมมะพร้าวแบบเบากระป๋อง', style: TextStyle(fontSize: 17)),
            Text('ข้าวเมล็ดยาว', style: TextStyle(fontSize: 17)),
            Text('ผักชีสด', style: TextStyle(fontSize: 17)),
            Text('ถั่วลิสงคั่วเกลือ', style: TextStyle(fontSize: 17)),
            Text('มะนาว', style: TextStyle(fontSize: 17)),
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
