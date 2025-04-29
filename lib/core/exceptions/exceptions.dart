import '../../l10n/localizations_utils.dart';

class ApiException implements Exception {
  ApiException({this.message = ''});

  final String message;

  @override
  String toString() {
    return message;
  }
}

class InternalServerException extends ApiException {
  InternalServerException()
      : super(message: appLocalizations.serverCommunicationErrorMessage);
}

class BadGateWayException extends ApiException {
  BadGateWayException() : super(message: appLocalizations.serverSideErrorMessage);
}

class BadRequestException extends ApiException {
  BadRequestException({String? message})
      : super(message: message ?? appLocalizations.invalidRequestErrorMessage);
}

class UnauthorizedException extends ApiException {
  UnauthorizedException() : super(message: appLocalizations.incorrectCredentialsErrorMessage);
}

class ConflictException extends ApiException {
  ConflictException() : super(message: appLocalizations.conflictErrorMessage);
}

class ForbiddenException extends ApiException {
  ForbiddenException() : super(message: appLocalizations.requestAccessErrorMessage);
}

class NotFoundException extends ApiException {
  NotFoundException([String? message])
      : super(message: message ?? appLocalizations.resourceErrorMessage);
}

class InvalidException extends ApiException {
  InvalidException({required int statusCode, String message = ''})
      : super(
      message: appLocalizations.responseFailedErrorMessage(statusCode, message));
}

class BackendException implements Exception {
  BackendException(this.message);
  final dynamic message;
}

class ResponseEmptyException extends ApiException {
  ResponseEmptyException() : super(message: appLocalizations.nullResponseMessage);
}

class ValidationException extends ApiException {
  ValidationException({String? message})
      : super(message: message ?? appLocalizations.validationErrorMessage);
}

class PermissionDeniedException extends ApiException {
  PermissionDeniedException({String? message})
      : super(message: message ?? appLocalizations.permissionErrorMessage);
}
