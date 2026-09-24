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
