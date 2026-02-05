

class ErrorStatus {
  String message;
  num? code;

  ErrorStatus({required this.message,  this.code});
}

class ResponseStatus {
  num? statusCode;
  dynamic responseData;

  ResponseStatus({required this.statusCode, required this.responseData});
}