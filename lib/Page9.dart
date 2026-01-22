import 'package:flutter/material.dart';

class Page9 extends StatefulWidget {
  const Page9({super.key, required this.title});

  final String title;

  @override
  State<Page9> createState() => _Page1State();
}

class _Page1State extends State<Page9> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("วัตถุดิบ")),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 60),
            Text("น้ำมันหางกะทิ", style: TextStyle(fontSize: 24)),
            Text('หางกะทิ', style: TextStyle(fontSize: 24)),
            Text('หัวกะทิสำหรับเคี่ยวราดหน้า', style: TextStyle(fontSize: 24)),
            Text('หัวกะทิสำหรับใส่ในข้าวซอย', style: TextStyle(fontSize: 24)),
            Text('น่องไก่', style: TextStyle(fontSize: 24)),
            Text('เกลือ', style: TextStyle(fontSize: 24)),
            Text('น้ำตาลปี๊บ', style: TextStyle(fontSize: 24)),
            Text('น้ำปลา', style: TextStyle(fontSize: 24)),
            Text('หมี่กรอบ', style: TextStyle(fontSize: 24)),
            Text('เส้นหมี่แบนหรือกลม', style: TextStyle(fontSize: 24)),
            Text('หอมแดงซอย', style: TextStyle(fontSize: 24)),
            Text('มะนาว', style: TextStyle(fontSize: 24)),
            Text('ต้นหอมและผักชี', style: TextStyle(fontSize: 24)),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/page2');
              },
              child: const Text('วิธีทำ'),
            ),
          ],
        ),
      ),
    );
  }
}
