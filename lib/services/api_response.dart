class ApiResponse<T> {
  final bool ok;
  final String message;
  final T? result;

  ApiResponse.ok({this.result, required this.message}) : ok = true;

  ApiResponse.error({this.result, required this.message}) : ok = false;
}
