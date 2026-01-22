import 'package:flutter/material.dart';
import '../gps/gps5.dart';

class Page5 extends StatefulWidget {
  const Page5({super.key, required this.title});

  final String title;

  @override
  State<Page5> createState() => _Page5State();
}

class _Page5State extends State<Page5> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.title)),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 60),
            Text("เกลือทะเลบดหยาบ", style: TextStyle(fontSize: 17)),
            Text('พริกไทยดำบดหยาบ', style: TextStyle(fontSize: 17)),
            Text('เนยจืด', style: TextStyle(fontSize: 17)),
            Text(' ก้านโรสแมรี่', style: TextStyle(fontSize: 17)),
            Text('ก้านไทม์', style: TextStyle(fontSize: 17)),
            Text('เนื้อโทมาฮอร์ก', style: TextStyle(fontSize: 17)),

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
