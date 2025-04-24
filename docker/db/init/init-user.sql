CREATE USER 'master'@'%' IDENTIFIED BY 'master';
GRANT ALL PRIVILEGES ON *.* TO 'master'@'%' WITH GRANT OPTION;

-- ユーザー2
CREATE USER 'replica'@'%' IDENTIFIED BY 'replica';
GRANT SELECT ON *.* TO 'replica'@'%';