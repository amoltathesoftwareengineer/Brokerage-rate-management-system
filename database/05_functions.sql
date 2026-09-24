-- ============================================
-- PL/SQL FUNCTIONS
-- Brokerage Rate Management System
-- ============================================


-- ============================================
-- 1. CALCULATE BROKERAGE AMOUNT
-- ============================================

CREATE OR REPLACE FUNCTION calculate_brokerage (
    p_premium_amount IN NUMBER,
    p_brokerage_rate IN NUMBER
)
RETURN NUMBER
IS
    v_brokerage_amount NUMBER(12,2);
BEGIN
    v_brokerage_amount :=
        p_premium_amount * p_brokerage_rate / 100;

    RETURN ROUND(v_brokerage_amount, 2);
END;
/
