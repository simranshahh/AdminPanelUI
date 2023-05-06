import 'package:fluro/fluro.dart';
import 'package:flutter/widgets.dart';

import '../../Aasidebar/Navbar.dart';


class Routes {
  static FluroRouter getRouter() {
    final router = FluroRouter();

    router.define('homepage',
        handler: Handler(
            handlerFunc: (BuildContext? context, Map<String, dynamic> params) =>
               CustomNavigation()));
  

    return router;
  }
}
