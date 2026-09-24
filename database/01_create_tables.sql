-- ============================================
-- BROKERS TABLE
-- ============================================

CREATE TABLE brokers (
    broker_id NUMBER PRIMARY KEY,
    broker_name VARCHAR2(100) NOT NULL,
    email VARCHAR2(150) UNIQUE,
    phone VARCHAR2(20),
    status VARCHAR2(20) DEFAULT 'ACTIVE'
);


-- ============================================
-- CUSTOMERS TABLE
-- ============================================

CREATE TABLE customers (
    customer_id NUMBER PRIMARY KEY,
    customer_name VARCHAR2(100) NOT NULL,
    email VARCHAR2(150) UNIQUE,
    phone VARCHAR2(20),
    address VARCHAR2(250),
    status VARCHAR2(20) DEFAULT 'ACTIVE'
);
