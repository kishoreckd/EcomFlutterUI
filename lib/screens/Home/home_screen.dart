import 'components/categories.dart';
import 'components/home_header.dart';
import 'components/productCard.dart';
import 'package:flutter/material.dart';
import 'components/specialOfferCard.dart';
import 'package:ecomflutter/models/product.dart';
import 'package:ecomflutter/screens/Home/product_detail_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  static String routeName = '/Home';

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 10,
            ),
            HomeHeader(screenWidth: screenWidth),
            const SizedBox(
              height: 10,
            ),
            const DiscountBanner(),
            const SizedBox(
              height: 10,
            ),
            const Categories(),
            const SizedBox(
              height: 10,
            ),
            SectionTitle(
              text: 'Special For You',
              onTap: () {},
            ),
            const SizedBox(
              height: 10,
            ),
            const SpecialOffers(),
            const SizedBox(
              height: 10,
            ),
            SectionTitle(
              text: 'Popular Product',
              onTap: () {},
            ),
            const SizedBox(
              height: 10,
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                  mainAxisAlignment:
                      MainAxisAlignment.start, // Adjust alignment here

                  children: [
                    ...List.generate(
                        demoProducts.length,
                        (index) => ProductCard(
                              product: demoProducts[index],
                              onPress: () => Navigator.pushNamed(
                                context,
                                ProductDetailsScreen.routeName,
                                arguments: ProductDetailsArguments(
                                    product: demoProducts[index]),
                              ),
                            ))
                    // ProductCard(),
                  ]),
            )
          ],
        ),
      )),
    );
  }
}

class SectionTitle extends StatelessWidget {
  const SectionTitle({
    super.key,
    required this.text,
    required this.onTap,
  });

  final String text;
  final GestureTapCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            text,
            style: TextStyle(fontSize: 18, color: Colors.black),
          ),
          GestureDetector(
            onTap: onTap,
            child: Text("See More"),
          )
        ],
      ),
    );
  }
}
