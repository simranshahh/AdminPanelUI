// ignore_for_file: file_names

import '../models/Varifymodel.dart';

abstract class VerifyState {
  VerifyState();
}

class VerifyInitialState extends VerifyState {
  VerifyInitialState();
}

class VerifyLoadingState extends VerifyState {
  VerifyLoadingState();
}

class VerifyLoadedState extends VerifyState {
  final Verify? verify;
  VerifyLoadedState(this.verify);
}

class VerifyErrorState extends VerifyState {
  final String? message;
  VerifyErrorState(
    String tr, {
    this.message,
  });
}
