import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

@module
abstract class AppModule {
  // You can register named preemptive types like follows
  @Named("baseUrl")
  String get baseUrl => "https://api.mydailychoice.com/api/ubo/akashx/";

  @Named("baseUrlAuth")
  String get baseUrlAuth => "https://api.mydailychoice.com/api/ubo/auth/";

  @lazySingleton
  Dio dio(@Named('baseUrl') String url) => Dio(BaseOptions(
        baseUrl: url,
        headers: {
          "Content-Type": "application/json",
          "Accept": "application/json",
        },
      ))
        ..interceptors.add(PrettyDioLogger(
            requestHeader: true,
            requestBody: true,
            responseBody: true,
            responseHeader: false,
            error: true,
            compact: true,
            maxWidth: 90))
        ..interceptors.add(InterceptorsWrapper(
          onError: (DioException error, ErrorInterceptorHandler handler) {
            if (error.response?.statusCode == 422) {
              // Transform DioError into a normal response
              return handler.resolve(Response(
                requestOptions: error.requestOptions,
                statusCode: 422,
                data: error.response?.data,
              ));
            }
            return handler.next(error);
          },
        ));

  @lazySingleton
  @Named("auth")
  Dio dioAuth(@Named('baseUrlAuth') String url) => Dio(BaseOptions(
        baseUrl: url,
        headers: {
          "Content-Type": "application/json",
          "Accept": "application/json",
        },
      ))
        ..interceptors.add(PrettyDioLogger(
            requestHeader: true,
            requestBody: true,
            responseBody: true,
            responseHeader: false,
            error: true,
            compact: true,
            maxWidth: 90))
        ..interceptors.add(InterceptorsWrapper(
          onError: (DioException error, ErrorInterceptorHandler handler) {
            if (error.response?.statusCode == 422) {
              // Transform DioError into a normal response
              return handler.resolve(Response(
                requestOptions: error.requestOptions,
                statusCode: 422,
                data: error.response?.data,
              ));
            }
            return handler.next(error);
          },
        ));
}
