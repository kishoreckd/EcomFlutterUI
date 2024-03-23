import 'product/color_dots.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter/material.dart';
import 'product/product_description.dart';
import 'product/top_rounded_container.dart';
import 'package:ecomflutter/models/product.dart';
import 'package:ecomflutter/constants/colors.dart';
import 'package:ecomflutter/common_widgets/primary_button.dart';

class ProductDetailsScreen extends StatefulWidget {
  const ProductDetailsScreen({Key? key}) : super(key: key);
  static String routeName = '/Product';

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  int selectedImage = 0;

  void setSelectedImage(int index) {
    setState(() {
      selectedImage = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final ProductDetailsArguments arguments =
        ModalRoute.of(context)!.settings.arguments as ProductDetailsArguments;
    return Scaffold(
      backgroundColor: const Color(0xFFF5F6F9),
      appBar: AppBar(
        scrolledUnderElevation: 0,
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
            },
            style: ElevatedButton.styleFrom(
              shape: const CircleBorder(),
              padding: EdgeInsets.zero,
              elevation: 0,
              backgroundColor: Colors.white,
            ),
            child: const Icon(
              Icons.arrow_back_ios_new,
              color: Colors.black,
              size: 20,
            ),
          ),
        ),
        actions: [
          Row(
            children: [
              Container(
                margin: const EdgeInsets.only(right: 20),
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(14),
                ),
                child: Row(
                  children: [
                    const Text(
                      "4.7",
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.black,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(width: 4),
                    SvgPicture.asset("assets/icons/Star Icon.svg"),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
      body: Body(
          product: arguments.product,
          selectedImage: selectedImage,
          onImageSelected: setSelectedImage),
    );
  }
}

class Body extends StatelessWidget {
  const Body({
    Key? key,
    required this.product,
    required this.selectedImage,
    required this.onImageSelected,
  }) : super(key: key);

  final Product product;
  final int selectedImage;
  final Function(int) onImageSelected;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(
            width: 240,
            child: AspectRatio(
              aspectRatio: 1,
              child: Image.asset(product.images[selectedImage]),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ...List.generate(
                product.images.length,
                (index) => BuildSmallPreview(index),
              )
            ],
          ),
          TopRoundedContainer(
            color: Colors.white,
            child: Column(
              children: [
                ProductDescription(product: product),
                TopRoundedContainer(
                    color: const Color(0xFFF6F7F9),
                    child: Column(
                      children: [
                        ColorDots(product: product),
                        TopRoundedContainer(
                          color: Colors.white,
                          child: Padding(
                            padding: EdgeInsets.only(
                              left: screenWidth * 0.15,
                              right: screenWidth * 0.15,
                              top: 15,
                              bottom: 40,
                            ),
                            child: PrimaryButton(
                              text: "Add to Cart",
                              onPressed: () {},
                            ),
                          ),
                        )
                      ],
                    )),
              ],
            ),
          )
        ],
      ),
    );
  }

  // ignore: non_constant_identifier_names
  GestureDetector BuildSmallPreview(int index) {
    return GestureDetector(
      onTap: () => onImageSelected(index),
      child: Container(
        margin: const EdgeInsets.only(right: 15),
        padding: const EdgeInsets.all(8),
        height: 48,
        width: 48,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: selectedImage == index ? primaryColor : Colors.transparent,
          ),
        ),
        child: Image.asset(product.images[index]),
      ),
    );
  }
}

class ProductDetailsArguments {
  ProductDetailsArguments({required this.product});
  final Product product;
}
