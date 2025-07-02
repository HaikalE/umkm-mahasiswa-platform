# 🚀 UMKM x Mahasiswa Platform

**Platform Digitalisasi UMKM & Mahasiswa Indonesia**

Menghubungkan UMKM dengan talenta mahasiswa untuk kolaborasi dan pertumbuhan bisnis.

## 🎯 Vision & Mission

**Vision**: Menjadi jembatan digital antara UMKM dan mahasiswa Indonesia untuk saling memberdayakan

**Mission**:
- 📈 Meningkatkan digitalisasi UMKM Indonesia
- 🎓 Memberikan pengalaman kerja nyata bagi mahasiswa
- 🤝 Menciptakan ekosistem kolaborasi yang saling menguntungkan
- 💡 Mendorong inovasi dan entrepreneurship

## ✨ Core Features MVP v1.0

### Untuk UMKM:
- ✅ Buat profil bisnis lengkap
- ✅ Upload produk/jasa dengan foto
- ✅ Post project/job untuk mahasiswa
- ✅ Chat dengan mahasiswa
- ✅ Dashboard penjualan sederhana
- ✅ Rating & review system

### Untuk Mahasiswa:
- ✅ Profil dengan skill & portofolio
- ✅ Browse produk UMKM
- ✅ Cari project/job opportunities
- ✅ Chat dengan UMKM
- ✅ Upload portofolio (design, code, dll)
- ✅ Community forum

### Fitur Bersama:
- ✅ Authentication (Email, Google)
- ✅ Real-time chat
- ✅ Push notifications
- ✅ Search & filter
- ✅ Rating & review system

## 🛠️ Tech Stack

- **Frontend**: Flutter (Mobile + Web)
- **Backend**: Node.js + Express.js
- **Database**: PostgreSQL
- **Auth**: Firebase Auth
- **Storage**: Cloudinary
- **Notifications**: Firebase FCM
- **Payment**: Midtrans (future)

## 📱 Platforms

- **Phase 1**: Android + iOS (Flutter)
- **Phase 2**: Web (Flutter Web)
- **Phase 3**: Admin Dashboard (React/Vue)

## 🗃️ Database Schema

```sql
-- Core tables designed for scalability
Users (id, email, user_type, created_at)
UMKM_Profiles (user_id, business_name, category, location)
Student_Profiles (user_id, university, major, skills)
Products (id, umkm_id, name, price, description)
Projects (id, umkm_id, title, budget, deadline)
Applications (id, project_id, student_id, status)
Chats (id, sender_id, receiver_id, message, timestamp)
```

## 🚀 Development Roadmap

### 📅 Week 1-2: Foundation
- [x] Setup Flutter project structure
- [x] Database schema design
- [ ] Authentication flow
- [ ] Basic UI components
- [ ] Navigation setup

### 📅 Week 3-4: Core Features
- [ ] User registration (UMKM vs Mahasiswa)
- [ ] Profile creation & editing
- [ ] Product/Project posting
- [ ] Basic search & browse

### 📅 Week 5-6: Interaction
- [ ] Chat system
- [ ] Application/Interest system
- [ ] Rating & review
- [ ] Notifications

### 📅 Week 7-8: Polish & Launch
- [ ] UI/UX improvements
- [ ] Testing & bug fixes
- [ ] Beta user testing
- [ ] Play Store deployment

## 🎨 Design System

- **Primary Color**: #2E7D8F (Teal - Professional)
- **Secondary Color**: #F39C12 (Orange - Energy)
- **Accent Color**: #E74C3C (Red - Action)
- **Typography**: Inter (Clean & Modern)

## 📦 Getting Started

```bash
# Clone repository
git clone https://github.com/HaikalE/umkm-mahasiswa-platform.git
cd umkm-mahasiswa-platform

# Install dependencies
flutter pub get

# Run on device/emulator
flutter run

# Build for production
flutter build apk --release
```

## 🤝 Contributing

Kami welcome kontribusi dari mahasiswa dan developer!

1. Fork repository
2. Create feature branch
3. Commit changes
4. Create pull request

## 📱 Contact

- **Email**: dev@umkm-mahasiswa.id
- **Instagram**: @umkm.mahasiswa
- **LinkedIn**: UMKM x Mahasiswa Platform

## 📄 License

MIT License - Feel free to use for educational purposes

---

**Made with ❤️ for Indonesia** 🇮🇩