import '../../../models/product.dart';
import 'package:flutter/material.dart';
import '../../../constants/colors.dart';
import '../components/rounded_icn_btn.dart';




class ColorDots extends StatelessWidget {
  const ColorDots({
    super.key,
    required this.product,
  });

  final Product product;

  @override
  Widget build(BuildContext context) {
    int selectedColor = 3;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: [
          ...List.generate(
              product.colors.length,
              (index) => ColorDot(
                    color: product.colors[index],
                    isSelected: selectedColor == index,
                  )),
          Spacer(),
          RoundedIconBtn(
            icon: Icons.remove,
            press: () {},
          ),
          SizedBox(
            width: 15,
          ),
          RoundedIconBtn(
            icon: Icons.add,
            press: () {},
          )
          // ColorDot(product: product),
        ],
      ),
    );
  }
}

class ColorDot extends StatelessWidget {
  const ColorDot({
    super.key,
    required this.color,
    required this.isSelected,
  });

  final Color color;
  final bool isSelected;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 10),
      padding: const EdgeInsets.all(8),
      height: 40,
      width: 40,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border:
            Border.all(color: isSelected ? primaryColor : Colors.transparent),
      ),
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: color,
          shape: BoxShape.circle,
        ),
      ),
    );
  }
}
