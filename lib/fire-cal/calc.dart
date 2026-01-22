import 'package:flutter/material.dart';

class CalcPage extends StatelessWidget {
  final List<Map<String, dynamic>> items;
  final int netTotal;

  const CalcPage({
    super.key,
    required this.items,
    required this.netTotal,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("สรุปรายการอาหาร"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: items.length,
                itemBuilder: (context, index) {
                  final item = items[index];
                  return Card(
                    child: ListTile(
                      title: Text(item['item']),
                      subtitle: Text(
                          '${item['price']} บาท x ${item['pc']} = ${item['total']} บาท'),
                    ),
                  );
                },
              ),
            ),
            const Divider(thickness: 2),
            Text(
              'ยอดรวมทั้งหมด: $netTotal บาท',
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
