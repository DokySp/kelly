import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class WelcomeView extends StatefulWidget {
  @override
  _WelcomeViewState createState() => _WelcomeViewState();
}

class _WelcomeViewState extends State<WelcomeView> {
  bool isStartMove = false;
  bool isStartOpac = false;

  @override
  Widget build(BuildContext context) {
    if (!isStartMove) startAnimation();

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.dark,
      child: Scaffold(
        body: Stack(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image(
                      width: 170.66,
                      image: AssetImage("assets/images/icon.png"),
                    ),
                    AnimatedPadding(
                      curve: Curves.easeInOutCubic,
                      duration: Duration(milliseconds: 700),
                      padding:
                          EdgeInsets.fromLTRB(0, isStartMove ? 100 : 0, 0, 0),
                    ),
                  ],
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(height: 150),
                    AnimatedOpacity(
                      duration: Duration(milliseconds: 500),
                      opacity: isStartOpac ? 1 : 0,
                      child: Text(
                        "안녕하세요! 캘리에요 🙌\n필요하신 정보를 원하실 때 알려드릴게요",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  Future<void> startAnimation() async {
    await Future.delayed(Duration(milliseconds: 1000));
    print("asdffad");
    isStartMove = true;
    setState(() {});
    await Future.delayed(Duration(milliseconds: 300));
    isStartOpac = true;
    setState(() {});

    // TODO: 커스텀 라우트로 페이드 애니메이션 변경하기
    await Future.delayed(Duration(milliseconds: 2000));
    Navigator.pushNamed(context, "/MainView");
    setState(() {});
  }
}
