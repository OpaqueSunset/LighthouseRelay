--
-- Table structure for table `player_hours`
--
DROP TABLE IF EXISTS `player_hours`;
CREATE TABLE IF NOT EXISTS `player_hours`
(
  `ckey` varchar(32) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `department` varchar(64) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `hours` double NOT NULL,
  PRIMARY KEY (`ckey`,`department`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;