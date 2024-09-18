import 'ui_error.dart';

abstract class Resource<T, E> {
  T? data;

  Resource({this.data});
}

class ResourceLoading extends Resource {}

class ResourceError<T, E> extends Resource<T, E> {
  UIError<E> error;

  ResourceError({required this.error}) : super(data: null);
}

class ResourceSuccess<T, E> extends Resource<T, E> {
  ResourceSuccess(T? data) : super(data: data);
}
