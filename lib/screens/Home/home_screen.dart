import 'components/categories.dart';
import 'components/home_header.dart';
import 'components/productCard.dart';
import 'package:flutter/material.dart';
import 'components/specialOfferCard.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ecomflutter/models/product.dart';
import 'package:ecomflutter/constants/colors.dart';

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
                              product: demoProducts[index], onPress: () {  },
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

// class ProductCard extends StatelessWidget {
//   const ProductCard({
//     super.key,
//     required this.product,
//   });
//   final Product product;
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.only(left: 20.0),
//       child: SizedBox(
//         width: 140,
//         child: Column(
//           children: [
//             AspectRatio(
//               aspectRatio: 1.02,
//               child: Container(
//                 padding: const EdgeInsets.all(20),
//                 decoration: BoxDecoration(
//                   color: secondaryColor.withOpacity(0.1),
//                   borderRadius: BorderRadius.circular(15),
//                 ),
//                 child: Image.asset(product.images[0]),
//               ),
//             ),
//             const SizedBox(
//               height: 5,
//             ),
//             Text(
//               product.title,
//               style: TextStyle(color: Colors.black),
//               maxLines: 2,
//             ),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 Text(
//                   "\$${product.price}",
//                   style: const TextStyle(
//                       fontSize: 18,
//                       fontWeight: FontWeight.w600,
//                       color: primaryColor),
//                 ),
//                 InkWell(
//                   borderRadius: BorderRadius.circular(30),
//                   onTap: () {},
//                   child: Container(
//                     padding: const EdgeInsets.all(8),
//                     height: 28,
//                     width: 28,
//                     decoration: BoxDecoration(
//                         color: secondaryColor.withOpacity(0.1),
//                         shape: BoxShape.circle),
//                     child: SvgPicture.asset("assets/icons/Heart Icon_2.svg"),
//                   ),
//                 ),
//               ],
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }

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
      padding: EdgeInsets.symmetric(horizontal: 25),
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
