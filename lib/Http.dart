import 'package:http/http.dart' as http;

void main(){
sendGet();
sendPost();
}

void sendGet() async {
  try {
    var response = await http.get('https://json.flutter.su/echo?id=1');
    print("Response status: ${response.statusCode}");
    print("Response status: ${response.body}");
  } on Exception catch (e) {
    print(e);
  }
}
void sendPost() async {
  var response = await http.post('https://json.flutter.su/echo',
      headers:{'Accept':'application/json','Authorization':'Basic YWxhZGRpbjpvcGVuc2VzYW1l'},
      body:{'name':'test','num':'10'});
  print("Response status: ${response.statusCode}");
  print("Response status: ${response.body}");
}