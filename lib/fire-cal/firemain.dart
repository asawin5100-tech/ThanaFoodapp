import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart'; // ✅ เพิ่มบรรทัดนี้
import 'calc.dart';

class FoodCalculatorPage extends StatefulWidget {
  const FoodCalculatorPage({super.key});

  @override
  State<FoodCalculatorPage> createState() => _FoodCalculatorPageState();
}

class _FoodCalculatorPageState extends State<FoodCalculatorPage> {
  final FirebaseFirestore firestore =
      FirebaseFirestore.instance; // ✅ เพิ่มบรรทัดนี้

  int BeefWellington = 0;
  int TomahawkSteak = 0;
  int RoastedWholeDuck = 0;
  int ThaiFishCurry = 0;
  int Brownies = 0;
  int Cookies = 0;
  int Icecream = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 233, 233, 67),
        elevation: 4,
        centerTitle: true,
        leading: const Icon(
          Icons.restaurant_menu,
          size: 28,
          color: Colors.white,
        ),
        title: const Text(
          "Food Order",
          style: TextStyle(fontSize: 30, color: Colors.white),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              const Text(
                "เลือกอาหารที่ต้องการสั่ง",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20),
              _buildFoodItem(
                "Beef Wellington",
                40,
                "assets/beef-wellington.jpg",
                BeefWellington,
                (val) => setState(() => BeefWellington = val),
              ),
              _buildFoodItem(
                "Tomahawk Steak",
                45,
                "assets/TomahawkSteak.jpg",
                TomahawkSteak,
                (val) => setState(() => TomahawkSteak = val),
              ),
              _buildFoodItem(
                "Roasted Whole Duck",
                35,
                "assets/RoastedWholeDuck.jpg",
                RoastedWholeDuck,
                (val) => setState(() => RoastedWholeDuck = val),
              ),
              _buildFoodItem(
                "Thai Fish Curry",
                40,
                "assets/Thai-Fish-Curry.jpg",
                ThaiFishCurry,
                (val) => setState(() => ThaiFishCurry = val),
              ),
              _buildFoodItem(
                "Brownies",
                50,
                "assets/brownie.jpg",
                Brownies,
                (val) => setState(() => Brownies = val),
              ),
              _buildFoodItem(
                "Cookies",
                45,
                "assets/cookies.jpg",
                Cookies,
                (val) => setState(() => Cookies = val),
              ),
              _buildFoodItem(
                "Icecream",
                50,
                "assets/ice.jpg",
                Icecream,
                (val) => setState(() => Icecream = val),
              ),
              const SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        BeefWellington = 0;
                        TomahawkSteak = 0;
                        RoastedWholeDuck = 0;
                        ThaiFishCurry = 0;
                        Brownies = 0;
                        Cookies = 0;
                        Icecream = 0;
                      });
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red,
                      foregroundColor: Colors.white,
                    ),
                    child: const Text("ล้างข้อมูล"),
                  ),
                  ElevatedButton(
                    onPressed: () async {
                      // ✅ เพิ่ม async
                      int total = BeefWellington +
                          TomahawkSteak +
                          RoastedWholeDuck +
                          ThaiFishCurry +
                          Brownies +
                          Cookies +
                          Icecream;

                      if (total == 0) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text("กรุณาเลือกอาหารอย่างน้อย 1 รายการ"),
                          ),
                        );
                        return;
                      }

                      List<Map<String, dynamic>> items = [];
                      int netTotal = 0;

                      void addItem(String name, int price, int pc) {
                        if (pc > 0) {
                          int t = price * pc;
                          items.add({
                            "item": name,
                            "price": price,
                            "pc": pc,
                            "total": t,
                          });
                          netTotal += t;
                        }
                      }

                      addItem("Beef Wellington", 40, BeefWellington);
                      addItem("Tomahawk Steak", 45, TomahawkSteak);
                      addItem("Roasted Whole Duck", 35, RoastedWholeDuck);
                      addItem("Thai Fish Curry", 40, ThaiFishCurry);
                      addItem("Brownies", 50, Brownies);
                      addItem("Cookies", 45, Cookies);
                      addItem("Icecream", 50, Icecream);

                      // ✅ บันทึกลง Firestore
                      await firestore.collection("food").add({
                        "items": items,
                        "net_total": netTotal,
                        "timestamp": FieldValue.serverTimestamp(),
                      });

                      // ส่งไปหน้า CalcPage
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => CalcPage(
                            items: items,
                            netTotal: netTotal,
                          ),
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green,
                      foregroundColor: Colors.white,
                    ),
                    child: const Text("คำนวณราคา"),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildFoodItem(
    String name,
    int price,
    String imagePath,
    int quantity,
    Function(int) onChanged,
  ) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.asset(
              imagePath,
              width: 60,
              height: 60,
              fit: BoxFit.cover,
              errorBuilder: (_, __, ___) => Container(
                width: 60,
                height: 60,
                color: Colors.grey[300],
                child: const Icon(Icons.restaurant),
              ),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  "ราคา $price บาท",
                  style: const TextStyle(fontSize: 14, color: Colors.grey),
                ),
              ],
            ),
          ),
          IconButton(
            onPressed: () {
              if (quantity > 0) onChanged(quantity - 1);
            },
            icon: const Icon(Icons.remove_circle_outline, color: Colors.red),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            decoration: BoxDecoration(
              color: Colors.grey[200],
              borderRadius: BorderRadius.circular(8),
            ),
            child: Text(
              "$quantity",
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ),
          IconButton(
            onPressed: () => onChanged(quantity + 1),
            icon: const Icon(Icons.add_circle_outline, color: Colors.green),
          ),
        ],
      ),
    );
  }
}
