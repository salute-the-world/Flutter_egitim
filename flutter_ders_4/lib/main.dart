import 'package:flutter/material.dart';

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
          backgroundColor: const Color.fromARGB(255, 255, 158, 68),
          leading: const Text("\nmenü"),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text("Örnek\n metin"),
            ElevatedButton(onPressed: () {}, child: const Text("Tıkla")),
            Container(
              color: Colors.red,
              padding: EdgeInsets.all(30),
              child: Text("Container\n    text"),
            )
          ],
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
