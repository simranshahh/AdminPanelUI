// ignore_for_file: file_names

import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../interface/verifyinterface.dart';

import '../notifier/verifynotifier.dart';
import '../repository/verifyRepository.dart';
import '../state/VerifyState.dart';

final _verifyRepositoryProvider =
    Provider<IVerifyRepository>((ref) => VerifyRepository());

final verifyNotifierProvider =
    StateNotifierProvider<VerifyNotifier, VerifyState>(
        (ref) => VerifyNotifier(ref.watch(_verifyRepositoryProvider)));
