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


-- ============================================
-- PRODUCTS TABLE
-- ============================================

CREATE TABLE products (
    product_id NUMBER PRIMARY KEY,
    product_name VARCHAR2(100) NOT NULL,
    product_type VARCHAR2(50) NOT NULL,
    description VARCHAR2(250),
    status VARCHAR2(20) DEFAULT 'ACTIVE'
);


-- ============================================
-- BROKERAGE RATES TABLE
-- ============================================

CREATE TABLE brokerage_rates (
    rate_id NUMBER PRIMARY KEY,
    broker_id NUMBER NOT NULL,
    product_id NUMBER NOT NULL,
    brokerage_rate NUMBER(5,2) NOT NULL,
    effective_from DATE NOT NULL,
    effective_to DATE,
    status VARCHAR2(20) DEFAULT 'ACTIVE',

    CONSTRAINT fk_rate_broker
        FOREIGN KEY (broker_id)
        REFERENCES brokers(broker_id),

    CONSTRAINT fk_rate_product
        FOREIGN KEY (product_id)
        REFERENCES products(product_id),

    CONSTRAINT chk_brokerage_rate
        CHECK (brokerage_rate >= 0 AND brokerage_rate <= 100)
);


-- ============================================
-- POLICIES TABLE
-- ============================================

CREATE TABLE policies (
    policy_id NUMBER PRIMARY KEY,
    customer_id NUMBER NOT NULL,
    broker_id NUMBER NOT NULL,
    product_id NUMBER NOT NULL,
    policy_number VARCHAR2(50) UNIQUE NOT NULL,
    premium_amount NUMBER(12,2) NOT NULL,
    policy_start_date DATE NOT NULL,
    policy_end_date DATE NOT NULL,
    status VARCHAR2(20) DEFAULT 'ACTIVE',

    CONSTRAINT fk_policy_customer
        FOREIGN KEY (customer_id)
        REFERENCES customers(customer_id),

    CONSTRAINT fk_policy_broker
        FOREIGN KEY (broker_id)
        REFERENCES brokers(broker_id),

    CONSTRAINT fk_policy_product
        FOREIGN KEY (product_id)
        REFERENCES products(product_id),

    CONSTRAINT chk_premium_amount
        CHECK (premium_amount > 0),

    CONSTRAINT chk_policy_dates
        CHECK (policy_end_date >= policy_start_date)
);


-- ============================================
-- BROKERAGE TRANSACTIONS TABLE
-- ============================================

CREATE TABLE brokerage_transactions (
    transaction_id NUMBER PRIMARY KEY,
    policy_id NUMBER NOT NULL,
    brokerage_rate NUMBER(5,2) NOT NULL,
    brokerage_amount NUMBER(12,2) NOT NULL,
    transaction_date DATE DEFAULT SYSDATE,
    status VARCHAR2(20) DEFAULT 'PROCESSED',

    CONSTRAINT fk_transaction_policy
        FOREIGN KEY (policy_id)
        REFERENCES policies(policy_id),

    CONSTRAINT chk_transaction_rate
        CHECK (brokerage_rate >= 0 AND brokerage_rate <= 100),

    CONSTRAINT chk_brokerage_amount
        CHECK (brokerage_amount >= 0)
);
