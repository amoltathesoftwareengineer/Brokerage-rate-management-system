-- ============================================
-- DATABASE VIEWS
-- Brokerage Rate Management System
-- ============================================


-- ============================================
-- 1. POLICY DETAILS VIEW
-- ============================================

CREATE OR REPLACE VIEW vw_policy_details AS
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
-- 2. BROKERAGE REPORT VIEW
-- ============================================

CREATE OR REPLACE VIEW vw_brokerage_report AS
SELECT
    bt.transaction_id,
    p.policy_number,
    b.broker_name,
    pr.product_name,
    p.premium_amount,
    bt.brokerage_rate,
    bt.brokerage_amount,
    bt.transaction_date,
    bt.status
FROM brokerage_transactions bt
JOIN policies p
    ON bt.policy_id = p.policy_id
JOIN brokers b
    ON p.broker_id = b.broker_id
JOIN products pr
    ON p.product_id = pr.product_id;


-- ============================================
-- 3. BROKERAGE RATE VIEW
-- ============================================

CREATE OR REPLACE VIEW vw_brokerage_rates AS
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
