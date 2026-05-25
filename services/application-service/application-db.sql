-- Bảng lưu lịch sử chuyển trạng thái (Audit trail cho pipeline)
CREATE TABLE stage_transitions (
                                   id BIGSERIAL PRIMARY KEY,
                                   application_id BIGINT NOT NULL,
                                   from_stage_id BIGINT,
                                   to_stage_id BIGINT,
                                   notes TEXT,
                                   moved_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
                                   created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
                                   created_by BIGINT,
                                   is_deleted BOOLEAN DEFAULT FALSE
);

-- Bảng lưu ghi chú đánh giá của người phỏng vấn
CREATE TABLE evaluation_notes (
                                  id BIGSERIAL PRIMARY KEY,
                                  application_id BIGINT NOT NULL,
                                  content TEXT,
                                  created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
                                  created_by BIGINT,
                                  updated_at TIMESTAMP WITH TIME ZONE,
                                  updated_by VARCHAR(255),
                                  is_deleted BOOLEAN DEFAULT FALSE
);

-- Bảng mẫu phỏng vấn (Để HR chọn nhanh)
CREATE TABLE interview_templates (
                                     id BIGSERIAL PRIMARY KEY,
                                     template_name VARCHAR(255),
                                     file_path VARCHAR(1000),
                                     is_active BOOLEAN DEFAULT TRUE,
                                     created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
                                     updated_at TIMESTAMP WITH TIME ZONE,
                                     created_by VARCHAR(255),
                                     is_deleted BOOLEAN DEFAULT FALSE
);

-- Bảng trung gian Nhiều-Nhiều (Interview - Interviewers)
CREATE TABLE interview_interviewers (
                                        interview_id BIGINT NOT NULL,
                                        user_id BIGINT NOT NULL, -- KHÔNG FK (Nằm ở identity_db)
                                        PRIMARY KEY (interview_id, user_id),
                                        CONSTRAINT fk_ii_interview FOREIGN KEY (interview_id) REFERENCES interviews(id)
);