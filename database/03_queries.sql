-- ============================================
-- SQL QUERIES AND REPORTS
-- Brokerage Rate Management System
-- ============================================


-- ============================================
-- 1. VIEW ALL BROKERS
-- ============================================

SELECT
    broker_id,
    broker_name,
    email,
    phone,
    status
FROM brokers;


-- ============================================
-- 2. VIEW ALL CUSTOMERS
-- ============================================

SELECT
    customer_id,
    customer_name,
    email,
    phone,
    address,
    status
FROM customers;


-- ============================================
-- 3. VIEW ALL PRODUCTS
-- ============================================

SELECT
    product_id,
    product_name,
    product_type,
    description,
    status
FROM products;


-- ============================================
-- 4. POLICY DETAILS WITH CUSTOMER AND BROKER
-- ============================================

SELECT
    p.policy_id,
    p.policy_number,
    c.customer_name,
    b.broker_name,
    pr.product_name,
    p.premium_amount,
    p.policy_start_date,
    p.policy_end_date,
    p.status
FROM policies p
JOIN customers c
    ON p.customer_id = c.customer_id
JOIN brokers b
    ON p.broker_id = b.broker_id
JOIN products pr
    ON p.product_id = pr.product_id;


-- ============================================
-- 5. BROKERAGE CALCULATION REPORT
-- ============================================

SELECT
    p.policy_number,
    p.premium_amount,
    bt.brokerage_rate,
    bt.brokerage_amount,
    bt.transaction_date,
    bt.status
FROM brokerage_transactions bt
JOIN policies p
    ON bt.policy_id = p.policy_id;


-- ============================================
-- 6. TOTAL BROKERAGE BY BROKER
-- ============================================

SELECT
    b.broker_id,
    b.broker_name,
    SUM(bt.brokerage_amount) AS total_brokerage
FROM brokerage_transactions bt
JOIN policies p
    ON bt.policy_id = p.policy_id
JOIN brokers b
    ON p.broker_id = b.broker_id
GROUP BY
    b.broker_id,
    b.broker_name;


-- ============================================
-- 7. TOTAL PREMIUM BY PRODUCT
-- ============================================

SELECT
    pr.product_id,
    pr.product_name,
    SUM(p.premium_amount) AS total_premium
FROM policies p
JOIN products pr
    ON p.product_id = pr.product_id
GROUP BY
    pr.product_id,
    pr.product_name;


-- ============================================
-- 8. HIGHEST PREMIUM POLICY
-- ============================================

SELECT
    policy_number,
    premium_amount
FROM policies
ORDER BY premium_amount DESC
FETCH FIRST 1 ROW ONLY;


-- ============================================
-- 9. BROKERAGE RATE DETAILS
-- ============================================

SELECT
    br.rate_id,
    b.broker_name,
    pr.product_name,
    br.brokerage_rate,
    br.effective_from,
    br.effective_to,
    br.status
FROM brokerage_rates br
JOIN brokers b
    ON br.broker_id = b.broker_id
JOIN products pr
    ON br.product_id = pr.product_id;


-- ============================================
-- 10. BROKERAGE RATE HISTORY
-- ============================================

SELECT
    h.history_id,
    h.rate_id,
    h.old_rate,
    h.new_rate,
    h.changed_date,
    h.changed_by
FROM brokerage_rate_history h
ORDER BY h.changed_date DESC;
