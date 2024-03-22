import '../../../models/product.dart';
import 'package:flutter/material.dart';
import '../../../constants/colors.dart';
import 'package:flutter_svg/flutter_svg.dart';
// ignore_for_file: deprecated_member_use





class ProductDescription extends StatelessWidget {
  const ProductDescription({
    super.key,
    required this.product,
  });

  final Product product;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          product.title,
          style: Theme.of(context).textTheme.headlineSmall,
        ),
        const SizedBox(
          height: 5,
        ),
        Align(
          alignment: Alignment.centerRight,
          child: Container(
            padding: const EdgeInsets.all(15),
            width: 64,
            decoration: BoxDecoration(
              color: product.isFavourite
                  ? const Color(0xFFFFE6E6)
                  : const Color(0xFFF5F6F9),
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(20),
                bottomLeft: Radius.circular(20),
              ),
            ),
            child: SvgPicture.asset(
              "assets/icons/Heart Icon_2.svg",
              color: const Color(0xFFFF4848),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(
            left: 20,
            right: 64,
          ),
          child: Text(
            product.description,
            maxLines: 3,
          ),
        ),
        const Padding(
          padding: EdgeInsets.symmetric(vertical: 10.0,horizontal: 20),
          child: Row(
            children: [
              Text(
                'See More Detail',
                style: TextStyle(
                    color: primaryColor, fontWeight: FontWeight.w600),
              ),
              SizedBox(
                width: 5,
              ),
              Icon(
                Icons.arrow_forward_ios,
                size: 12,
                color: primaryColor,
              )
            ],
          ),
        )
      ],
    );
  }
}
