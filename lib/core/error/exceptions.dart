// Custom Exception Classes for the App

abstract class AppException implements Exception {
  final String message;
  final int? statusCode;
  
  const AppException(this.message, [this.statusCode]);
  
  @override
  String toString() => message;
}

// Network Exceptions
class NetworkException extends AppException {
  const NetworkException(super.message, [super.statusCode]);
}

class ServerException extends AppException {
  const ServerException(super.message, [super.statusCode]);
}

class UnauthorizedException extends AppException {
  const UnauthorizedException([String? message])
      : super(message ?? 'Unauthorized access');
}

class ForbiddenException extends AppException {
  const ForbiddenException([String? message])
      : super(message ?? 'Access forbidden');
}

class NotFoundException extends AppException {
  const NotFoundException([String? message])
      : super(message ?? 'Resource not found');
}

class TimeoutException extends AppException {
  const TimeoutException([String? message])
      : super(message ?? 'Request timeout');
}

// Local Storage Exceptions
class CacheException extends AppException {
  const CacheException(super.message);
}

class StorageException extends AppException {
  const StorageException(super.message);
}

// Validation Exceptions
class ValidationException extends AppException {
  final Map<String, List<String>>? errors;
  
  const ValidationException(super.message, [this.errors]);
}

// File Upload Exceptions
class FileUploadException extends AppException {
  const FileUploadException(super.message);
}

class FileSizeException extends AppException {
  const FileSizeException([String? message])
      : super(message ?? 'File size exceeds limit');
}

class FileTypeException extends AppException {
  const FileTypeException([String? message])
      : super(message ?? 'Invalid file type');
}

// Business Logic Exceptions
class BusinessLogicException extends AppException {
  const BusinessLogicException(super.message);
}

class InsufficientPermissionException extends AppException {
  const InsufficientPermissionException([String? message])
      : super(message ?? 'Insufficient permissions');
}

// Parse Exceptions
class ParseException extends AppException {
  const ParseException([String? message])
      : super(message ?? 'Failed to parse data');
}

// Unknown Exception
class UnknownException extends AppException {
  const UnknownException([String? message])
      : super(message ?? 'An unknown error occurred');
}