CREATE DATABASE candidate_db;

-- Bảng lưu thông tin Ứng viên
CREATE TABLE candidates (
                            id BIGSERIAL PRIMARY KEY,
                            full_name VARCHAR(255) NOT NULL,
                            email VARCHAR(255) UNIQUE NOT NULL,
                            password_hash VARCHAR(255),
                            auth_provider VARCHAR(50),
                            status VARCHAR(50),
                            phone VARCHAR(50),
                            source VARCHAR(100),
                            utm_source VARCHAR(255),
                            utm_medium VARCHAR(255),
                            utm_campaign VARCHAR(255),
                            is_duplicate BOOLEAN DEFAULT FALSE,

    -- Audit fields
                            created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
                            updated_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
                            created_by VARCHAR(255),
                            updated_by VARCHAR(255),
                            is_deleted BOOLEAN DEFAULT FALSE,
                            deleted_at TIMESTAMP WITH TIME ZONE
);

-- Bảng lưu trữ CV của ứng viên
CREATE TABLE cvs (
                     id BIGSERIAL PRIMARY KEY,
                     candidate_id BIGINT NOT NULL,
                     file_path VARCHAR(1000),
                     file_type VARCHAR(50),
                     parsed_data JSONB, -- Postgres hỗ trợ JSON rất tốt cho output của cv-parser-service
                     parse_status VARCHAR(50),

                     created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
                     updated_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
                     created_by VARCHAR(255),
                     updated_by VARCHAR(255),
                     is_deleted BOOLEAN DEFAULT FALSE,
                     deleted_at TIMESTAMP WITH TIME ZONE,

    -- FK nội bộ (Cùng 1 DB thì được phép dùng FK)
                     CONSTRAINT fk_cv_candidate FOREIGN KEY (candidate_id) REFERENCES candidates(id)
);

-- Bảng Candidate - Skills
CREATE TABLE candidate_skills (
                                  candidate_id BIGINT NOT NULL,
                                  skill_id BIGINT NOT NULL, -- KHÔNG FK (Skill nằm ở job_db)
                                  PRIMARY KEY (candidate_id, skill_id),
                                  CONSTRAINT fk_cs_candidate FOREIGN KEY (candidate_id) REFERENCES candidates(id)
);