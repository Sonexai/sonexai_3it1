import 'package:flutter/material.dart';

class NewScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<String> images = [
      "assets/patuxay.jpg",
      "assets/vientiane-to-vang-vieng.jpg",
      "assets/Pha-That-Luang-Vientiane.jpg",
      "assets/XiengKhuang_Temple.jpg",
      "assets/XiengKhuang2_Temple.jpg",
      "assets/Xam_Neua.jpg",
      "assets/Phatee.jpg",
      "assets/Kuang-Si-Waterfalls.jpg",
      "assets/Tad_Yuang.jpg",
      "assets/Khonephapheng.jpg",
      "assets/TadXae.jpg",
    ];
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Tourist Atratcions'),
        ),
        body: Center(
          child: Container(         
            child: GridView.builder(
              itemCount: images.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 10.0,
                mainAxisSpacing: 10.0,
              ),
              itemBuilder: (BuildContext context, int index) {
                return Image.asset(images[index]);
              },
            ),
          ),
        ),
      ),
    );
  }
}