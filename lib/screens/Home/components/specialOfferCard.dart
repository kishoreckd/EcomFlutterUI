import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';


class SpecialOffers extends StatelessWidget {
  const SpecialOffers({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      options: CarouselOptions(
        height: 100,
        viewportFraction: 0.7,
        enableInfiniteScroll: true,
        autoPlay: true,
        autoPlayInterval: const Duration(seconds: 3),
      ),
      items: [
        SpecialOffersCard(
          category: "SmartPhones",
          image: "Image Banner 2",
          numOfBrands: 18,
          press: () {},
        ),
        SpecialOffersCard(
          category: "Fashion",
          image: "Image Banner 3",
          numOfBrands: 10,
          press: () {},
        ),
      ],
    );
  }
}

class SpecialOffersCard extends StatelessWidget {
  const SpecialOffersCard({
    super.key,
    required this.category,
    required this.image,
    required this.numOfBrands,
    required this.press,
  });
  final String category;
  final String image;
  final int numOfBrands;
  final GestureTapCallback press;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 242,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Stack(
          children: [
            Image.asset(
              "assets/images/$image.png",
              fit: BoxFit.cover,
            ),
            Container(
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                    const Color(0xFF343434).withOpacity(0.5),
                    const Color(0xFF343434).withOpacity(0.15)
                  ])),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 15.0,
                vertical: 10,
              ),
              child: Text.rich(TextSpan(
                  style: const TextStyle(color: Colors.white),
                  children: [
                    TextSpan(
                        text: "$category\n",
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        )),
                    TextSpan(text: "$numOfBrands Brands")
                  ])),
            )
          ],
        ),
      ),
    );
  }
}