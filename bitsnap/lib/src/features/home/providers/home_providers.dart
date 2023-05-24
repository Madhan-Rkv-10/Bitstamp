import 'dart:async';

import 'package:bitsnap/src/features/home/domainModels/bitsnap_model.dart';
import 'package:bitsnap/src/features/home/domainModels/bitsnap_order_book_model.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../repository/bitsnap_repo.dart';

final bitSnapRepoProvider = Provider((ref) => BitSnapRepository());
final searchBitsnap = StateProvider<String>((ref) => '');
final viewOrderBook = StateProvider<bool>((ref) => false);
final fetchSingleBitsnapProvider =
    FutureProvider.autoDispose<SingleBitsnapResponse>((ref) async {
  final value = ref.watch(searchBitsnap);
  final provider = ref.read(bitSnapRepoProvider);
  ref.onDispose(() {
    FocusManager.instance.primaryFocus?.unfocus();
  });
  final data = await provider.getSingleBitsnap(searchValue: value);
  return data;
});
final fetchBitstampOrder =
    FutureProvider.autoDispose<BitstampBook>((ref) async {
  if (ref.state.isRefreshing) {
    await ref.debounce();
  }
  final value = ref.watch(searchBitsnap);
  final provider = ref.watch(bitSnapRepoProvider);
  ref.onDispose(() {
    FocusManager.instance.primaryFocus?.unfocus();
  });
  return await provider.getBitstampOrder(searchValue: value);
});

extension DebounceExtension on Ref {
  /// delays the execution of the code for the given duration,
  /// if any dependency changes during the period,
  /// the timer will reset and restart
  /// if nothing changes, the rest of the code will be executed.
  Future<void> debounce([
    Duration duration = const Duration(milliseconds: 350),
  ]) {
    final completer = Completer<void>();

    /// creates a timer with the given duration
    /// when the time expires, and the completer hasn't completed yet, complete it.
    /// and the debounce function lets the rest of the code executed
    final timer = Timer(duration, () {
      if (!completer.isCompleted) completer.complete();
    });

    /// if provider disposed and the completer hasn't completed yet
    /// cancel the timer and throw canceled error
    onDispose(() {
      timer.cancel();
      if (!completer.isCompleted) {
        completer.completeError(StateError('Canceled'));
      }
    });

    return completer.future;
  }
}
