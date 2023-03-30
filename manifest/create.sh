use identity;

DROP TABLE IF EXISTS `auth`;
CREATE TABLE IF NOT EXISTS `auth`
(
    id_user INT NOT NULL REFERENCES user(id_user),
    login VARCHAR(100) NOT NULL PRIMARY KEY,
    password VARCHAR(500) NOT NULL
);

DROP TABLE IF EXISTS `user`;
CREATE TABLE IF NOT EXISTS `user`
(
    id_user INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    nom VARCHAR(100) ,
    prenom VARCHAR(100),
    naissance DATE
);

# Generateur de config #


use config_generator;

DROP TABLE IF EXISTS `serveur_web`;
CREATE TABLE IF NOT EXISTS `serveur_web`
(
    name VARCHAR(100) NOT NULL,
    root VARCHAR(100),
    location VARCHAR(100),
    error_page VARCHAR(100),
    id_server INT,
    PRIMARY KEY (name),
    FOREIGN KEY (id_server) REFERENCES serveur(id_server)
);

DROP TABLE IF EXISTS `serveur`;
CREATE TABLE IF NOT EXISTS `serveur`
(
    id_server INT NOT NULL AUTO_INCREMENT,
    ip VARCHAR(15),
    PRIMARY KEY (id_server)
);

DROP TABLE IF EXISTS `reverse_proxy`;
CREATE TABLE IF NOT EXISTS `reverse_proxy`
(
    id_proxy INT NOT NULL AUTO_INCREMENT,
    id_server INT,
    PRIMARY KEY (id_proxy),
    FOREIGN KEY (id_server) REFERENCES serveur(id_server)
);

DROP TABLE IF EXISTS `location_proxy`;
CREATE TABLE IF NOT EXISTS `location_proxy`
(
    bind VARCHAR(100) NOT NULL,
    location VARCHAR(100),
    pass VARCHAR(100),
    PRIMARY KEY (bind)
);

DROP TABLE IF EXISTS `loadb_info`;
CREATE TABLE IF NOT EXISTS `loadb_info`
(
    id_loadb INT NOT NULL AUTO_INCREMENT,
    name VARCHAR(100),
    srv1 VARCHAR(100),
    srv2 VARCHAR(100),
    PRIMARY KEY (id_loadb)
);

DROP TABLE IF EXISTS `load_balancer`;
CREATE TABLE IF NOT EXISTS `load_balancer`
(
    id_load INT NOT NULL AUTO_INCREMENT,
    id_server INT,
    id_loadb INT,
    location VARCHAR(100),
    pass VARCHAR(100),
    PRIMARY KEY (id_load),
    FOREIGN KEY (id_server) REFERENCES serveur(id_server),
    FOREIGN KEY (id_loadb) REFERENCES loadb_info(id_loadb)
);