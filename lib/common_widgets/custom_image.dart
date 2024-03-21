import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

/// Custom image widget that loads an image as a static asset.
class CustomImage extends StatelessWidget {
  const CustomImage({
    super.key,
    required this.imageUrl,
    required this.imageAsset,
  });
  final String? imageUrl;
  final String? imageAsset;

  @override
  Widget build(BuildContext context) {
    if (imageAsset != null) {
      return Image.asset(
        imageAsset!,
        fit: BoxFit.contain,
      );
    } else if (imageUrl!.isNotEmpty) {
      Uri? uri = Uri.tryParse(imageUrl!);
      if (uri != null && uri.hasScheme && uri.hasAuthority) {
        return CachedNetworkImage(
          imageUrl: imageUrl!,
          fit: BoxFit.contain,
        );
      } else {
        return const SizedBox();
      }
    } else {
      return const SizedBox();
    }
  }
}
