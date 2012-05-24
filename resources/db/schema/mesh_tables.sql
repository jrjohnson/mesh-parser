/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET FOREIGN_KEY_CHECKS=0 */;

DROP TABLE IF EXISTS `mesh_concept`;
CREATE TABLE IF NOT EXISTS `mesh_concept` (
  `mesh_concept_uid` varchar(9) COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(192) COLLATE utf8_unicode_ci NOT NULL,
  `umls_uid` varchar(9) COLLATE utf8_unicode_ci NOT NULL,
  `preferred` tinyint(1) NOT NULL,
  `scope_note` text COLLATE utf8_unicode_ci,
  `casn_1_name` varchar(127) COLLATE utf8_unicode_ci DEFAULT NULL,
  `registry_number` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`mesh_concept_uid`),
  FULLTEXT KEY `n_index` (`name`),
  FULLTEXT KEY `sn_index` (`scope_note`),
  FULLTEXT KEY `cn_index` (`casn_1_name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

DROP TABLE IF EXISTS `mesh_concept_x_semantic_type`;
CREATE TABLE IF NOT EXISTS `mesh_concept_x_semantic_type` (
  `mesh_concept_uid` varchar(9) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `mesh_semantic_type_uid` varchar(9) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  KEY `mesh_concept_uid` (`mesh_concept_uid`) USING BTREE,
  KEY `mesh_semantic_type_uid` (`mesh_semantic_type_uid`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `mesh_concept_x_term`;
CREATE TABLE IF NOT EXISTS `mesh_concept_x_term` (
  `mesh_concept_uid` varchar(9) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `mesh_term_uid` varchar(9) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  KEY `mesh_concept_uid` (`mesh_concept_uid`) USING BTREE,
  KEY `mesh_term_uid` (`mesh_term_uid`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `mesh_descriptor`;
CREATE TABLE IF NOT EXISTS `mesh_descriptor` (
  `mesh_descriptor_uid` varchar(9) COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(192) COLLATE utf8_unicode_ci NOT NULL,
  `annotation` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`mesh_descriptor_uid`),
  FULLTEXT KEY `n_index` (`name`),
  FULLTEXT KEY `a_index` (`annotation`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

DROP TABLE IF EXISTS `mesh_descriptor_x_concept`;
CREATE TABLE IF NOT EXISTS `mesh_descriptor_x_concept` (
  `mesh_concept_uid` varchar(9) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `mesh_descriptor_uid` varchar(9) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  KEY `mesh_concept_uid` (`mesh_concept_uid`) USING BTREE,
  KEY `mesh_descriptor_uid` (`mesh_descriptor_uid`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `mesh_descriptor_x_qualifier`;
CREATE TABLE IF NOT EXISTS `mesh_descriptor_x_qualifier` (
  `mesh_descriptor_uid` varchar(9) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `mesh_qualifier_uid` varchar(9) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  KEY `mesh_descriptor_uid` (`mesh_descriptor_uid`) USING BTREE,
  KEY `mesh_qualifier_uid` (`mesh_qualifier_uid`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `mesh_previous_indexing`;
CREATE TABLE IF NOT EXISTS `mesh_previous_indexing` (
  `mesh_descriptor_uid` varchar(9) COLLATE utf8_unicode_ci NOT NULL,
  `previous_indexing` text COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`mesh_descriptor_uid`),
  FULLTEXT KEY `pi_index` (`previous_indexing`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

DROP TABLE IF EXISTS `mesh_qualifier`;
CREATE TABLE IF NOT EXISTS `mesh_qualifier` (
  `mesh_qualifier_uid` varchar(9) COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(60) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`mesh_qualifier_uid`),
  FULLTEXT KEY `n_index` (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

DROP TABLE IF EXISTS `mesh_semantic_type`;
CREATE TABLE IF NOT EXISTS `mesh_semantic_type` (
  `mesh_semantic_type_uid` varchar(9) COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(192) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`mesh_semantic_type_uid`),
  FULLTEXT KEY `n_index` (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

DROP TABLE IF EXISTS `mesh_term`;
CREATE TABLE IF NOT EXISTS `mesh_term` (
  `mesh_term_uid` varchar(9) COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(192) COLLATE utf8_unicode_ci NOT NULL,
  `lexical_tag` varchar(12) COLLATE utf8_unicode_ci DEFAULT NULL,
  `concept_preferred` tinyint(1) DEFAULT NULL,
  `record_preferred` tinyint(1) DEFAULT NULL,
  `permuted` tinyint(1) DEFAULT NULL,
  `print` tinyint(1) DEFAULT NULL,
  KEY `mesh_term_uid` (`mesh_term_uid`) USING BTREE,
  FULLTEXT KEY `n_index` (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

DROP TABLE IF EXISTS `mesh_tree_x_descriptor`;
CREATE TABLE IF NOT EXISTS `mesh_tree_x_descriptor` (
  `tree_number` varchar(31) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `mesh_descriptor_uid` varchar(9) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`tree_number`),
  KEY `mesh_descriptor_uid` (`mesh_descriptor_uid`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `mesh_user_selection`;
CREATE TABLE IF NOT EXISTS `mesh_user_selection` (
  `mesh_user_selection_id` int(14) unsigned NOT NULL AUTO_INCREMENT,
  `mesh_descriptor_uid` varchar(9) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `search_phrase` varchar(127) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`mesh_user_selection_id`),
  FULLTEXT KEY `sp_index` (`search_phrase`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*!40014 SET FOREIGN_KEY_CHECKS=1 */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
