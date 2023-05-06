// ignore_for_file: file_names, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../Services/localkeys.dart';
import '../../Services/networkexception.dart';
import '../interface/verifyinterface.dart';
import '../state/VerifyState.dart';

class VerifyNotifier extends StateNotifier<VerifyState> {
  final IVerifyRepository _iVerifyRepository;

  VerifyNotifier(this._iVerifyRepository)
      : super(VerifyInitialState());

  Future<void> Verify(
    String id, BuildContext context
   
  ) async {
    try {
      state = VerifyLoadingState();
      final sendVerify = await _iVerifyRepository.verify(
         id, context);
      state = VerifyLoadedState(sendVerify);
    } on NetworkException {
      state = VerifyErrorState(LocaleKeys.something_went_wrong.trim());
    }
  }
}
