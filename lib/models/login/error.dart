class LoginError {
  String message;
  String status;

  LoginError.fromJSON(Map<String, dynamic> parsedJson) {
    this.message = parsedJson['message'];
    this.status = parsedJson['status'];
  }
}