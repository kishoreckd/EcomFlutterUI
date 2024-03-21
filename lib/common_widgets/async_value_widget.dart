// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import './error_message_widget.dart';
import 'loading_place_holder.dart';

class AsyncValueWidget<T> extends StatelessWidget {
  const AsyncValueWidget(
      {super.key,
      required this.value,
      required this.data,
      required this.loadingPlaceHolder});
  final AsyncValue<T> value;
  final Widget Function(T) data;
  final Widget loadingPlaceHolder;

  @override
  Widget build(BuildContext context) {
    return value.when(
        data: data,
        error: (e, st) => Center(child: ErrorMessageWidget(e.toString())),
        loading: () => loadingPlaceHolder);
  }
}

/// Sliver equivalent of [AsyncValueWidget]
class AsyncValueSliverWidget<T> extends StatelessWidget {
  const AsyncValueSliverWidget(
      {super.key, required this.value, required this.data});
  final AsyncValue<T> value;
  final Widget Function(T) data;

  @override
  Widget build(BuildContext context) {
    return value.when(
      data: data,
      loading: () => SliverToBoxAdapter(
        child: Center(
          child: FeaturedProductsLoadingPlaceHolder(),
        ),
      ),
      error: (e, st) => SliverToBoxAdapter(
        child: Center(child: ErrorMessageWidget(e.toString())),
      ),
    );
  }
}
