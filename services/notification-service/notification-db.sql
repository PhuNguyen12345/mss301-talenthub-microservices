CREATE DATABASE notification_db;

-- Bảng lưu mẫu Email (Offer letter, Rejection, Invite...)
CREATE TABLE email_templates (
                                 id BIGSERIAL PRIMARY KEY,
                                 template_name VARCHAR(255) NOT NULL,
                                 type VARCHAR(50),
                                 subject VARCHAR(500),
                                 body_html TEXT,
                                 placeholders TEXT,
                                 is_active BOOLEAN DEFAULT TRUE,
                                 is_deleted BOOLEAN DEFAULT FALSE,
    -- Audit cols...
);

-- Bảng log lịch sử gửi mail
CREATE TABLE email_logs (
                            id BIGSERIAL PRIMARY KEY,
                            application_id BIGINT, -- Lưu log theo application
                            email_template_id BIGINT,
                            recipient_email VARCHAR(255),
                            status VARCHAR(50), -- SENT, FAILED, PENDING
                            sent_at TIMESTAMP WITH TIME ZONE,
    -- Audit cols...
);

-- Bảng tạo Token bảo mật cho các link trong email (VD: Link xác nhận tham gia PV)
CREATE TABLE actionable_email_tokens (
                                         id BIGSERIAL PRIMARY KEY,
                                         application_id BIGINT,
                                         token_hash VARCHAR(512),
                                         action_type VARCHAR(50),
                                         expires_at TIMESTAMP WITH TIME ZONE,
                                         used_at TIMESTAMP WITH TIME ZONE,
                                         is_deleted BOOLEAN DEFAULT FALSE
);

-- Bảng thông báo in-app (Cái chuông trên web)
CREATE TABLE notifications (
                               id BIGSERIAL PRIMARY KEY,
                               user_id BIGINT,
                               type VARCHAR(50),
                               title VARCHAR(500),
                               message TEXT,
                               is_read BOOLEAN DEFAULT FALSE,
    -- Audit cols...
);