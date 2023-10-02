import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';

class KostebegiYakala extends StatefulWidget {
  const KostebegiYakala({super.key});

  @override
  State<KostebegiYakala> createState() => _kostebegiYakalaState();
}

class _kostebegiYakalaState extends State<KostebegiYakala> {
  List<_kstbk> _kstbkList = List.generate(9, (index) => _kstbk());

  Timer? countdown;
  Timer? changer;
  static const maxSecond = 30;
  int second = maxSecond;

  void countdownTimer() {
    countdown = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        second--;
      });
      if (second == 0) timer.cancel();
    });
  }

  void kstbkChanger() {
    changer = Timer.periodic(Duration(milliseconds: 500), (timer) {
      _kstbkList.clear();
      _kstbkList = List.generate(9, (index) => _kstbk());
      setState(() {
        _kstbkList[Random().nextInt(9)].visibility = true;
      });
      if (second == 0) timer.cancel();
    });
  }

  @override
  void initState() {
    super.initState();
    countdownTimer();
    kstbkChanger();
  }

  @override
  Widget build(BuildContext context) {
    String _appbarTitle = 'Köstebeği Yakala';
    return Scaffold(
      appBar: AppBar(
        title: Text(_appbarTitle),
      ),
      body: Column(
        children: [
          Expanded(
            flex: 1,
            child: Center(
              child: Text(
                "Kalan saniye:$second",
                style: Theme.of(context).textTheme.headlineSmall,
              ),
            ),
          ),
          Expanded(
            flex: 5,
            child: GridView.builder(
              physics: const ScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
              ),
              itemCount: 9,
              itemBuilder: (BuildContext context, int index) {
                return _kstbkList[index];
              },
            ),
          ),
          Expanded(
            flex: 2,
            child: Center(
              child: Text(
                "Score: ${ScoreUtility.score}",
                style: Theme.of(context).textTheme.headlineSmall,
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: Visibility(
          visible: second == 0,
          child: FloatingActionButton.extended(
            onPressed: () {
              ScoreUtility.score = 0;
              Navigator.pop(context);
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => KostebegiYakala(),
                ),
              );
            },
            label: Text("Tekrar Oyna"),
            backgroundColor: Colors.grey,
          )),
      floatingActionButtonLocation:
          FloatingActionButtonLocation.miniCenterFloat,
    );
  }
}

class _kstbk extends StatefulWidget {
  bool visibility;
  _kstbk({
    super.key,
    this.visibility = false,
  });

  @override
  State<_kstbk> createState() => _kstbkState();
}

class _kstbkState extends State<_kstbk> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        if (widget.visibility) ScoreUtility().addScore();
      },
      child: Visibility(
        child: Image.asset("assets/kstbk.png"),
        visible: widget.visibility,
      ),
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
    );
  }
}

class ScoreUtility {
  static int score = 0;

  void addScore() {
    score++;
  }
}
