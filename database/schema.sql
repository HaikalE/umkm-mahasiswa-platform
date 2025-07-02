-- UMKM x Mahasiswa Platform Database Schema
-- PostgreSQL Schema for MVP v1.0

-- Enable UUID extension
CREATE EXTENSION IF NOT EXISTS "uuid-ossp";

-- Users table (shared for both UMKM and Students)
CREATE TABLE users (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    email VARCHAR(255) UNIQUE NOT NULL,
    phone VARCHAR(20),
    password_hash VARCHAR(255),
    user_type VARCHAR(20) CHECK (user_type IN ('umkm', 'student')) NOT NULL,
    is_verified BOOLEAN DEFAULT FALSE,
    is_active BOOLEAN DEFAULT TRUE,
    firebase_uid VARCHAR(255) UNIQUE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- UMKM Profiles
CREATE TABLE umkm_profiles (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    user_id UUID REFERENCES users(id) ON DELETE CASCADE,
    business_name VARCHAR(255) NOT NULL,
    business_description TEXT,
    category VARCHAR(100), -- Food, Fashion, Tech, Service, etc.
    sub_category VARCHAR(100),
    location_province VARCHAR(100),
    location_city VARCHAR(100),
    location_address TEXT,
    latitude DECIMAL(10, 8),
    longitude DECIMAL(11, 8),
    website_url VARCHAR(255),
    instagram_url VARCHAR(255),
    whatsapp_number VARCHAR(20),
    business_logo_url TEXT,
    business_banner_url TEXT,
    established_year INTEGER,
    employee_count INTEGER,
    monthly_revenue_range VARCHAR(50), -- <1jt, 1-5jt, 5-10jt, >10jt
    is_verified BOOLEAN DEFAULT FALSE,
    verification_documents JSONB, -- Store document URLs
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Student Profiles
CREATE TABLE student_profiles (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    user_id UUID REFERENCES users(id) ON DELETE CASCADE,
    full_name VARCHAR(255) NOT NULL,
    nim VARCHAR(50),
    university VARCHAR(255) NOT NULL,
    faculty VARCHAR(255),
    major VARCHAR(255) NOT NULL,
    semester INTEGER,
    graduation_year INTEGER,
    gpa DECIMAL(3, 2),
    bio TEXT,
    skills JSONB, -- ["UI/UX Design", "Flutter", "Marketing"]
    interests JSONB, -- ["Technology", "Design", "Business"]
    portfolio_url VARCHAR(255),
    linkedin_url VARCHAR(255),
    github_url VARCHAR(255),
    behance_url VARCHAR(255),
    profile_picture_url TEXT,
    cv_url TEXT,
    location_province VARCHAR(100),
    location_city VARCHAR(100),
    is_available_for_work BOOLEAN DEFAULT TRUE,
    hourly_rate_min INTEGER, -- in Rupiah
    hourly_rate_max INTEGER,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Products (for UMKM)
CREATE TABLE products (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    umkm_id UUID REFERENCES umkm_profiles(id) ON DELETE CASCADE,
    name VARCHAR(255) NOT NULL,
    description TEXT,
    category VARCHAR(100),
    price DECIMAL(12, 2),
    price_type VARCHAR(20) CHECK (price_type IN ('fixed', 'range', 'negotiable')),
    price_min DECIMAL(12, 2),
    price_max DECIMAL(12, 2),
    currency VARCHAR(10) DEFAULT 'IDR',
    images JSONB, -- Array of image URLs
    specifications JSONB, -- Product specs as key-value pairs
    stock_quantity INTEGER,
    is_available BOOLEAN DEFAULT TRUE,
    is_featured BOOLEAN DEFAULT FALSE,
    view_count INTEGER DEFAULT 0,
    like_count INTEGER DEFAULT 0,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Projects/Jobs (posted by UMKM for Students)
CREATE TABLE projects (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    umkm_id UUID REFERENCES umkm_profiles(id) ON DELETE CASCADE,
    title VARCHAR(255) NOT NULL,
    description TEXT NOT NULL,
    category VARCHAR(100), -- Design, Development, Marketing, Content, etc.
    project_type VARCHAR(50) CHECK (project_type IN ('freelance', 'internship', 'part_time', 'full_time', 'competition')),
    budget_type VARCHAR(20) CHECK (budget_type IN ('fixed', 'hourly', 'negotiable')),
    budget_amount DECIMAL(12, 2),
    budget_currency VARCHAR(10) DEFAULT 'IDR',
    required_skills JSONB, -- ["Flutter", "UI/UX", "Marketing"]
    experience_level VARCHAR(20) CHECK (experience_level IN ('beginner', 'intermediate', 'advanced', 'any')),
    duration_estimate VARCHAR(100), -- "2 weeks", "1 month", "ongoing"
    deadline DATE,
    location_type VARCHAR(20) CHECK (location_type IN ('remote', 'onsite', 'hybrid')),
    location_city VARCHAR(100),
    application_deadline DATE,
    max_applicants INTEGER,
    status VARCHAR(20) CHECK (status IN ('open', 'in_progress', 'completed', 'cancelled')) DEFAULT 'open',
    view_count INTEGER DEFAULT 0,
    application_count INTEGER DEFAULT 0,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Project Applications
CREATE TABLE project_applications (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    project_id UUID REFERENCES projects(id) ON DELETE CASCADE,
    student_id UUID REFERENCES student_profiles(id) ON DELETE CASCADE,
    cover_letter TEXT,
    proposed_rate DECIMAL(12, 2),
    estimated_duration VARCHAR(100),
    portfolio_links JSONB, -- Array of relevant portfolio URLs
    status VARCHAR(20) CHECK (status IN ('pending', 'accepted', 'rejected', 'withdrawn')) DEFAULT 'pending',
    applied_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    responded_at TIMESTAMP,
    UNIQUE(project_id, student_id)
);

-- Portfolio Items (for Students)
CREATE TABLE portfolio_items (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    student_id UUID REFERENCES student_profiles(id) ON DELETE CASCADE,
    title VARCHAR(255) NOT NULL,
    description TEXT,
    category VARCHAR(100), -- Design, Code, Writing, Video, etc.
    project_type VARCHAR(100), -- Personal, Academic, Client, etc.
    technologies_used JSONB, -- ["Flutter", "Figma", "React"]
    project_url VARCHAR(255),
    github_url VARCHAR(255),
    demo_url VARCHAR(255),
    images JSONB, -- Array of image URLs
    files JSONB, -- Array of file URLs (PDF, etc.)
    completion_date DATE,
    is_featured BOOLEAN DEFAULT FALSE,
    view_count INTEGER DEFAULT 0,
    like_count INTEGER DEFAULT 0,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Chat Conversations
CREATE TABLE conversations (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    participant_1_id UUID REFERENCES users(id) ON DELETE CASCADE,
    participant_2_id UUID REFERENCES users(id) ON DELETE CASCADE,
    last_message_id UUID,
    last_message_at TIMESTAMP,
    is_active BOOLEAN DEFAULT TRUE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    UNIQUE(participant_1_id, participant_2_id)
);

-- Chat Messages
CREATE TABLE messages (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    conversation_id UUID REFERENCES conversations(id) ON DELETE CASCADE,
    sender_id UUID REFERENCES users(id) ON DELETE CASCADE,
    message_type VARCHAR(20) CHECK (message_type IN ('text', 'image', 'file', 'system')) DEFAULT 'text',
    content TEXT,
    file_url TEXT,
    file_name VARCHAR(255),
    file_size INTEGER,
    is_read BOOLEAN DEFAULT FALSE,
    read_at TIMESTAMP,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Reviews & Ratings
CREATE TABLE reviews (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    reviewer_id UUID REFERENCES users(id) ON DELETE CASCADE,
    reviewee_id UUID REFERENCES users(id) ON DELETE CASCADE,
    project_id UUID REFERENCES projects(id) ON DELETE SET NULL,
    product_id UUID REFERENCES products(id) ON DELETE SET NULL,
    rating INTEGER CHECK (rating >= 1 AND rating <= 5) NOT NULL,
    title VARCHAR(255),
    comment TEXT,
    is_visible BOOLEAN DEFAULT TRUE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    UNIQUE(reviewer_id, reviewee_id, project_id),
    UNIQUE(reviewer_id, product_id)
);

-- Notifications
CREATE TABLE notifications (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    user_id UUID REFERENCES users(id) ON DELETE CASCADE,
    type VARCHAR(50) NOT NULL, -- new_message, project_application, review, etc.
    title VARCHAR(255) NOT NULL,
    body TEXT,
    data JSONB, -- Additional data for the notification
    is_read BOOLEAN DEFAULT FALSE,
    read_at TIMESTAMP,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- User Interactions (likes, saves, follows)
CREATE TABLE user_interactions (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    user_id UUID REFERENCES users(id) ON DELETE CASCADE,
    target_type VARCHAR(20) CHECK (target_type IN ('product', 'portfolio', 'project', 'user')),
    target_id UUID NOT NULL,
    interaction_type VARCHAR(20) CHECK (interaction_type IN ('like', 'save', 'follow', 'view')),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    UNIQUE(user_id, target_type, target_id, interaction_type)
);

-- Categories (for products, projects, skills)
CREATE TABLE categories (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    name VARCHAR(100) UNIQUE NOT NULL,
    slug VARCHAR(100) UNIQUE NOT NULL,
    parent_id UUID REFERENCES categories(id),
    icon VARCHAR(255),
    color VARCHAR(10),
    description TEXT,
    is_active BOOLEAN DEFAULT TRUE,
    sort_order INTEGER DEFAULT 0,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Update timestamps trigger function
CREATE OR REPLACE FUNCTION update_updated_at_column()
RETURNS TRIGGER AS $$
BEGIN
    NEW.updated_at = CURRENT_TIMESTAMP;
    RETURN NEW;
END;
$$ language 'plpgsql';

-- Add triggers for updated_at
CREATE TRIGGER update_users_updated_at BEFORE UPDATE ON users FOR EACH ROW EXECUTE FUNCTION update_updated_at_column();
CREATE TRIGGER update_umkm_profiles_updated_at BEFORE UPDATE ON umkm_profiles FOR EACH ROW EXECUTE FUNCTION update_updated_at_column();
CREATE TRIGGER update_student_profiles_updated_at BEFORE UPDATE ON student_profiles FOR EACH ROW EXECUTE FUNCTION update_updated_at_column();
CREATE TRIGGER update_products_updated_at BEFORE UPDATE ON products FOR EACH ROW EXECUTE FUNCTION update_updated_at_column();
CREATE TRIGGER update_projects_updated_at BEFORE UPDATE ON projects FOR EACH ROW EXECUTE FUNCTION update_updated_at_column();
CREATE TRIGGER update_portfolio_items_updated_at BEFORE UPDATE ON portfolio_items FOR EACH ROW EXECUTE FUNCTION update_updated_at_column();

-- Indexes for performance
CREATE INDEX idx_users_email ON users(email);
CREATE INDEX idx_users_user_type ON users(user_type);
CREATE INDEX idx_users_firebase_uid ON users(firebase_uid);
CREATE INDEX idx_umkm_profiles_user_id ON umkm_profiles(user_id);
CREATE INDEX idx_umkm_profiles_category ON umkm_profiles(category);
CREATE INDEX idx_umkm_profiles_location ON umkm_profiles(location_province, location_city);
CREATE INDEX idx_student_profiles_user_id ON student_profiles(user_id);
CREATE INDEX idx_student_profiles_university ON student_profiles(university);
CREATE INDEX idx_student_profiles_major ON student_profiles(major);
CREATE INDEX idx_products_umkm_id ON products(umkm_id);
CREATE INDEX idx_products_category ON products(category);
CREATE INDEX idx_projects_umkm_id ON projects(umkm_id);
CREATE INDEX idx_projects_category ON projects(category);
CREATE INDEX idx_projects_status ON projects(status);
CREATE INDEX idx_project_applications_project_id ON project_applications(project_id);
CREATE INDEX idx_project_applications_student_id ON project_applications(student_id);
CREATE INDEX idx_conversations_participants ON conversations(participant_1_id, participant_2_id);
CREATE INDEX idx_messages_conversation_id ON messages(conversation_id);
CREATE INDEX idx_notifications_user_id ON notifications(user_id);
CREATE INDEX idx_user_interactions_user_id ON user_interactions(user_id);
CREATE INDEX idx_user_interactions_target ON user_interactions(target_type, target_id);

-- Insert default categories
INSERT INTO categories (name, slug, icon, color) VALUES
('Teknologi', 'teknologi', '💻', '#3498DB'),
('Desain', 'desain', '🎨', '#9B59B6'),
('Bisnis', 'bisnis', '💼', '#2ECC71'),
('Pemasaran', 'pemasaran', '📢', '#E74C3C'),
('Konten', 'konten', '✍️', '#F39C12'),
('Fotografi', 'fotografi', '📷', '#1ABC9C'),
('Video', 'video', '🎬', '#E67E22'),
('Pendidikan', 'pendidikan', '📚', '#34495E');

-- Sample data for testing (optional)
-- This would be populated by the application in production
