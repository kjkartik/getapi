import 'dart:convert';
import 'package:http/http.dart' as http;

class HttpServers {
  var url = Uri.parse(
      ' http://saloonapi.vfastdelivery.in/Api/Rebliss/GetMarkAttendanceUserInfo/0');
  Future<List<dynamic>> getMethod() async {
    var response = await http.get(url);
    if (response.statusCode == 200) {
      List<dynamic> result = jsonDecode(response.body);

      return result;
    } else {
      print("Error");
    }
    return null!;
  }
}
