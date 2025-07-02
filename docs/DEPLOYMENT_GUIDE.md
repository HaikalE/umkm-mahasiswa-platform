# Deployment Guide

## Flutter App Deployment

### Android (Google Play Store)

1. **Prepare for Release**
   ```bash
   # Clean and get dependencies
   flutter clean
   flutter pub get
   
   # Generate missing files
   flutter packages pub run build_runner build
   ```

2. **Create Keystore**
   ```bash
   keytool -genkey -v -keystore ~/upload-keystore.jks -keyalg RSA -keysize 2048 -validity 10000 -alias upload
   ```

3. **Configure Signing**
   Create `android/key.properties`:
   ```
   storePassword=your_store_password
   keyPassword=your_key_password
   keyAlias=upload
   storeFile=/path/to/upload-keystore.jks
   ```

4. **Build Release APK**
   ```bash
   flutter build apk --release
   ```

5. **Build App Bundle**
   ```bash
   flutter build appbundle --release
   ```

### iOS (App Store)

1. **Prepare iOS Build**
   ```bash
   flutter build ios --release
   ```

2. **Open in Xcode**
   ```bash
   open ios/Runner.xcworkspace
   ```

3. **Configure Signing & Capabilities**
   - Set your Team
   - Configure Bundle Identifier
   - Set up Certificates

4. **Archive and Upload**
   - Product → Archive
   - Upload to App Store Connect

### Web Deployment

1. **Build Web**
   ```bash
   flutter build web --release
   ```

2. **Deploy to Firebase Hosting**
   ```bash
   firebase deploy --only hosting
   ```

3. **Deploy to Netlify**
   ```bash
   # Build output is in build/web/
   netlify deploy --prod --dir=build/web
   ```

## Backend Deployment

### Database Setup (PostgreSQL)

1. **Production Database**
   ```sql
   -- Create database
   CREATE DATABASE umkm_mahasiswa_production;
   
   -- Create user
   CREATE USER umkm_app WITH PASSWORD 'secure_password';
   
   -- Grant permissions
   GRANT ALL PRIVILEGES ON DATABASE umkm_mahasiswa_production TO umkm_app;
   ```

2. **Run Migrations**
   ```bash
   psql -h localhost -U umkm_app -d umkm_mahasiswa_production -f database/schema.sql
   ```

### Docker Deployment

1. **Create Dockerfile**
   ```dockerfile
   FROM node:18-alpine
   
   WORKDIR /app
   
   COPY package*.json ./
   RUN npm ci --only=production
   
   COPY . .
   
   EXPOSE 3000
   
   CMD ["npm", "start"]
   ```

2. **Docker Compose**
   ```yaml
   version: '3.8'
   
   services:
     app:
       build: .
       ports:
         - "3000:3000"
       environment:
         - NODE_ENV=production
         - DATABASE_URL=postgresql://user:pass@db:5432/umkm_mahasiswa
       depends_on:
         - db
   
     db:
       image: postgres:15
       environment:
         POSTGRES_DB: umkm_mahasiswa
         POSTGRES_USER: umkm_app
         POSTGRES_PASSWORD: secure_password
       volumes:
         - postgres_data:/var/lib/postgresql/data
   
   volumes:
     postgres_data:
   ```

### Cloud Deployment Options

#### AWS (Recommended)

1. **ECS with Fargate**
   - Container-based deployment
   - Auto-scaling
   - Load balancing

2. **RDS PostgreSQL**
   - Managed database
   - Automated backups
   - Multi-AZ deployment

3. **S3 + CloudFront**
   - File storage
   - CDN for images

#### Google Cloud Platform

1. **Cloud Run**
   - Serverless containers
   - Pay-per-use

2. **Cloud SQL**
   - Managed PostgreSQL

3. **Cloud Storage**
   - File uploads

#### Heroku (Development/Staging)

1. **Deploy App**
   ```bash
   heroku create umkm-mahasiswa-api
   heroku addons:create heroku-postgresql:hobby-dev
   git push heroku main
   ```

2. **Set Environment Variables**
   ```bash
   heroku config:set NODE_ENV=production
   heroku config:set JWT_SECRET=your_jwt_secret
   ```

## Environment Configuration

### Production Environment Variables

**Backend (.env)**
```env
NODE_ENV=production
PORT=3000
DATABASE_URL=postgresql://user:pass@host:5432/database
JWT_SECRET=your_super_secret_jwt_key
JWT_EXPIRES_IN=24h
REFRESH_TOKEN_EXPIRES_IN=7d
CLOUDINARY_CLOUD_NAME=your_cloudinary_name
CLOUDINARY_API_KEY=your_api_key
CLOUDINARY_API_SECRET=your_api_secret
FIREBASE_PROJECT_ID=your_firebase_project
FIREBASE_PRIVATE_KEY=your_private_key
SMTP_HOST=smtp.gmail.com
SMTP_PORT=587
SMTP_USER=your_email@gmail.com
SMTP_PASS=your_app_password
```

**Flutter (production config)**
```dart
class AppConfig {
  static const String apiBaseUrl = 'https://api.umkm-mahasiswa.id';
  static const String firebaseProjectId = 'umkm-mahasiswa-prod';
  static const bool enableAnalytics = true;
}
```

## Monitoring & Analytics

### Backend Monitoring

1. **Error Tracking (Sentry)**
   ```javascript
   const Sentry = require('@sentry/node');
   
   Sentry.init({
     dsn: 'your_sentry_dsn',
     environment: process.env.NODE_ENV,
   });
   ```

2. **Performance Monitoring**
   - New Relic
   - DataDog
   - AWS CloudWatch

### Flutter Analytics

1. **Firebase Analytics**
   ```dart
   await FirebaseAnalytics.instance.logEvent(
     name: 'user_registration',
     parameters: {
       'user_type': userType,
       'registration_method': 'email',
     },
   );
   ```

2. **Crashlytics**
   ```dart
   await FirebaseCrashlytics.instance.recordError(
     exception,
     stackTrace,
     reason: 'User registration failed',
   );
   ```

## CI/CD Pipeline

### GitHub Actions

```yaml
name: Deploy

on:
  push:
    branches: [main]

jobs:
  deploy-backend:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v3
      
      - name: Setup Node.js
        uses: actions/setup-node@v3
        with:
          node-version: '18'
          
      - name: Install dependencies
        run: npm ci
        
      - name: Run tests
        run: npm test
        
      - name: Deploy to production
        run: |
          # Your deployment script
          
  deploy-flutter:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v3
      
      - name: Setup Flutter
        uses: subosito/flutter-action@v2
        with:
          flutter-version: '3.16.0'
          
      - name: Get dependencies
        run: flutter pub get
        
      - name: Run tests
        run: flutter test
        
      - name: Build web
        run: flutter build web --release
        
      - name: Deploy to Firebase
        run: |
          npm install -g firebase-tools
          firebase deploy --only hosting
```

## Security Checklist

- [ ] HTTPS enabled
- [ ] Environment variables secured
- [ ] Database credentials rotated
- [ ] API rate limiting implemented
- [ ] Input validation enabled
- [ ] CORS properly configured
- [ ] JWT tokens properly secured
- [ ] File upload restrictions in place
- [ ] Error messages don't expose sensitive data
- [ ] Regular security updates

## Performance Optimization

- [ ] Database indexes optimized
- [ ] Image compression enabled
- [ ] CDN configured for static assets
- [ ] Database connection pooling
- [ ] API response caching
- [ ] Flutter build optimized
- [ ] Bundle size analyzed
- [ ] Loading states implemented
- [ ] Error boundaries in place

## Backup Strategy

1. **Database Backups**
   - Automated daily backups
   - Point-in-time recovery
   - Cross-region replication

2. **File Backups**
   - Cloud storage replication
   - Regular backup verification

3. **Code Backups**
   - Git repository mirrors
   - Release tags

## Rollback Plan

1. **Database Rollback**
   - Migration rollback scripts
   - Point-in-time recovery

2. **Application Rollback**
   - Previous Docker image
   - Blue-green deployment

3. **App Store Rollback**
   - Previous app version
   - Phased rollout capability