import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:kelly/ttsManager.dart';

class WelcomeView extends StatefulWidget {
  @override
  _WelcomeViewState createState() => _WelcomeViewState();
}

class _WelcomeViewState extends State<WelcomeView> {
  bool isStartMove = false;
  bool isStartOpac = false;

  @override
  void initState() {
    TTSManager.initTts();
    super.initState();
  }

  // @override
  // void dispose() {
  //   TTSManager.stop();
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    if (!isStartMove) startAnimation();

    return Scaffold(
      body: Stack(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image(
                    // TODO: 단순 기본 이미지(x3사이즈)를 x1 사이즈로 줄인 것을 적용함 -> 다른 기기 및 플랫폼에서도 스플래시와 자연스럽게 연결되는지 확인 필요!
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
                      "안녕하세요! 캘리에요 🙌\n원하시는 정보를 필요하실 때 알려드릴게요",
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
    );
  }

  Future<void> startAnimation() async {
    await Future.delayed(Duration(milliseconds: 1000));
    isStartMove = true;
    setState(() {});
    await Future.delayed(Duration(milliseconds: 300));
    isStartOpac = true;
    setState(() {});

    await Future.delayed(Duration(milliseconds: 600));
    TTSManager.speak(input: "안녕하세요? 캘리에요.");
    await Future.delayed(Duration(milliseconds: 500));
    TTSManager.speak(input: "같이 시작해볼까요?");

    // TODO: 커스텀 라우트로 페이드 애니메이션 변경하기
    await Future.delayed(Duration(milliseconds: 1800));
    Navigator.pushNamed(context, "/MainView");
    setState(() {});
  }
}
