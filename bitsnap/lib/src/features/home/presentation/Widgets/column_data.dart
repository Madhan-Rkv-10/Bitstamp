// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bitsnap/src/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ColumnData extends HookConsumerWidget {
  final String header;
  final String value;
  const ColumnData({required this.header, required this.value, Key? key})
      : super(key: key);
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          header.toUpperCase(),
          style: context.textThemes.titleSmall,
        ),
        const SizedBox(
          height: UIDimens.size3,
        ),
        Text(
          "\$ $value",
          style: context.textThemes.titleLarge,
        ),
      ],
    ).paddingSymmetric(vertical: UIDimens.size12);
  }
}
