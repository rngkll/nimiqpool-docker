DELETE FROM mysql.user WHERE User='root' AND Host NOT IN ('localhost', '127.0.0.1', '::1');
DELETE FROM mysql.user WHERE User='';

CREATE USER 'pool_server'@'%' IDENTIFIED BY 'password';
GRANT ALL PRIVILEGES ON pool.* TO 'pool_server'@'%';

CREATE USER 'pool_service'@'%' IDENTIFIED BY 'password';
GRANT ALL PRIVILEGES ON pool.* TO 'pool_service'@'%';

CREATE USER 'pool_payout'@'%' IDENTIFIED BY 'password';
GRANT ALL PRIVILEGES ON pool.* TO 'pool_payout'@'%';

FLUSH PRIVILEGES;

