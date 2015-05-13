-- --------------------------------------------------------
-- Host:                         localhost
-- Server version:               5.5.27 - MySQL Community Server (GPL)
-- Server OS:                    Win32
-- HeidiSQL version:             7.0.0.4053
-- Date/time:                    2015-05-13 16:58:27
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET FOREIGN_KEY_CHECKS=0 */;

-- Dumping structure for table pow2.question
CREATE TABLE IF NOT EXISTS `question` (
  `ques_id` int(10) DEFAULT NULL,
  `ans_id` int(10) DEFAULT NULL,
  `product_id` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table pow2.question: ~7 rows (approximately)
/*!40000 ALTER TABLE `question` DISABLE KEYS */;
INSERT INTO `question` (`ques_id`, `ans_id`, `product_id`) VALUES
	(1, 1, '2,20,22,2'),
	(2, 2, '4.21'),
	(1, 2, '5'),
	(1, 3, '6'),
	(2, 1, '4'),
	(3, 1, '10'),
	(3, 2, '12');
/*!40000 ALTER TABLE `question` ENABLE KEYS */;


-- Dumping structure for table pow2.userans
CREATE TABLE IF NOT EXISTS `userans` (
  `user_id` int(10) DEFAULT NULL,
  `question_id` int(10) DEFAULT NULL,
  `ans_id` int(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table pow2.userans: ~3 rows (approximately)
/*!40000 ALTER TABLE `userans` DISABLE KEYS */;
INSERT INTO `userans` (`user_id`, `question_id`, `ans_id`) VALUES
	(1, 1, 1),
	(1, 2, 1),
	(1, 3, 2);
/*!40000 ALTER TABLE `userans` ENABLE KEYS */;
/*!40014 SET FOREIGN_KEY_CHECKS=1 */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
--select distinct `product_id` from question, userans where question.ques_id = userans.question_id and question.ans_id = userans.ans_id and userans.user_id = 1;