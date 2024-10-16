CREATE TYPE type_user as ENUM ('client', 'admin', 'employee');
CREATE TYPE gender AS ENUM ('male', 'female', 'other');
CREATE TYPE user_status as ENUM ('active',
    'inactive',
     'blocked',
     'pending verification',
     'suspended',
     'deleted',
     'guest');

CREATE TABLE "users" (
    id BIGINT PRIMARY KEY GENERATED ALWAYS AS IDENTITY
    first_name VARCHAR(100) NOT NULL,
    last_name VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    password VARCHAR(300) NOT NULL,
    phone VARCHAR(15) NOT NULL UNIQUE,
    gender gender,
    type_user type_user NOT NULL,
    user_status user_status NOT NULL DEFAULT 'pending verification',
    email_verified BOOLEAN DEFAULT FALSE,
    last_connection TIMESTAMP WITH ZONE,
    blackout_date TIMESTAMP WITH ZONE,
    failed_attempts INT DEFAULT 0,
    last_failed_attempts TIMESTAMP WITH ZONE,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
    update_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
)

CREATE INDEX idx_users_email on 'users' (email);
CREATE INDEX idx_users_first_name on 'users' (first_name);
CREATE INDEX idx_users_last_name on 'users' (last_name);