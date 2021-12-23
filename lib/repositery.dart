import 'package:api/service.dart';

import 'model_class.dart';

class Repositery {
  final Httpserver = HttpServers();
  Future<List<dynamic>> getDataHttp() {
    var list = Httpserver.getMethod();
    return list;
  }
}
