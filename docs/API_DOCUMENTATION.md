# API Documentation

## Base URL
```
https://api.umkm-mahasiswa.id/v1
```

## Authentication
All API requests require authentication using Bearer token in the Authorization header:
```
Authorization: Bearer <your_access_token>
```

## Endpoints

### Authentication

#### POST /auth/register
Register new user account

**Request Body:**
```json
{
  "email": "user@example.com",
  "password": "password123",
  "user_type": "student" // or "umkm"
}
```

**Response:**
```json
{
  "success": true,
  "data": {
    "user": {
      "id": "uuid",
      "email": "user@example.com",
      "user_type": "student",
      "is_verified": false
    },
    "tokens": {
      "access_token": "jwt_token",
      "refresh_token": "refresh_token"
    }
  }
}
```

#### POST /auth/login
Login with email and password

**Request Body:**
```json
{
  "email": "user@example.com",
  "password": "password123"
}
```

#### POST /auth/logout
Logout and invalidate tokens

#### POST /auth/refresh
Refresh access token using refresh token

### User Profiles

#### GET /students/profiles
Get list of student profiles

**Query Parameters:**
- `page` (optional): Page number
- `limit` (optional): Items per page
- `university` (optional): Filter by university
- `major` (optional): Filter by major
- `skills` (optional): Filter by skills (comma-separated)

#### POST /students/profiles
Create student profile

**Request Body:**
```json
{
  "full_name": "John Doe",
  "nim": "123456789",
  "university": "Universitas Indonesia",
  "major": "Teknik Informatika",
  "semester": 6,
  "graduation_year": 2025,
  "bio": "Student bio...",
  "skills": ["Flutter", "UI/UX Design"],
  "hourly_rate_min": 50000,
  "hourly_rate_max": 100000
}
```

#### GET /umkm/profiles
Get list of UMKM profiles

#### POST /umkm/profiles
Create UMKM profile

### Products

#### GET /products
Get list of products

#### POST /products
Create new product

#### GET /products/{id}
Get product details

#### PUT /products/{id}
Update product

#### DELETE /products/{id}
Delete product

### Projects

#### GET /projects
Get list of projects

#### POST /projects
Create new project

#### GET /projects/{id}
Get project details

#### POST /projects/{id}/applications
Apply to project

### Chat

#### GET /conversations
Get user conversations

#### GET /conversations/{id}/messages
Get conversation messages

#### POST /conversations/{id}/messages
Send message

### File Upload

#### POST /upload
Upload files (images, documents)

**Request:**
- Method: POST
- Content-Type: multipart/form-data
- Fields:
  - `file`: File to upload
  - `type`: File type (profile_picture, portfolio, document)

## Error Responses

### 400 Bad Request
```json
{
  "success": false,
  "error": {
    "code": "VALIDATION_ERROR",
    "message": "Validation failed",
    "details": {
      "email": ["Email is required"]
    }
  }
}
```

### 401 Unauthorized
```json
{
  "success": false,
  "error": {
    "code": "UNAUTHORIZED",
    "message": "Invalid credentials"
  }
}
```

### 404 Not Found
```json
{
  "success": false,
  "error": {
    "code": "NOT_FOUND",
    "message": "Resource not found"
  }
}
```

### 500 Internal Server Error
```json
{
  "success": false,
  "error": {
    "code": "INTERNAL_ERROR",
    "message": "Internal server error"
  }
}
```

## Rate Limiting
- 1000 requests per hour per user
- 100 requests per minute per IP

## Pagination
All list endpoints support pagination:

**Query Parameters:**
- `page`: Page number (default: 1)
- `limit`: Items per page (default: 20, max: 100)

**Response:**
```json
{
  "success": true,
  "data": [...],
  "pagination": {
    "current_page": 1,
    "total_pages": 5,
    "total_items": 95,
    "items_per_page": 20
  }
}
```

## WebSocket Events
For real-time features (chat, notifications):

**Connection:**
```
ws://api.umkm-mahasiswa.id/ws?token=<access_token>
```

**Events:**
- `message_received`: New chat message
- `notification_received`: New notification
- `user_online`: User came online
- `user_offline`: User went offline