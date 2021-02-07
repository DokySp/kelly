import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MainView extends StatefulWidget {
  @override
  _MainViewState createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  bool isStart1 = false;
  bool isStart2 = false;
  bool isStart3 = false;

  @override
  Widget build(BuildContext context) {
    startAnimation();

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.dark,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          elevation: 0,
          backgroundColor: Color.fromRGBO(0, 0, 0, 0),
          toolbarHeight: 10,
        ),
        body: Padding(
          padding: EdgeInsets.all(10),
          child: Column(
            children: [
              Card(
                elevation: isStart1 ? 20 : 0,
                child: AnimatedOpacity(
                  duration: Duration(milliseconds: 100),
                  opacity: isStart1 ? 1 : 0,
                  child: Container(
                    height: 150,
                    width: 10000,
                    child: Padding(
                      padding: EdgeInsets.all(20.0),
                      child: Text(
                        "Service 1",
                        style: TextStyle(
                            fontSize: 25, fontWeight: FontWeight.w800),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20),
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
                      child: Text(
                        "Service 2",
                        style: TextStyle(
                            fontSize: 25, fontWeight: FontWeight.w800),
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
                      child: Text(
                        "Service 3",
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
      ),
    );
  }

  Future<void> startAnimation() async {
    await Future.delayed(Duration(milliseconds: 500));
    isStart1 = true;
    setState(() {});
    await Future.delayed(Duration(milliseconds: 80));
    isStart2 = true;
    setState(() {});
    await Future.delayed(Duration(milliseconds: 80));
    isStart3 = true;
    setState(() {});
  }
}
