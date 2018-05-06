DELETE FROM mysql.user WHERE User='root' AND Host NOT IN ('localhost', '127.0.0.1', '::1');
DELETE FROM mysql.user WHERE User='';

CREATE USER 'pool_server'@'server';
GRANT ALL PRIVILEGES ON pool.* TO 'pool_server'@'server';

CREATE USER 'pool_service'@'service';
GRANT ALL PRIVILEGES ON pool.* TO 'pool_service'@'service';

CREATE USER 'pool_payout'@'payout';
GRANT ALL PRIVILEGES ON pool.* TO 'pool_payout'@'payout';

CREATE USER 'pool_metrics'@'metrics';
GRANT ALL PRIVILEGES ON pool.* TO 'pool_metrics'@'metrics';

CREATE USER 'pool_server'@'debian';
GRANT ALL PRIVILEGES ON pool.* TO 'pool_server'@'debian';
/*
UPDATE mysql.user SET Host='server' WHERE Host='localhost' AND User='pool_server';
*/
FLUSH PRIVILEGES;

