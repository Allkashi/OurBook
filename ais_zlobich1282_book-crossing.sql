-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Хост: mysql
-- Время создания: Дек 15 2022 г., 15:49
-- Версия сервера: 8.0.29
-- Версия PHP: 8.0.24

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `ais_zlobich1282_book-crossing`
--

-- --------------------------------------------------------

--
-- Структура таблицы `book`
--

CREATE TABLE `book` (
  `book_name` varchar(255) NOT NULL,
  `book_id` int NOT NULL,
  `book_author` varchar(255) NOT NULL,
  `num_page` int NOT NULL,
  `user_id` int DEFAULT NULL,
  `category_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Информация о книге';

-- --------------------------------------------------------

--
-- Структура таблицы `category`
--

CREATE TABLE `category` (
  `category_name` varchar(255) NOT NULL,
  `category_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Жанры книг';

-- --------------------------------------------------------

--
-- Структура таблицы `fav_category`
--

CREATE TABLE `fav_category` (
  `category_id` int NOT NULL,
  `user_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Любимые категории пользователей';

-- --------------------------------------------------------

--
-- Структура таблицы `history_books`
--

CREATE TABLE `history_books` (
  `date_collect` datetime NOT NULL,
  `date_free` datetime DEFAULT NULL,
  `book_id` int NOT NULL,
  `user_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Время пребывания книг у пользователя';

-- --------------------------------------------------------

--
-- Структура таблицы `user`
--

CREATE TABLE `user` (
  `user_id` int NOT NULL,
  `first_name` varchar(255) NOT NULL,
  `sec_name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `nickname` varchar(255) NOT NULL,
  `country` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Пользователь';

--
-- Дамп данных таблицы `user`
--

INSERT INTO `user` (`user_id`, `first_name`, `sec_name`, `email`, `password`, `nickname`, `country`) VALUES
(1, 'Jeka', 'Hmyriy', 'Jeka@lol.com', '1234567', 'Joka3', 'Russia'),
(2, 'Kostya', 'White', 'Kostua@lol.com', '1234567', 'Kostya3', 'America');

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `book`
--
ALTER TABLE `book`
  ADD PRIMARY KEY (`book_id`),
  ADD KEY `book_user_user_id_fk` (`user_id`),
  ADD KEY `book_category_category_id_fk` (`category_id`);

--
-- Индексы таблицы `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`category_id`);

--
-- Индексы таблицы `fav_category`
--
ALTER TABLE `fav_category`
  ADD KEY `fav_category_category_category_id_fk` (`category_id`),
  ADD KEY `fav_category_user_user_id_fk` (`user_id`);

--
-- Индексы таблицы `history_books`
--
ALTER TABLE `history_books`
  ADD KEY `history_books_book_book_id_fk` (`book_id`),
  ADD KEY `history_books_user_user_id_fk` (`user_id`);

--
-- Индексы таблицы `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`user_id`),
  ADD UNIQUE KEY `login` (`email`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `book`
--
ALTER TABLE `book`
  MODIFY `book_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT для таблицы `category`
--
ALTER TABLE `category`
  MODIFY `category_id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `user`
--
ALTER TABLE `user`
  MODIFY `user_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `book`
--
ALTER TABLE `book`
  ADD CONSTRAINT `book_category_category_id_fk` FOREIGN KEY (`category_id`) REFERENCES `category` (`category_id`),
  ADD CONSTRAINT `book_user_user_id_fk` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`);

--
-- Ограничения внешнего ключа таблицы `fav_category`
--
ALTER TABLE `fav_category`
  ADD CONSTRAINT `fav_category_category_category_id_fk` FOREIGN KEY (`category_id`) REFERENCES `category` (`category_id`),
  ADD CONSTRAINT `fav_category_user_user_id_fk` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`);

--
-- Ограничения внешнего ключа таблицы `history_books`
--
ALTER TABLE `history_books`
  ADD CONSTRAINT `history_books_book_book_id_fk` FOREIGN KEY (`book_id`) REFERENCES `book` (`book_id`),
  ADD CONSTRAINT `history_books_user_user_id_fk` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
