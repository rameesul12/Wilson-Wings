import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:wilson_wings/utils/apiconfiguaration/api_configuaration.dart';

Future apiGet(String uri)async{
final http.Response response;
final baseUrl=ApiConfiguaration.baseUrl+uri;

 response=await http.get(Uri.parse('$baseUrl?api_key=${ApiConfiguaration.apiKey}'));

 return response;

}