/* ============================================================
   IMPLEMENTATION OF CONCURRENCY CONTROL IN DISTRIBUTED DBMS
   USING DISTRIBUTED TWO-PHASE LOCKING (2PL)
   ============================================================ */


/* =======================
   SITE A – CREATE DATABASE
   ======================= */
DROP DATABASE IF EXISTS SiteA;
CREATE DATABASE SiteA;
USE SiteA;

CREATE TABLE AccountA(
    acc_no INT PRIMARY KEY,
    balance INT
);

/* Insert sample data */
INSERT INTO AccountA VALUES (1, 5000);



/* =======================
   SITE B – CREATE DATABASE
   ======================= */
DROP DATABASE IF EXISTS SiteB;
CREATE DATABASE SiteB;
USE SiteB;

CREATE TABLE AccountB(
    acc_no INT PRIMARY KEY,
    balance INT
);

/* Insert sample data */
INSERT INTO AccountB VALUES (2, 7000);



/* ============================================================
   DISTRIBUTED TRANSACTION USING 2-PHASE LOCKING (2PL)
   ------------------------------------------------------------
   Transaction T1: Transfer ₹1000 from SiteA.AccountA to SiteB.AccountB
   Steps:
   1. Growing Phase   → Acquire Locks using SELECT ... FOR UPDATE
   2. Critical Section → Perform Updates
   3. Shrinking Phase → Commit and release locks
   ============================================================ */

START TRANSACTION;

-- ============ GROWING PHASE: Acquire Locks ============ --
/* Lock row at Site A */
SELECT * FROM SiteA.AccountA WHERE acc_no = 1 FOR UPDATE;

/* Lock row at Site B */
SELECT * FROM SiteB.AccountB WHERE acc_no = 2 FOR UPDATE;



-- ============ CRITICAL SECTION: Update Data ============ --
UPDATE SiteA.AccountA
SET balance = balance - 1000
WHERE acc_no = 1;

UPDATE SiteB.AccountB
SET balance = balance + 1000
WHERE acc_no = 2;



-- ============ SHRINKING PHASE: Release Locks ============ --
COMMIT;



/* ============================================================
   CHECK FINAL OUTPUT
   ============================================================ */

-- Check Site A balance
SELECT * FROM SiteA.AccountA;


-- Check Site B balance
SELECT * FROM SiteB.AccountB;

