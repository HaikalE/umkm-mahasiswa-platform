import 'package:equatable/equatable.dart';

// Base Failure Class
abstract class Failure extends Equatable {
  final String message;
  final int? statusCode;
  
  const Failure(this.message, [this.statusCode]);
  
  @override
  List<Object?> get props => [message, statusCode];
  
  @override
  String toString() => message;
}

// Network Failures
class NetworkFailure extends Failure {
  const NetworkFailure([String? message])
      : super(message ?? 'Network connection failed');
}

class ServerFailure extends Failure {
  const ServerFailure([String? message, int? statusCode])
      : super(message ?? 'Server error occurred', statusCode);
}

class UnauthorizedFailure extends Failure {
  const UnauthorizedFailure([String? message])
      : super(message ?? 'Unauthorized access');
}

class ForbiddenFailure extends Failure {
  const ForbiddenFailure([String? message])
      : super(message ?? 'Access forbidden');
}

class NotFoundFailure extends Failure {
  const NotFoundFailure([String? message])
      : super(message ?? 'Resource not found');
}

class TimeoutFailure extends Failure {
  const TimeoutFailure([String? message])
      : super(message ?? 'Request timeout');
}

// Local Storage Failures
class CacheFailure extends Failure {
  const CacheFailure([String? message])
      : super(message ?? 'Cache operation failed');
}

class StorageFailure extends Failure {
  const StorageFailure([String? message])
      : super(message ?? 'Storage operation failed');
}

// Validation Failures
class ValidationFailure extends Failure {
  final Map<String, List<String>>? errors;
  
  const ValidationFailure(String message, [this.errors]) : super(message);
  
  @override
  List<Object?> get props => [message, statusCode, errors];
}

// File Upload Failures
class FileUploadFailure extends Failure {
  const FileUploadFailure([String? message])
      : super(message ?? 'File upload failed');
}

class FileSizeFailure extends Failure {
  const FileSizeFailure([String? message])
      : super(message ?? 'File size exceeds limit');
}

class FileTypeFailure extends Failure {
  const FileTypeFailure([String? message])
      : super(message ?? 'Invalid file type');
}

// Business Logic Failures
class BusinessLogicFailure extends Failure {
  const BusinessLogicFailure(String message) : super(message);
}

class InsufficientPermissionFailure extends Failure {
  const InsufficientPermissionFailure([String? message])
      : super(message ?? 'Insufficient permissions');
}

// Parse Failures
class ParseFailure extends Failure {
  const ParseFailure([String? message])
      : super(message ?? 'Failed to parse data');
}

// Unknown Failure
class UnknownFailure extends Failure {
  const UnknownFailure([String? message])
      : super(message ?? 'An unknown error occurred');
}