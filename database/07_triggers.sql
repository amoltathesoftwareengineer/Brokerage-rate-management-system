-- ============================================
-- DATABASE TRIGGERS
-- Brokerage Rate Management System
-- ============================================


-- ============================================
-- 1. BROKERAGE RATE CHANGE HISTORY TRIGGER
-- ============================================

CREATE OR REPLACE TRIGGER trg_brokerage_rate_history
AFTER UPDATE OF brokerage_rate
ON brokerage_rates
FOR EACH ROW
BEGIN

    INSERT INTO brokerage_rate_history (
        history_id,
        rate_id,
        old_rate,
        new_rate,
        changed_date,
        changed_by
    )
    VALUES (
        (SELECT NVL(MAX(history_id), 700) + 1
         FROM brokerage_rate_history),
        :OLD.rate_id,
        :OLD.brokerage_rate,
        :NEW.brokerage_rate,
        SYSDATE,
        USER
    );

END;
/
