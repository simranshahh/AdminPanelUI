// ignore_for_file: file_names

import 'package:flutter/material.dart';

import '../models/Varifymodel.dart';

abstract class IVerifyRepository {
  Future<Verify?> verify(String id, BuildContext context);
}
