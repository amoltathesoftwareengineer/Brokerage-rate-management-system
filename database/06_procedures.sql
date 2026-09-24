-- ============================================
-- PL/SQL PROCEDURES
-- Brokerage Rate Management System
-- ============================================


-- ============================================
-- 1. CREATE BROKERAGE TRANSACTION
-- ============================================

CREATE OR REPLACE PROCEDURE create_brokerage_transaction (
    p_transaction_id IN NUMBER,
    p_policy_id      IN NUMBER,
    p_brokerage_rate IN NUMBER
)
IS
    v_premium_amount   NUMBER(12,2);
    v_brokerage_amount NUMBER(12,2);
BEGIN

    -- Get premium amount for the policy
    SELECT premium_amount
    INTO v_premium_amount
    FROM policies
    WHERE policy_id = p_policy_id;

    -- Calculate brokerage amount
    v_brokerage_amount :=
        calculate_brokerage(
            v_premium_amount,
            p_brokerage_rate
        );

    -- Insert brokerage transaction
    INSERT INTO brokerage_transactions (
        transaction_id,
        policy_id,
        brokerage_rate,
        brokerage_amount,
        transaction_date,
        status
    )
    VALUES (
        p_transaction_id,
        p_policy_id,
        p_brokerage_rate,
        v_brokerage_amount,
        SYSDATE,
        'PROCESSED'
    );

    COMMIT;

END;
/
