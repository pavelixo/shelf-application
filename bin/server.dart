import 'dart:io';
import 'package:shelf/shelf.dart';
import 'package:shelf/shelf_io.dart' as shelf_io;
import 'package:shelf_router/shelf_router.dart';

import '../lib/config.dart';
import '../lib/handlers.dart' as handlers;

void main() async {
  final app = Router();

  app.get('/api/hello', handlers.handleHelloRequest);
  app.post('/api/data', handlers.handlePostData);

  var handler = const Pipeline().addMiddleware(logRequests()).addHandler(app);

  var server = await shelf_io.serve(handler, Config.host, Config.port);
  print('http://${Config.host}:${Config.port}');

  // get /api/hello/
  // post /api/data/
}