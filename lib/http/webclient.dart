import 'package:http/http.dart';
import 'package:http_interceptor/http_interceptor.dart';

import 'interceptor/logging_interceptor.dart';

final Client client = HttpClientWithInterceptor.build(
  interceptors: [LoggingInterceptor()],
);

const String baseUrl = '****:8080/transactions';
