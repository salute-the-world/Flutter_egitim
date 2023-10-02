import 'package:flutter/material.dart';
import 'package:flutter_ders_3/constants/colors.dart';
import 'package:hexcolor/hexcolor.dart';

void main() {
  runApp(const WidgetDetail());
}

class WidgetDetail extends StatefulWidget {
  const WidgetDetail({super.key});

  @override
  State<WidgetDetail> createState() => _WidgetDetailState();
}

class _WidgetDetailState extends State<WidgetDetail> {
  int value = 0;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          fontFamily:
              "Proje_3"), //font family temasını material app in altına taşıdığımızda tüm projededi font teması değişti
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Başlık text"),
          centerTitle: true,
          backgroundColor: Color.fromARGB(255, 255, 158, 68),
          leading: const Text("\nmenü"),
        ),
        body: Center(
          
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image(
                //image: NetworkImage("https://images.pexels.com/photos/1290515/pexels-photo-1290515.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1"),
                //ben hata aldım flutter resmi internetten çekmeyi reddetti fakat bu şekilde networkimage komutuyla internetten de imaj verisi çekilebiliniyor.
                
                image: AssetImage("lib/assets/images/image_1.jpg"),
              ),
              
              Text(value.toString()),
              Text(
                  "İkinci text widget column\nsayesinde mümkün\nve beş adet style propertysi var",
                  style: TextStyle(
                    fontFamily: "Proje_3",
                    fontSize: 25,
                    fontWeight: FontWeight.w700,
                    letterSpacing: 0.1,
                    color: HexColor(
                        backgroundColor), //Hex codeları ile renk verebilir hale geldik hexcolor sağolsun
                    //ve color hunt sayfasından uyumlu renk paketleri uygulamalara adapte edilebilir
                  )),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            setState(() {
              value = value + 1;
            });
          },
          child: const Text("+"),
        ),
      ),
    );
  }
}
