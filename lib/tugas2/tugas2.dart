import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Menu Buka Puasa',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: GalleryScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class GalleryScreen extends StatefulWidget {
  @override
  _GalleryScreenState createState() => _GalleryScreenState();
}

class _GalleryScreenState extends State<GalleryScreen> {
  final List<Map<String, String>> photos = [
    {
      'images': 'assets/images/bubursumsum.jpg',
      'title': 'Bubur Sumsum',
      'description': 'Bubur lembut berbahan tepung beras yang disajikan dengan kuah gula merah kental.'
    },
    {
      'images': 'assets/images/esteler.jpg',
      'title': 'Es Teler',
      'description': 'Kombinasi alpukat, nangka, kelapa muda, dan cincau yang disiram dengan santan dan es serut.'
    },
    {
      'images': 'assets/images/klepon.jpg',
      'title': 'Klepon Pandan',
      'description': 'Jajanan tradisional khas Indonesia berisi gula merah cair dan dibalut parutan kelapa.'
    },
    {
      'images': 'assets/images/puding.jpg',
      'title': 'Puding Kurma Susu',
      'description': 'Puding berbahan dasar susu dengan tambahan kurma yang manis alami.'
    },
    {
      'images': 'assets/images/serabi.jpg',
      'title': 'Serabi Kuah Kinca',
      'description': 'Serabi lembut berbahan tepung beras dengan kuah kinca dari gula merah dan santan.'
    },
  ];

  int currentIndex = 0;

  void nextImage() {
    setState(() {
      if (currentIndex < photos.length - 1) {
        currentIndex++;
      }
    });
  }

  void previousImage() {
    setState(() {
      if (currentIndex > 0) {
        currentIndex--;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Menu Buka Puasa', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
        centerTitle: true,
        backgroundColor: Colors.blue.shade700,
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Colors.blue.withOpacity(0.2),
                    blurRadius: 10,
                    spreadRadius: 2,
                    offset: Offset(0, 5),
                  ),
                ],
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.asset(
                  photos[currentIndex]['images']!,
                  fit: BoxFit.cover,
                  width: double.infinity,
                  height: 250,
                ),
              ),
            ),
            SizedBox(height: 20),
            Card(
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              color: Colors.blue.shade50,
              child: Padding(
                padding: EdgeInsets.all(16),
                child: Column(
                  children: [
                    Text(
                      photos[currentIndex]['title']!,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.blue.shade900,
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      photos[currentIndex]['description']!,
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: previousImage,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue.shade700,
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: Text('Kembali', style: TextStyle(fontSize: 16, color: Colors.white)),
                ),
                SizedBox(width: 20),
                ElevatedButton(
                  onPressed: nextImage,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue.shade700,
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: Text('Lanjut', style: TextStyle(fontSize: 16, color: Colors.white)),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
