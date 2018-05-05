CREATE USER 'pool_metrics'@'%';

GRANT SELECT ON pool.user TO 'pool_metrics'@'%';
GRANT SELECT ON pool.block TO 'pool_metrics'@'%';
GRANT SELECT ON pool.share TO 'pool_metrics'@'%';
GRANT SELECT ON pool.payin TO 'pool_metrics'@'%';
GRANT SELECT ON pool.payout TO 'pool_metrics'@'%';
GRANT SELECT ON pool.payout_request TO 'pool_metrics'@'%';
