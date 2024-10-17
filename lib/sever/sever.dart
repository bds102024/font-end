import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:shelf/shelf.dart';
import 'package:shelf/shelf_io.dart' as shelf_io;
import 'package:http/http.dart' as http;

// Hàm khởi chạy server
Future<void> startServer() async {
  await dotenv.load();
  var host = dotenv.env['HOST'] ?? '103.216.118.134';

  var handler =
      const Pipeline().addMiddleware(logRequests()).addHandler(_echoRequest);

  var server = await shelf_io.serve(handler, host, 8899);
  print('Serving at http://${server.address.host}:${server.port}');
}

Future<Response> _echoRequest(Request request) async {
  var token = request.requestedUri.queryParameters['Token'];
  var apiUrl = dotenv.env['API_URL']; // Lấy URL từ .env

  if (apiUrl != null && token != null) {
    var apiResponse = await http.get(
      Uri.parse(apiUrl), // Sử dụng apiUrl từ .env
      headers: {'Authorization': 'Bearer $token'},
    );
    return Response.ok('API Response: ${apiResponse.body}');
  } else {
    return Response.notFound('Missing URL or Token');
  }
}
