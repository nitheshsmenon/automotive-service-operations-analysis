-- Automotive Service Operations Efficiency Analysis
-- Dataset: Synthetic automotive service operations data
-- Purpose: Analyze service delays, technician workload,
-- service mix, parts availability, and high-delay repair orders.


-- 1. Total number of repair orders
SELECT COUNT(ro_number) AS total_ros
FROM test_data;


-- 2. Overall average Wait-to-Tech
SELECT
    ROUND(AVG(wait_to_tech_minutes), 2) AS avg_wait_to_tech
FROM test_data;


-- 3. Average Wait-to-Tech by service type
SELECT
    service_type,
    ROUND(AVG(wait_to_tech_minutes), 2) AS avg_wait_to_tech
FROM test_data
GROUP BY service_type
ORDER BY avg_wait_to_tech DESC;


-- 4. Technician workload
SELECT
    tech_assigned,
    COUNT(ro_number) AS ro_count
FROM test_data
GROUP BY tech_assigned
ORDER BY ro_count DESC;


-- 5. Technician workload and average Wait-to-Tech
SELECT
    tech_assigned,
    COUNT(ro_number) AS ro_count,
    ROUND(AVG(wait_to_tech_minutes), 2) AS avg_wait_to_tech
FROM test_data
GROUP BY tech_assigned
ORDER BY avg_wait_to_tech DESC;


-- 6. Technician service mix
SELECT
    tech_assigned,
    service_type,
    COUNT(ro_number) AS ro_count
FROM test_data
GROUP BY tech_assigned, service_type
ORDER BY tech_assigned, ro_count DESC;


-- 7. Parts availability by service type
SELECT
    service_type,
    parts_available,
    COUNT(ro_number) AS ro_count
FROM test_data
GROUP BY service_type, parts_available
ORDER BY service_type, parts_available;


-- 8. Top 10 ROs with the highest Wait-to-Tech
SELECT
    ro_number,
    service_type,
    tech_assigned,
    wait_to_tech_minutes
FROM test_data
ORDER BY wait_to_tech_minutes DESC
LIMIT 10;
