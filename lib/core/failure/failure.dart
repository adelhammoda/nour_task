abstract class Failure {
  final String message;
  final String code;
  final FailureType failureType;

  Failure({
    required this.message,
    required this.code,
    required this.failureType,
  });
}


///this type of failure contain : warning , error and exceptions
enum FailureType{
  error, warning , exception
}