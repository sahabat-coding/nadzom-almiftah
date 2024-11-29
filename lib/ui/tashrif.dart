import 'package:flutter/material.dart';
import 'home.dart'; // Pastikan Anda mengimpor home.dart di sini

class Tashrif extends StatelessWidget {
  const Tashrif({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          // Menambahkan scroll
          padding: const EdgeInsets.all(16.0),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () {
                        // Navigasi ke halaman home.dart
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  const HomePage()), // Ganti HomePage() dengan widget di home.dart
                        );
                      },
                      child: const Padding(
                        padding: EdgeInsets.only(top: 20),
                        child: CircleAvatar(
                          radius: 20,
                          backgroundColor: Colors.indigo,
                          child: Icon(Icons.home, color: Colors.white),
                        ),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(top: 20),
                      child: Text(
                        'بِسْمِ اللَّهِ الرَّحْمَٰنِ الرَّحِيمِ',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    const SizedBox(width: 40), // Placeholder for alignment
                  ],
                ),
                const SizedBox(height: 15),
                const Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text('أَحْمَدُ رَبِّي اللَّهَ خَيْرَ مَالِكْ',
                              style: TextStyle(fontSize: 16)),
                          Text('وَآلِهِ الْمُسْتَكْمِلِينَ الشَّرَفَا',
                              style: TextStyle(fontSize: 16)),
                          Text('مَقَاصِدَ النَّحْوِ بِهَا مَحْوِيَّهْ',
                              style: TextStyle(fontSize: 16)),
                          Text('وَتَبْسُطُ الْبَذْلَ بِوَعْدٍ مُنْجَزِ',
                              style: TextStyle(fontSize: 16)),
                          Text('فَائِقَةً أَلْفِيَّةَ ابْنِ مُعْطِي',
                              style: TextStyle(fontSize: 16)),
                          Text('مُسْتَوْجِبَةً ثَنَائِيَ الْجَمِيلاَ',
                              style: TextStyle(fontSize: 16)),
                          Text('لِي وَلَهُ فِي دَرَجَاتِ الآخِرَهْ',
                              style: TextStyle(fontSize: 16)),
                        ],
                      ),
                    ),
                    SizedBox(width: 15),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text('قالَ مُحَمَّدٌ هُوَ ابْنُ مَالِكْ',
                              style: TextStyle(fontSize: 16)),
                          Text('مُصَلِّياً عَلَى الرَّسُولِ الْمُصْطَفَى',
                              style: TextStyle(fontSize: 16)),
                          Text('وَأَسْتَعِينُ اللَّهَ فِي أَلْفِيَّهْ',
                              style: TextStyle(fontSize: 16)),
                          Text('تَقْرِيبُهَا لِلْفَهْمِ بِاللَّفْظِ الْمُوجَزِ',
                              style: TextStyle(fontSize: 16)),
                          Text('وَتَقْتَضِي رِضاً بِغَيْرِ سُخْطِ',
                              style: TextStyle(fontSize: 16)),
                          Text('الكَلاَمُ وَمَا يَتَأَلَّفُ مِنهُ',
                              style: TextStyle(fontSize: 16)),
                          Text('وَاللَّهُ يَقْضِي بِهَبَاتٍ وَافِرَهْ',
                              style: TextStyle(fontSize: 16)),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 15),
                const Center(
                  child: Text(
                    'الكَلاَمُ وَمَا يَتَأَلَّفُ مِنهُ',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
