import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';


class Categories extends StatelessWidget {
  const Categories({
    super.key,
  });

  @override
  Widget build(BuildContext context) {

    List<Map<String, dynamic>> categories = [
      {"icon": "Flash Icon", "text": "Flash Deal"},
      {"icon": "Bill Icon", "text": "Bill"},
      {"icon": "Game Icon", "text": "Game"},
      {"icon": "Gift Icon", "text": "Daily Gift"},
      {"icon": "Discover", "text": "More"},
    ];
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal:20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [...List.generate(categories.length, (index) => CategoriesCard(press: (){}, icon: categories[index]['icon'], text: categories[index]['text']))],
      ),
    );
  }
}

class CategoriesCard extends StatelessWidget {
  const CategoriesCard({
    super.key,
    required this.press,
    required this.icon,
    required this.text,
  });

  final VoidCallback press;
  final String icon;
  final String text;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: SizedBox(
        width: 55,
        child: Column(
          children: [
            AspectRatio(
              aspectRatio: 1,
              child: Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                    color: const Color(0xFFFFECDF),
                    borderRadius: BorderRadius.circular(10)),
                child: SvgPicture.asset("assets/icons/$icon.svg"),
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            Text(
              text,
              textAlign: TextAlign.center,
            )
          ],
        ),
      ),
    );
  }
}
