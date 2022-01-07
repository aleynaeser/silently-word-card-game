import 'package:card_game/database/data.dart';
import 'package:card_game/screens/page_transformer.dart';
import 'package:flutter/material.dart';
import 'intro_page_item.dart';
import 'dart:async';

class IntroPageView extends StatefulWidget {
  const IntroPageView({Key key}) : super(key: key);
  @override
  _IntroPageViewState createState() => _IntroPageViewState();
}

class _IntroPageViewState extends State<IntroPageView> {
  var player1 = 0;
  var player2 = 0;
  Timer _timer;
  var _start = 60;
  var oneSec = const Duration(seconds: 1);

  @override
  void initState() {
    super.initState();
    player1 = 0;
    player2 = 0;
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  void startTimer() {
    _timer = Timer.periodic(
      oneSec,
      (Timer _timer) => setState(
        () {
          if (_start == 0) {
            setState(() {
              _timer.cancel();
              _start = 60;
            });
          } else {
            setState(() {
              _start--;
            });
          }
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 100,
        title: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Player 1: $player1',
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    letterSpacing: 1,
                  ),
                ),
                Text(
                  'Player 2: $player2',
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    letterSpacing: 1,
                  ),
                ),
                Row(children: [
                  const Icon(
                    Icons.access_time_filled,
                    color: Colors.white70,
                  ),
                  Text(
                    ' $_start',
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      letterSpacing: 1,
                    ),
                  )
                ]),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 20.0),
                  child: ElevatedButton(
                    child: const Icon(Icons.add),
                    onPressed: () {
                      setState(() {
                        player1++;
                      });
                    },
                    style: ElevatedButton.styleFrom(
                        shape: CircleBorder(), primary: Colors.indigoAccent),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 20.0),
                  child: ElevatedButton(
                    child: const Icon(Icons.add),
                    onPressed: () {
                      setState(() {
                        player2++;
                      });
                    },
                    style: ElevatedButton.styleFrom(
                        shape: CircleBorder(), primary: Colors.indigoAccent),
                  ),
                ),
                Row(children: [
                  GestureDetector(
                    child: ElevatedButton(
                      child: const Icon(Icons.not_started),
                      onPressed: () {
                        setState(() {
                          startTimer();
                        });
                      },
                      onLongPress: () {
                        oneSec = const Duration(seconds: 1);
                      },
                      style: ElevatedButton.styleFrom(
                          shape: CircleBorder(), primary: Colors.indigoAccent),
                    ),
                  ),
                ]),
              ],
            ),
          ],
        ),
      ),
      body: Center(
        child: SizedBox.fromSize(
          size: const Size.fromHeight(600.0),
          child: PageTransformer(
            pageViewBuilder: (context, visibilityResolver) {
              return PageView.builder(
                controller: PageController(viewportFraction: 0.85),
                itemCount: sampleItems.length,
                itemBuilder: (context, index) {
                  final item = sampleItems[index];
                  final pageVisibility =
                      visibilityResolver.resolvePageVisibility(index);
                  return IntroPageItem(
                    item: item,
                    pageVisibility: pageVisibility,
                  );
                },
              );
            },
          ),
        ),
      ),
    );
  }
}
