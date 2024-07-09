import 'dart:convert';
import 'package:shelf/shelf.dart';

Response handleHelloRequest(Request request) {
  return Response.ok('Hello, world!');
}

Future<Response> handlePostData(Request request) async {
  final body = await request.readAsString();
  final parsedBody = jsonDecode(body);
  return Response.ok('Received data: $parsedBody');
}
