-- ============================================
-- SAMPLE DATA
-- Brokerage Rate Management System
-- ============================================

-- Broker sample data will be added here.

-- ============================================
-- BROKER SAMPLE DATA
-- ============================================

INSERT INTO brokers (
    broker_id,
    broker_name,
    email,
    phone,
    status
) VALUES (
    101,
    'ABC Insurance Brokers',
    'contact@abcbrokers.com',
    '9876543210',
    'ACTIVE'
);

INSERT INTO brokers (
    broker_id,
    broker_name,
    email,
    phone,
    status
) VALUES (
    102,
    'SecureLife Brokers',
    'contact@securelife.com',
    '9876543211',
    'ACTIVE'
);

INSERT INTO brokers (
    broker_id,
    broker_name,
    email,
    phone,
    status
) VALUES (
    103,
    'Prime Insurance Services',
    'contact@primeinsurance.com',
    '9876543212',
    'ACTIVE'
);


-- ============================================
-- CUSTOMER SAMPLE DATA
-- ============================================

INSERT INTO customers (
    customer_id,
    customer_name,
    email,
    phone,
    address,
    status
) VALUES (
    201,
    'Rahul Sharma',
    'rahul.sharma@example.com',
    '9876500001',
    'Pune, Maharashtra',
    'ACTIVE'
);

INSERT INTO customers (
    customer_id,
    customer_name,
    email,
    phone,
    address,
    status
) VALUES (
    202,
    'Priya Patil',
    'priya.patil@example.com',
    '9876500002',
    'Mumbai, Maharashtra',
    'ACTIVE'
);

INSERT INTO customers (
    customer_id,
    customer_name,
    email,
    phone,
    address,
    status
) VALUES (
    203,
    'Amit Kulkarni',
    'amit.kulkarni@example.com',
    '9876500003',
    'Nashik, Maharashtra',
    'ACTIVE'
);


-- ============================================
-- PRODUCT SAMPLE DATA
-- ============================================

INSERT INTO products (
    product_id,
    product_name,
    product_type,
    description,
    status
) VALUES (
    301,
    'Motor Insurance',
    'GENERAL',
    'Insurance coverage for private and commercial vehicles',
    'ACTIVE'
);

INSERT INTO products (
    product_id,
    product_name,
    product_type,
    description,
    status
) VALUES (
    302,
    'Health Insurance',
    'HEALTH',
    'Health insurance coverage for individuals and families',
    'ACTIVE'
);

INSERT INTO products (
    product_id,
    product_name,
    product_type,
    description,
    status
) VALUES (
    303,
    'Life Insurance',
    'LIFE',
    'Life insurance protection for policyholders',
    'ACTIVE'
);


-- ============================================
-- BROKERAGE RATE SAMPLE DATA
-- ============================================

INSERT INTO brokerage_rates (
    rate_id,
    broker_id,
    product_id,
    brokerage_rate,
    effective_from,
    effective_to,
    status
) VALUES (
    401,
    101,
    301,
    7.00,
    DATE '2026-01-01',
    NULL,
    'ACTIVE'
);

INSERT INTO brokerage_rates (
    rate_id,
    broker_id,
    product_id,
    brokerage_rate,
    effective_from,
    effective_to,
    status
) VALUES (
    402,
    102,
    302,
    5.50,
    DATE '2026-01-01',
    NULL,
    'ACTIVE'
);

INSERT INTO brokerage_rates (
    rate_id,
    broker_id,
    product_id,
    brokerage_rate,
    effective_from,
    effective_to,
    status
) VALUES (
    403,
    103,
    303,
    6.00,
    DATE '2026-01-01',
    NULL,
    'ACTIVE'
);


-- ============================================
-- POLICY SAMPLE DATA
-- ============================================

INSERT INTO policies (
    policy_id,
    customer_id,
    broker_id,
    product_id,
    policy_number,
    premium_amount,
    policy_start_date,
    policy_end_date,
    status
) VALUES (
    501,
    201,
    101,
    301,
    'POL-2026-001',
    50000.00,
    DATE '2026-01-15',
    DATE '2027-01-14',
    'ACTIVE'
);

INSERT INTO policies (
    policy_id,
    customer_id,
    broker_id,
    product_id,
    policy_number,
    premium_amount,
    policy_start_date,
    policy_end_date,
    status
) VALUES (
    502,
    202,
    102,
    302,
    'POL-2026-002',
    75000.00,
    DATE '2026-02-01',
    DATE '2027-01-31',
    'ACTIVE'
);

INSERT INTO policies (
    policy_id,
    customer_id,
    broker_id,
    product_id,
    policy_number,
    premium_amount,
    policy_start_date,
    policy_end_date,
    status
) VALUES (
    503,
    203,
    103,
    303,
    'POL-2026-003',
    100000.00,
    DATE '2026-03-10',
    DATE '2027-03-09',
    'ACTIVE'
);


-- ============================================
-- BROKERAGE TRANSACTION SAMPLE DATA
-- ============================================

INSERT INTO brokerage_transactions (
    transaction_id,
    policy_id,
    brokerage_rate,
    brokerage_amount,
    transaction_date,
    status
) VALUES (
    601,
    501,
    7.00,
    3500.00,
    DATE '2026-01-15',
    'PROCESSED'
);

INSERT INTO brokerage_transactions (
    transaction_id,
    policy_id,
    brokerage_rate,
    brokerage_amount,
    transaction_date,
    status
) VALUES (
    602,
    502,
    5.50,
    4125.00,
    DATE '2026-02-01',
    'PROCESSED'
);

INSERT INTO brokerage_transactions (
    transaction_id,
    policy_id,
    brokerage_rate,
    brokerage_amount,
    transaction_date,
    status
) VALUES (
    603,
    503,
    6.00,
    6000.00,
    DATE '2026-03-10',
    'PROCESSED'
);
