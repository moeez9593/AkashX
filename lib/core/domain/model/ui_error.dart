


class UIError<T> {
  final String? message;
  final T type;

  UIError({
    this.message,
    required this.type,
  });
}
