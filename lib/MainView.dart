import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:kelly/ttsManager.dart';

class MainView extends StatefulWidget {
  @override
  _MainViewState createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  bool isStart1 = false;
  bool isStart2 = false;
  bool isStart3 = false;
  bool isStart4 = false;
  bool isStart5 = false;

  @override
  Widget build(BuildContext context) {
    startAnimation();

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.dark,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          brightness: Brightness.light,
          automaticallyImplyLeading: false,
          elevation: 0,
          backgroundColor: Color.fromRGBO(0, 0, 0, 0),
          toolbarHeight: -25,
        ),
        body: Padding(
          padding: EdgeInsets.all(17),
          child: Column(
            children: [
              AnimatedOpacity(
                duration: Duration(milliseconds: 100),
                opacity: isStart1 ? 1 : 0,
                child: Container(
                  height: 175,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Expanded(
                            child: Text(
                              "LIST",
                              style: TextStyle(
                                fontSize: 60,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                          Column(
                            children: [
                              CupertinoButton(
                                padding: EdgeInsets.all(0),
                                color: Colors.grey[300],
                                borderRadius: BorderRadius.circular(25),
                                child: Container(
                                  width: 25,
                                  height: 25,
                                  child: Icon(
                                    CupertinoIcons.add,
                                    size: 20,
                                  ),
                                ),
                                onPressed: () => print(""),
                              ),
                              SizedBox(height: 10),
                            ],
                          )
                        ],
                      ),
                      Container(
                        height: 20,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                              Colors.white,
                              Color.fromRGBO(0, 0, 0, 0),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),

              ///
              ///
              ///
              ///
              ///
              ///
              Expanded(
                child: ListView(
                  children: [
                    Card(
                      elevation: isStart2 ? 20 : 0,
                      child: AnimatedOpacity(
                        duration: Duration(milliseconds: 100),
                        opacity: isStart2 ? 1 : 0,
                        child: Container(
                          height: 150,
                          width: 10000,
                          child: Padding(
                            padding: EdgeInsets.all(20.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "🌈 아침 날씨 & 떡상",
                                  style: TextStyle(
                                      fontSize: 25,
                                      fontWeight: FontWeight.w800),
                                ),
                                Text(
                                  "  · 주중 오전 8시 30분\n  · 현재 날씨 & 기온",
                                  style: TextStyle(
                                      fontSize: 17,
                                      fontWeight: FontWeight.w800),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    Card(
                      elevation: isStart3 ? 20 : 0,
                      child: AnimatedOpacity(
                        duration: Duration(milliseconds: 100),
                        opacity: isStart3 ? 1 : 0,
                        child: Container(
                          height: 150,
                          width: 10000,
                          child: Padding(
                            padding: EdgeInsets.all(20.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "비트코인 실시간 알림",
                                  style: TextStyle(
                                      fontSize: 25,
                                      fontWeight: FontWeight.w800),
                                ),
                                Text(
                                  "  · 비트코인 시세 1% 변동 시\n  · 비트코인 시세",
                                  style: TextStyle(
                                      fontSize: 17,
                                      fontWeight: FontWeight.w800),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    Card(
                      elevation: isStart4 ? 20 : 0,
                      child: AnimatedOpacity(
                        duration: Duration(milliseconds: 100),
                        opacity: isStart4 ? 1 : 0,
                        child: Container(
                          height: 150,
                          width: 10000,
                          child: Padding(
                            padding: EdgeInsets.all(20.0),
                            child: Text(
                              "퇴근 전 버스",
                              style: TextStyle(
                                  fontSize: 25, fontWeight: FontWeight.w800),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    Card(
                      elevation: isStart5 ? 20 : 0,
                      child: AnimatedOpacity(
                        duration: Duration(milliseconds: 100),
                        opacity: isStart5 ? 1 : 0,
                        child: Container(
                          height: 150,
                          width: 10000,
                          child: Padding(
                            padding: EdgeInsets.all(20.0),
                            child: Text(
                              "자기 전 내일 일정",
                              style: TextStyle(
                                  fontSize: 25, fontWeight: FontWeight.w800),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> startAnimation() async {
    await Future.delayed(Duration(milliseconds: 500));
    isStart1 = true;
    setState(() {});
    await Future.delayed(Duration(milliseconds: 125));
    isStart2 = true;
    setState(() {});
    await Future.delayed(Duration(milliseconds: 100));
    isStart3 = true;
    setState(() {});
    await Future.delayed(Duration(milliseconds: 100));
    isStart4 = true;
    setState(() {});
    await Future.delayed(Duration(milliseconds: 100));
    isStart5 = true;
    setState(() {});
  }
}
