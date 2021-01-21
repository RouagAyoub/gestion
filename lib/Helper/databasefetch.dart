import 'package:gestion/Model/Productfood.dart';
import 'package:http/http.dart' as http;

const String apiurl = 'http://192.168.1.109/data.php';

Future<List<Productfood>> getdata(queryform) async {
  final response = await http
      .post(apiurl, body: {'queryrequest': queryform, 'action': 'GET_ALL'});
  if (response.body.contains('error')) {
    return null;
  } else {
    return productfoodFromMap(response.body);
  }
}
