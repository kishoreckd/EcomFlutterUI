import 'package:flutter/material.dart';
import '../../../constants/colors.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({
    super.key,
    required this.screenWidth,
  });

  final double screenWidth;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
              width: screenWidth * 0.6,
              decoration: BoxDecoration(
                  color: secondaryColor.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(10)),
              child: const TextField(
                decoration: InputDecoration(
                  enabledBorder: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  hintText: 'Search Product',
                  prefixIcon: Icon(Icons.search),
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                ),
              )),
          IcnButton(
            svgsrc: 'Cart Icon',
            press: () {},
            numOfTime: 3,
          ),
          IcnButton(
            svgsrc: 'Bell',
            press: () {},
            numOfTime: 3,
          ),
        ],
      ),
    );
  }
}

class IcnButton extends StatelessWidget {
  const IcnButton({
    super.key,
    required this.svgsrc,
    required this.numOfTime,
    required this.press,
  });
  final String svgsrc;
  final int numOfTime;
  final VoidCallback press;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: press,
      borderRadius: BorderRadius.circular(50),
      child: Stack(
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            height: 46,
            width: 46,
            decoration: BoxDecoration(
                color: secondaryColor.withOpacity(0.1), shape: BoxShape.circle),
            child: SvgPicture.asset("assets/icons/$svgsrc.svg"),
          ),
          Positioned(
            top: -3,
            right: 0,
            child: Container(
              padding: const EdgeInsets.all(12),
              height: 16,
              width: 16,
              decoration: BoxDecoration(
                color: const Color(0xFFFF4848),
                shape: BoxShape.circle,
                border: Border.all(width: 1.5, color: Colors.white),
              ),
              child: Center(
                child: Text(
                  '$numOfTime',
                  style: const TextStyle(
                      fontSize: 10,
                      height: 1,
                      color: Colors.white,
                      fontWeight: FontWeight.w600),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class DiscountBanner extends StatelessWidget {
  const DiscountBanner({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 15,
      ),
      width: double.infinity,
      height: 90,
      decoration: BoxDecoration(
          color: const Color(0xFF4A3298),
          borderRadius: BorderRadius.circular(20)),
      child: const Text.rich(
        TextSpan(
            text: 'A summer Suprise\n',
            style: TextStyle(
              color: Colors.white,
            ),
            children: [
              TextSpan(
                text: 'Cashback 20%',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ]),
      ),
    );
  }
}
