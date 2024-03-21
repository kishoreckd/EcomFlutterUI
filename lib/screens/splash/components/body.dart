import 'package:flutter/material.dart';
import 'package:ecomflutter/constants/colors.dart';
import '../../../common_widgets/primary_button.dart';
import 'package:ecomflutter/screens/Auth/SignUp/sign_up.dart';
import 'package:ecomflutter/localization/string_hardcoded.dart';

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  int currentPage = 0;

  List<Map<String, String>> splashData = [
    {
      "text": "Welcome To Dckap Lets Shop",
      "image": "assets/images/splash_1.png"
    },
    {
      "text": "We Help People To Shop \n We Care You",
      "image": "assets/images/splash_2.png"
    },
    {
      "text": "We show you the shops \n just Stay with us",
      "image": "assets/images/splash_3.png"
    },
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        width: double.infinity,
        child: Column(
          children: [
            Expanded(
              flex: 3,
              child: PageView.builder(
                onPageChanged: (value) {
                  setState(() {
                    currentPage = value;
                  });
                },
                itemCount: splashData.length,
                itemBuilder: (context, index) => SplashContent(
                  text: splashData[index]["text"]!,
                  image: splashData[index]["image"]!,
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: Column(
                children: [
                  const Spacer(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(
                      splashData.length,
                      (index) => buildDot(index: index),
                    ),
                  ),
                  const Spacer(
                    flex: 2,
                  ),
                  PrimaryButton(
                    text: 'Continue',
                    onPressed: () {
                      Navigator.pushNamed(context, SignUpScreen.routeName);
                    },
                  ),
                  const Spacer()
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  AnimatedContainer buildDot({required int index}) {
    return AnimatedContainer(
      duration: animationDuration,
      height: 6,
      width: currentPage == index ? 20 : 6,
      margin: const EdgeInsets.only(right: 5),
      decoration: BoxDecoration(
          color: currentPage == index ? primaryColor : const Color(0XFFD8D8D8),
          borderRadius: BorderRadius.circular(3)),
    );
  }
}

class SplashContent extends StatelessWidget {
  const SplashContent({
    Key? key,
    required this.text,
    required this.image,
  }) : super(key: key);

  final String text;
  final String image;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Spacer(),
        Text(
          'DCKAP'.hardcoded,
          style: const TextStyle(
            fontSize: 35,
            color: primaryColor,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          text,
          textAlign: TextAlign.center,
        ),
        const Spacer(
          flex: 2,
        ),
        Image.asset(
          image,
          height: 200,
        ),
      ],
    );
  }
}
