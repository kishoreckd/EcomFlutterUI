import '../constants/colors.dart';
import '../constants/svg_icons.dart';
import 'package:flutter/material.dart';
import '../constants/breakpoints.dart';



class ShopWineLoadingPlaceHolder extends StatelessWidget {
  const ShopWineLoadingPlaceHolder({super.key});
  @override
  Widget build(BuildContext context) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: List.generate(
          3,
          (index) {
            return Padding(
              padding: const EdgeInsets.only(bottom: 15),
              child: Container(
                width: double.infinity,
                height: 20,
                decoration: BoxDecoration(
                  color: const Color.fromARGB(27, 0, 0, 0),
                  borderRadius: BorderRadius.circular(16),
                ),
              ),
            );
          },
        ),
      );
}

class FeaturedProductsLoadingPlaceHolder extends StatelessWidget {
  const FeaturedProductsLoadingPlaceHolder({super.key});
  @override
  Widget build(BuildContext context) {
    bool isLandscape =
        MediaQuery.of(context).orientation == Orientation.landscape;
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: List.generate(
        3,
        (index) {
          return Flexible(
            child: Padding(
              padding: const EdgeInsets.only(right: 6),
              child: Container(
                width: isLandscape
                    ? MediaQuery.of(context).size.width / 4
                    : MediaQuery.of(context).size.width / 3.38,
                height: 450,
                decoration: BoxDecoration(
                  color: const Color.fromARGB(27, 0, 0, 0),
                  borderRadius: BorderRadius.circular(6),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

class ProductsGridLoadingPlaceHolder extends StatelessWidget {
  const ProductsGridLoadingPlaceHolder({super.key});
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final bool isDeviceOverRange = screenWidth >= Breakpoint.tablet &&
        MediaQuery.of(context).size.height >= 500;
    bool isLandscape =
        MediaQuery.of(context).orientation == Orientation.landscape;
    return Padding(
      padding: EdgeInsets.only(
        left: isDeviceOverRange ? 80.0 : 20.0,
        right: isDeviceOverRange ? 80.0 : 20.0,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: List.generate(
          2,
          (index) {
            return Container(
              height: isDeviceOverRange ? 512 : 360,
              width: isDeviceOverRange
                  ? isLandscape
                      ? screenWidth * 0.2659
                      : screenWidth * 0.3659
                  : screenWidth * 0.4134,
              decoration: BoxDecoration(
                color: const Color.fromARGB(27, 0, 0, 0),
                borderRadius: BorderRadius.circular(6),
              ),
            );
          },
        ),
      ),
    );
  }
}

class ProductsListLoadingPlaceHolder extends StatelessWidget {
  const ProductsListLoadingPlaceHolder({super.key});
  @override
  Widget build(BuildContext context) {
    final bool isLandscape =
        MediaQuery.of(context).orientation == Orientation.landscape;
    final screenWidth = MediaQuery.of(context).size.width;
    final bool isDeviceOverRange = screenWidth >= Breakpoint.tablet &&
        MediaQuery.of(context).size.height >= 500;
    return Padding(
      padding: EdgeInsets.only(
        left: isDeviceOverRange ? 80.0 : 20.0,
        right: isDeviceOverRange ? 80.0 : 20.0,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: List.generate(
          1,
          (index) {
            return Container(
              height: isDeviceOverRange ? 327 : 180,
              width: isDeviceOverRange
                  ? isLandscape
                      ? screenWidth * 0.5
                      : screenWidth * 0.78
                  : screenWidth * 0.89,
              decoration: BoxDecoration(
                color: const Color.fromARGB(27, 0, 0, 0),
                borderRadius: BorderRadius.circular(6),
              ),
            );
          },
        ),
      ),
    );
  }
}

class CarouselLoadingPlaceHolder extends StatelessWidget {
  const CarouselLoadingPlaceHolder({super.key});
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final bool isDeviceOverRange = screenWidth >= Breakpoint.tablet &&
        MediaQuery.of(context).size.height >= 500;
    bool isLandscape =
        MediaQuery.of(context).orientation == Orientation.landscape;
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: List.generate(
        1,
        (index) {
          return Padding(
            padding: EdgeInsets.only(
                left: isLandscape
                    ? (screenWidth * .3) / 2
                    : isDeviceOverRange
                        ? 80
                        : 40),
            child: Container(
              width: isLandscape
                  ? MediaQuery.of(context).size.width * 0.6
                  : MediaQuery.of(context).size.width * 0.8,
              height: isDeviceOverRange
                  ? (screenWidth * 1.05) / 2
                  : (screenWidth * 1.265) / 2,
              decoration: BoxDecoration(
                color: const Color.fromARGB(39, 0, 0, 0),
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          );
        },
      ),
    );
  }
}

class SearchScreenLoadingPlaceHolder extends StatelessWidget {
  const SearchScreenLoadingPlaceHolder({super.key});
  @override
  Widget build(BuildContext context) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: List.generate(
          5,
          (index) {
            return Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: Container(
                width: double.infinity,
                height: 17,
                decoration: BoxDecoration(
                  color: const Color.fromARGB(27, 0, 0, 0),
                  borderRadius: BorderRadius.circular(16),
                ),
              ),
            );
          },
        ),
      );
}

class ProductCountPlaceHolder extends StatelessWidget {
  const ProductCountPlaceHolder({super.key});
  @override
  Widget build(BuildContext context) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: List.generate(
          1,
          (index) {
            return Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: Container(
                width: 86,
                height: 22,
                decoration: BoxDecoration(
                  color: const Color.fromARGB(27, 0, 0, 0),
                  borderRadius: BorderRadius.circular(16),
                ),
              ),
            );
          },
        ),
      );
}

class FilterListPlaceHolder extends StatelessWidget {
  const FilterListPlaceHolder({super.key});
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final bool isDeviceOverRange = screenWidth >= Breakpoint.tablet &&
        MediaQuery.of(context).size.height >= 500;
    bool isLandscape =
        MediaQuery.of(context).orientation == Orientation.landscape;
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: List.generate(
        1,
        (index) {
          return Container(
            alignment: Alignment.center,
            width: isDeviceOverRange
                ? isLandscape
                    ? screenWidth * .65
                    : screenWidth * 0.75
                : screenWidth * 0.89,
            height: 180,
            decoration: BoxDecoration(
              color: const Color.fromARGB(39, 0, 0, 0),
              borderRadius: BorderRadius.circular(10),
            ),
          );
        },
      ),
    );
  }
}

class WishListPlaceHolder extends StatelessWidget {
  const WishListPlaceHolder({super.key});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    bool isDeviceOverRange =
        MediaQuery.of(context).size.width >= Breakpoint.tablet;
    return isDeviceOverRange
        ? Column(
            children: [
              const SizedBox(
                height: 113,
              ),
              GridView.count(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                crossAxisCount: 2,
                mainAxisSpacing: 15,
                crossAxisSpacing: 15,
                childAspectRatio: 3 / 4,
                children: List.generate(
                    10,
                    (index) => Container(
                          height: screenHeight * .484375,
                          width: screenWidth * .3271484371,
                          decoration: BoxDecoration(
                            color: const Color.fromARGB(39, 0, 0, 0),
                            borderRadius: BorderRadius.circular(10),
                          ),
                        )),
              ),
            ],
          )
        : Column(
            children: [
              const SizedBox(
                height: 113,
              ),
              Column(
                children: List.generate(
                    10,
                    (index) => Padding(
                          padding: const EdgeInsets.only(bottom: 15),
                          child: Container(
                            height: screenHeight * .277093596,
                            width: screenWidth * .893333334,
                            decoration: BoxDecoration(
                              color: const Color.fromARGB(39, 0, 0, 0),
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                        )),
              ),
            ],
          );
  }
}

class OrdersPlaceHolder extends StatelessWidget {
  const OrdersPlaceHolder({super.key});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    bool isDeviceOverRange =
        MediaQuery.of(context).size.width >= Breakpoint.tablet;
    return isDeviceOverRange
        ? Container(
            width: screenWidth * .916666667,
            decoration: BoxDecoration(
              color: const Color.fromARGB(39, 0, 0, 0),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              children: List.generate(
                2,
                (index) => Padding(
                  padding: const EdgeInsets.only(bottom: 15),
                  child: Container(
                    height: 100,
                  ),
                ),
              ),
            ))
        : Column(
            children: List.generate(
                2,
                (index) => Padding(
                      padding: const EdgeInsets.only(bottom: 15),
                      child: Container(
                        height: screenHeight * .389093596,
                        width: screenWidth * .893333334,
                        decoration: BoxDecoration(
                          color: const Color.fromARGB(39, 0, 0, 0),
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    )),
          );
  }
}
