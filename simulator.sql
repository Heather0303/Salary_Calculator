-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1
-- Время создания: Окт 08 2019 г., 12:49
-- Версия сервера: 10.4.6-MariaDB
-- Версия PHP: 7.3.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `simulator`
--

-- --------------------------------------------------------

--
-- Структура таблицы `fields`
--

CREATE TABLE `fields` (
  `id` int(11) NOT NULL,
  `field_id` varchar(255) DEFAULT NULL,
  `field_label` varchar(255) DEFAULT NULL,
  `value` varchar(255) DEFAULT NULL,
  `unit` varchar(255) DEFAULT NULL,
  `type` int(11) DEFAULT 0,
  `description` longtext DEFAULT NULL,
  `new_field` tinyint(1) DEFAULT 1,
  `editable` tinyint(1) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

--
-- Дамп данных таблицы `fields`
--

INSERT INTO `fields` (`id`, `field_id`, `field_label`, `value`, `unit`, `type`, `description`, `new_field`, `editable`) VALUES
(1, 'f7', 'Type de contrat', 'CDI', NULL, 1, 'sdasd', 0, 1),
(2, 'f8', 'feuille de paye', '30', '€', 0, '', 0, 0),
(3, 'f9', 'Mutuelle', '20,30,40', '€', 1, 'testing', 0, 1),
(5, 'f10', 'Assurance salarié', '26', '€', 0, 'asdas', 0, 0),
(6, 'f11', 'Assurance ESN', '100', '€', 0, '', 0, 0),
(7, 'f13', 'URSAAF', '1200', '€', 0, '', 0, 0),
(8, 'f14', 'AG2R', '235', '€', 0, '', 0, 0),
(9, 'f15', 'Outils', '50', '€', 0, '', 0, 0),
(10, 'f16', 'Admin CDI', '200,300', '€', 1, '', 0, 0),
(11, 'f24', 'Réserve salaire ratio', '0.25', 'mois', 0, '', 0, 0),
(12, 'f27', 'Réserve employabilité', '400', '€', 0, '', 0, 0),
(13, 'f1', 'Forfait Client jour actuel', '500', '€', 0, 'Forfait Client jour actuel', 0, 1),
(14, 'f4', 'Reduction Client', '12', '%', 0, 'testing', 0, 0),
(15, 'f5', 'Forfait Client jour avec remise de base', '440', '€', 0, 'testing', 0, 0),
(16, 'f18', 'Demande Spoc', NULL, NULL, 0, 'testing', 0, 0),
(17, 'f20', 'Recouvrement', NULL, NULL, 0, 'testing', 0, 0),
(19, 'f19', 'Remise Spoc', '500', '€\r\n', 0, 'testing', 0, 0),
(20, 'f21', 'Remise recouvrement', '200', '€', 0, 'testing', 0, 0),
(21, 'f6', 'Salaire mensuel actuel net', '3100', '€', 0, 'testing', 0, 1),
(22, 'f2', 'Nombre de jour travaillé', '216', 'jour', 0, 'testing', 0, 0),
(24, 'f3', 'Nombre de RTT', '11', 'jour', 0, 'testing', 0, 1),
(25, 'f17', 'Fees TT', '1312.5547445255472', '€', 0, 'testing', 0, 0),
(26, 'f23', 'Réserve salaire en mois', '3', 'mois', 0, '', 0, 0),
(27, 'f30', 'Salaire mensuel cible initial', '10937.956204379561', '€', 0, 'testing', 0, 0),
(28, 'f31', 'Salaire mensuel cible après 3 mois', '13672.445255474453', '€', 0, 'testing', 0, 0),
(41, 'f32', 'Forfait client jour final', NULL, '€', 0, 'test', 0, 0),
(45, 'f12', 'Formation', '2200', '€', 0, 'Formation', 0, 0),
(46, 'f25', 'Réserve salaire', NULL, NULL, 0, NULL, 0, 0),
(47, 'f26', 'Assurance employabilité', '1', NULL, 0, 'option', 0, 0),
(48, 'f34', 'Augmentation du Salaire', NULL, NULL, 0, NULL, 0, 0);

-- --------------------------------------------------------

--
-- Структура таблицы `formulas`
--

CREATE TABLE `formulas` (
  `id` int(11) NOT NULL,
  `field_id` varchar(255) DEFAULT NULL,
  `formula` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

--
-- Дамп данных таблицы `formulas`
--

INSERT INTO `formulas` (`id`, `field_id`, `formula`) VALUES
(1, 'f5', 'f1*(1-f4)'),
(2, 'f12', '5*f5'),
(3, 'f17', '0.12*f30'),
(4, 'f19', '-f18*500'),
(5, 'f21', '-f20*200'),
(6, 'f25', 'f30*f24'),
(7, 'f27', 'f26*400'),
(8, 'f30', '(f33-f8-f9-f10-f11-f12-f13-f14-f15-f16-f27)/(1+0.12+f24)'),
(9, 'f31', 'f33-f8-f9-f10-f11-f12-f13-f14-f15-f16-f17-f27'),
(10, 'f32', 'f5-f19-f21'),
(11, 'f33', 'f32*(f2-f3)/12'),
(12, 'f34', '100*(f31-f6)/f6');

-- --------------------------------------------------------

--
-- Структура таблицы `users`
--

CREATE TABLE `users` (
  `username` varchar(255) NOT NULL,
  `password` varchar(255) DEFAULT NULL,
  `role` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

--
-- Дамп данных таблицы `users`
--

INSERT INTO `users` (`username`, `password`, `role`) VALUES
('admin', 'admin', '0'),
('user', 'user', '1');

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `fields`
--
ALTER TABLE `fields`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `type` (`type`) USING BTREE;
ALTER TABLE `fields` ADD FULLTEXT KEY `description` (`value`);

--
-- Индексы таблицы `formulas`
--
ALTER TABLE `formulas`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Индексы таблицы `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`username`) USING BTREE;

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `fields`
--
ALTER TABLE `fields`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=49;

--
-- AUTO_INCREMENT для таблицы `formulas`
--
ALTER TABLE `formulas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
