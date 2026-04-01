-- LearnTracker 数据库初始化脚本
-- 创建数据库
CREATE DATABASE learn_tracker;

-- 连接数据库
\c learn_tracker;

-- 用户表
CREATE TABLE "user" (
    id BIGSERIAL PRIMARY KEY,
    username VARCHAR(50) UNIQUE NOT NULL,
    email VARCHAR(100) UNIQUE,
    password VARCHAR(255) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    deleted INTEGER DEFAULT 0
);

-- 学习资源表
CREATE TABLE resource (
    id BIGSERIAL PRIMARY KEY,
    title VARCHAR(200) NOT NULL,
    description TEXT,
    type VARCHAR(20) NOT NULL,  -- ARTICLE/VIDEO/REPOSITORY/DOCUMENT
    url VARCHAR(500),
    status VARCHAR(20) DEFAULT 'TODO',  -- TODO/LEARNING/DONE/REVIEWING/ARCHIVED
    ext_data JSONB DEFAULT '{}',
    user_id BIGINT REFERENCES "user"(id),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    deleted INTEGER DEFAULT 0
);

-- 标签表
CREATE TABLE tag (
    id BIGSERIAL PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    user_id BIGINT REFERENCES "user"(id),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    deleted INTEGER DEFAULT 0
);

-- 资源标签关联表
CREATE TABLE resource_tag (
    resource_id BIGINT REFERENCES resource(id) ON DELETE CASCADE,
    tag_id BIGINT REFERENCES tag(id) ON DELETE CASCADE,
    PRIMARY KEY (resource_id, tag_id)
);

-- 笔记表
CREATE TABLE note (
    id BIGSERIAL PRIMARY KEY,
    content TEXT NOT NULL,
    resource_id BIGINT REFERENCES resource(id) ON DELETE CASCADE,
    user_id BIGINT REFERENCES "user"(id),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    deleted INTEGER DEFAULT 0
);

-- 操作日志表
CREATE TABLE operation_log (
    id BIGSERIAL PRIMARY KEY,
    operation VARCHAR(100) NOT NULL,
    username VARCHAR(50),
    method VARCHAR(100),
    params TEXT,
    ip VARCHAR(50),
    time BIGINT,
    create_time TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- 创建索引
CREATE INDEX idx_resource_user_id ON resource(user_id);
CREATE INDEX idx_resource_type ON resource(type);
CREATE INDEX idx_resource_status ON resource(status);
CREATE INDEX idx_resource_created_at ON resource(created_at);
CREATE INDEX idx_resource_user_type_status ON resource(user_id, type, status);
CREATE INDEX idx_resource_ext_data ON resource USING GIN (ext_data);
CREATE INDEX idx_tag_user_id ON tag(user_id);
CREATE INDEX idx_note_resource_id ON note(resource_id);
CREATE INDEX idx_note_user_id ON note(user_id);

-- 插入测试用户 (密码: 123456, BCrypt加密)
INSERT INTO "user" (username, email, password) VALUES 
('test', 'test@example.com', '$2a$10$N.zmdr9k7uOCQb376NoUnuTJ8iAt6Z5EHsM8lE9lBOsl7iKTVKIUi');