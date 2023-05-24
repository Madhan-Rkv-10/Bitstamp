import 'package:bitsnap/src/features/home/presentation/Widgets/search_bitsnap.dart';
import 'package:bitsnap/src/features/home/presentation/Widgets/search_results_bitsnap.dart';
import 'package:bitsnap/src/features/home/providers/home_providers.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class HomeScreen extends HookConsumerWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: const SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [SearchBitsnap(), SearchResultsBitsnap()],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.purple,
        shape: const StadiumBorder(),
        onPressed: () async {
          final data = ref.refresh(fetchSingleBitsnapProvider);
          print(data);
        },
        child: const Icon(
          Icons.refresh_outlined,
          color: Colors.white,
        ),
      ),
    );
  }
}
