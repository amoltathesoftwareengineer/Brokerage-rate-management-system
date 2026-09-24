-- ============================================
-- BUSINESS REPORTS
-- Brokerage Rate Management System
-- ============================================


-- ============================================
-- 1. BROKERWISE BROKERAGE REPORT
-- ============================================

SELECT
    b.broker_name,
    COUNT(bt.transaction_id) AS total_transactions,
    SUM(bt.brokerage_amount) AS total_brokerage
FROM brokers b
LEFT JOIN policies p
    ON b.broker_id = p.broker_id
LEFT JOIN brokerage_transactions bt
    ON p.policy_id = bt.policy_id
GROUP BY
    b.broker_name
ORDER BY
    total_brokerage DESC;


-- ============================================
-- 2. PRODUCTWISE PREMIUM REPORT
-- ============================================

SELECT
    pr.product_name,
    COUNT(p.policy_id) AS total_policies,
    SUM(p.premium_amount) AS total_premium
FROM products pr
LEFT JOIN policies p
    ON pr.product_id = p.product_id
GROUP BY
    pr.product_name
ORDER BY
    total_premium DESC;


-- ============================================
-- 3. MONTHLY BROKERAGE REPORT
-- ============================================

SELECT
    TO_CHAR(bt.transaction_date, 'YYYY-MM') AS transaction_month,
    COUNT(bt.transaction_id) AS total_transactions,
    SUM(bt.brokerage_amount) AS total_brokerage
FROM brokerage_transactions bt
GROUP BY
    TO_CHAR(bt.transaction_date, 'YYYY-MM')
ORDER BY
    transaction_month;


-- ============================================
-- 4. ACTIVE POLICY REPORT
-- ============================================

SELECT
    p.policy_number,
    c.customer_name,
    b.broker_name,
    pr.product_name,
    p.premium_amount,
    p.policy_start_date,
    p.policy_end_date
FROM policies p
JOIN customers c
    ON p.customer_id = c.customer_id
JOIN brokers b
    ON p.broker_id = b.broker_id
JOIN products pr
    ON p.product_id = pr.product_id
WHERE p.status = 'ACTIVE';


-- ============================================
-- 5. BROKERAGE RATE HISTORY REPORT
-- ============================================

SELECT
    b.broker_name,
    pr.product_name,
    h.old_rate,
    h.new_rate,
    h.changed_date,
    h.changed_by
FROM brokerage_rate_history h
JOIN brokerage_rates br
    ON h.rate_id = br.rate_id
JOIN brokers b
    ON br.broker_id = b.broker_id
JOIN products pr
    ON br.product_id = pr.product_id
ORDER BY
    h.changed_date DESC;
