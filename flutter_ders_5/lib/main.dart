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
      home: Row(
        children: [
          Expanded(
            //expanded ile wrap edilen container normalde sığmayan bir metin içermesine rağmen sorun çıkarmayaı durdurdu.
            child: Container(
              color: Colors.amber,
              child: Text(
                  "hello uygulamamıza gelen güzel insan biraz laf kalabalığına ihtiyacım var"),
            ),
          ),
          Flexible(
            //Expanded containerleri eşit şekilde ayırırken FLexible ile bu kontainerler arasında yer kaplama bakımından oran dağıtabiliyoruz
            flex: 2,
            child: Container(
              color: Colors.blue,
              child: Text("world"),
            ),
          ),
        ],
      ),
    );
  }
}
