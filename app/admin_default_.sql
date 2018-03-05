-- phpMyAdmin SQL Dump
-- version 4.5.4.1deb2ubuntu2
-- http://www.phpmyadmin.net
--
-- Хост: localhost
-- Время создания: Ноя 27 2017 г., 06:09
-- Версия сервера: 5.7.20-0ubuntu0.16.04.1
-- Версия PHP: 7.0.22-0ubuntu0.16.04.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `admin_default`
--

-- --------------------------------------------------------

--
-- Структура таблицы `balance_actions`
--

CREATE TABLE `balance_actions` (
  `id` bigint(11) NOT NULL,
  `admin` bigint(11) NOT NULL,
  `uid` bigint(11) NOT NULL,
  `type` varchar(10) NOT NULL,
  `amount` varchar(100) NOT NULL,
  `tokens_amount` varchar(100) NOT NULL,
  `comment` text NOT NULL,
  `time` varchar(20) NOT NULL,
  `product_id` bigint(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `bounty`
--

CREATE TABLE `bounty` (
  `id` bigint(11) NOT NULL,
  `uid` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `type` varchar(20) NOT NULL,
  `time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `comment` text,
  `translation_language` int(3) DEFAULT NULL,
  `translation_type` int(2) DEFAULT NULL,
  `content_type` int(2) DEFAULT NULL,
  `content_url` varchar(200) DEFAULT NULL,
  `signature_rank` varchar(20) DEFAULT NULL,
  `approved` int(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `currency_settings`
--

CREATE TABLE `currency_settings` (
  `product_id` bigint(11) NOT NULL,
  `ETH` tinyint(1) NOT NULL DEFAULT '1',
  `BTC` tinyint(1) NOT NULL DEFAULT '1',
  `LTC` tinyint(1) NOT NULL DEFAULT '1',
  `ETC` tinyint(1) NOT NULL DEFAULT '1',
  `BCH` tinyint(1) NOT NULL DEFAULT '1',
  `XRP` tinyint(1) NOT NULL DEFAULT '1',
  `ZEC` tinyint(1) NOT NULL DEFAULT '1',
  `DASH` tinyint(1) NOT NULL DEFAULT '1',
  `WAVES` tinyint(1) NOT NULL DEFAULT '1',
  `DOGE` tinyint(1) NOT NULL DEFAULT '1',
  `XEM` tinyint(1) NOT NULL DEFAULT '1',
  `NMC` tinyint(1) NOT NULL DEFAULT '1',
  `XMR` tinyint(1) NOT NULL DEFAULT '1',
  `DCR` tinyint(1) NOT NULL DEFAULT '1',
  `DGB` tinyint(1) NOT NULL DEFAULT '1',
  `POT` tinyint(1) NOT NULL DEFAULT '1',
  `SIB` tinyint(1) NOT NULL DEFAULT '1',
  `VTC` tinyint(1) NOT NULL DEFAULT '1',
  `GAME` tinyint(1) NOT NULL DEFAULT '1',
  `SBD` tinyint(1) NOT NULL DEFAULT '0',
  `GOLOS` tinyint(1) NOT NULL DEFAULT '0',
  `BTS` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `currency_settings`
--

INSERT INTO `currency_settings` (`product_id`, `ETH`, `BTC`, `LTC`, `ETC`, `BCH`, `XRP`, `ZEC`, `DASH`, `WAVES`, `DOGE`, `XEM`, `NMC`, `XMR`, `DCR`, `DGB`, `POT`, `SIB`, `VTC`, `GAME`, `SBD`, `GOLOS`, `BTS`) VALUES
(1, 1, 1, 1, 1, 1, 0, 1, 1, 1, 1, 0, 1, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1),
(2, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 0);

-- --------------------------------------------------------

--
-- Структура таблицы `currency_to_eth`
--

CREATE TABLE `currency_to_eth` (
  `id` bigint(11) NOT NULL,
  `time` varchar(100) DEFAULT NULL,
  `BTC` varchar(100) DEFAULT NULL,
  `ETH` varchar(100) DEFAULT NULL,
  `LTC` varchar(100) DEFAULT NULL,
  `ETC` varchar(100) DEFAULT NULL,
  `BCH` varchar(100) DEFAULT NULL,
  `XRP` varchar(100) DEFAULT NULL,
  `ZEC` varchar(100) DEFAULT NULL,
  `DASH` varchar(100) DEFAULT NULL,
  `WAVES` varchar(100) DEFAULT NULL,
  `DOGE` varchar(100) DEFAULT NULL,
  `XEM` varchar(100) DEFAULT NULL,
  `NMC` varchar(100) DEFAULT NULL,
  `XMR` varchar(100) DEFAULT NULL,
  `SBD` varchar(100) DEFAULT NULL,
  `DCR` varchar(100) DEFAULT NULL,
  `DGB` varchar(100) DEFAULT NULL,
  `POT` varchar(100) DEFAULT NULL,
  `SIB` varchar(100) DEFAULT NULL,
  `VTC` varchar(100) DEFAULT NULL,
  `GAME` varchar(100) DEFAULT NULL,
  `GOLOS` varchar(100) DEFAULT NULL,
  `BTS` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `currency_to_eth`
--

INSERT INTO `currency_to_eth` (`id`, `time`, `BTC`, `ETH`, `LTC`, `ETC`, `BCH`, `XRP`, `ZEC`, `DASH`, `WAVES`, `DOGE`, `XEM`, `NMC`, `XMR`, `SBD`, `DCR`, `DGB`, `POT`, `SIB`, `VTC`, `GAME`, `GOLOS`, `BTS`) VALUES
(1, '1510108005', '24.85313043', '1', '0.20744950', '0.04722704', '2.14185178', '0.00070193', NULL, '0.98994709', '0.01252896', '0.00000399', '0.00062495', '0.00492688', '0.33469557', '0.96754519', '0.05940008', '0.00002957', '0.00042101', '0.00366000', '0.01112747', '0.00591455', '0.12814488', '0.05922847');

-- --------------------------------------------------------

--
-- Структура таблицы `currency_to_usd`
--

CREATE TABLE `currency_to_usd` (
  `id` bigint(11) NOT NULL,
  `time` varchar(100) DEFAULT NULL,
  `BTC` varchar(100) DEFAULT NULL,
  `ETH` varchar(100) DEFAULT NULL,
  `LTC` varchar(100) DEFAULT NULL,
  `ETC` varchar(100) DEFAULT NULL,
  `BCH` varchar(100) DEFAULT NULL,
  `XRP` varchar(100) DEFAULT NULL,
  `ZEC` varchar(100) DEFAULT NULL,
  `DASH` varchar(100) DEFAULT NULL,
  `WAVES` varchar(100) DEFAULT NULL,
  `DOGE` varchar(100) DEFAULT NULL,
  `XEM` varchar(100) DEFAULT NULL,
  `NMC` varchar(100) DEFAULT NULL,
  `XMR` varchar(100) DEFAULT NULL,
  `SBD` varchar(100) DEFAULT NULL,
  `DCR` varchar(100) DEFAULT NULL,
  `DGB` varchar(100) DEFAULT NULL,
  `POT` varchar(100) DEFAULT NULL,
  `SIB` varchar(100) DEFAULT NULL,
  `VTC` varchar(100) DEFAULT NULL,
  `GAME` varchar(100) DEFAULT NULL,
  `GOLOS` varchar(100) DEFAULT NULL,
  `BTS` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `currency_to_usd`
--

INSERT INTO `currency_to_usd` (`id`, `time`, `BTC`, `ETH`, `LTC`, `ETC`, `BCH`, `XRP`, `ZEC`, `DASH`, `WAVES`, `DOGE`, `XEM`, `NMC`, `XMR`, `SBD`, `DCR`, `DGB`, `POT`, `SIB`, `VTC`, `GAME`, `GOLOS`, `BTS`) VALUES
(1, '1511762805', '9547.92057576', '483.72006717', '89.75914692', '21.84210524', '1683.46652563', '0.24677673', '339.05551767', '616.76094247', '5.58887531', '0.00199894', '0.21318453', '1.70525669', '161.52819554', '1.70315807', '60.76366600', '0.01060000', '0.28290489', '1.58925138', '4.74669101', '1.59998999', '0.12097215', '0.71650000');

-- --------------------------------------------------------

--
-- Структура таблицы `deposit_wallets`
--

CREATE TABLE `deposit_wallets` (
  `id` bigint(11) NOT NULL,
  `uid` bigint(11) NOT NULL,
  `product_id` bigint(11) NOT NULL,
  `currency` varchar(10) NOT NULL,
  `wallet_address` varchar(100) NOT NULL,
  `time` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `payments`
--

CREATE TABLE `payments` (
  `id` bigint(11) NOT NULL,
  `uid` bigint(11) DEFAULT NULL,
  `referral_transaction` varchar(10) DEFAULT NULL,
  `system` varchar(20) DEFAULT NULL,
  `wallet_address` varchar(100) DEFAULT NULL,
  `transaction_id` varchar(100) DEFAULT NULL,
  `amount` varchar(100) DEFAULT NULL,
  `amounti` varchar(100) DEFAULT NULL,
  `fee` varchar(100) DEFAULT NULL,
  `feei` varchar(100) DEFAULT NULL,
  `confirms` int(10) DEFAULT NULL,
  `currency` varchar(20) DEFAULT NULL,
  `status` int(10) DEFAULT NULL,
  `status_text` varchar(150) DEFAULT NULL,
  `exchange_rate` varchar(100) DEFAULT NULL,
  `token_price` varchar(100) DEFAULT NULL,
  `complete` int(1) DEFAULT '0',
  `tokens_amount` varchar(100) DEFAULT '0',
  `tokens_amount_bonus` varchar(100) DEFAULT '0',
  `conversion` varchar(10) DEFAULT NULL,
  `time` varchar(20) DEFAULT NULL,
  `product_id` bigint(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `products`
--

CREATE TABLE `products` (
  `id` bigint(11) NOT NULL,
  `email` varchar(100) DEFAULT NULL,
  `smtp_host` varchar(100) DEFAULT NULL,
  `smtp_password` varchar(100) DEFAULT NULL,
  `smtp_security` varchar(10) DEFAULT NULL,
  `smtp_port` bigint(11) DEFAULT NULL,
  `usd_raised` varchar(100) NOT NULL DEFAULT '0',
  `eth_raised` varchar(100) NOT NULL DEFAULT '0',
  `eth_raised_smartcontract` varchar(100) NOT NULL DEFAULT '0',
  `tokens_sold` varchar(100) DEFAULT '0',
  `tokens_bonus` varchar(100) NOT NULL DEFAULT '0',
  `tokens_referrer` varchar(100) NOT NULL DEFAULT '0',
  `tokens_signup` varchar(100) NOT NULL DEFAULT '0',
  `ethereum_last_block` varchar(100) NOT NULL DEFAULT '0',
  `ethereum_timestamp` varchar(100) NOT NULL DEFAULT '0',
  `ethereum_field_required` int(1) NOT NULL DEFAULT '0',
  `name` varchar(30) NOT NULL,
  `short_name` varchar(50) DEFAULT NULL,
  `url` varchar(200) NOT NULL,
  `url_main` varchar(150) DEFAULT NULL,
  `url_faq` varchar(300) DEFAULT NULL,
  `user_agreement` varchar(150) DEFAULT NULL,
  `email_activation` int(1) NOT NULL DEFAULT '0',
  `captcha_enabled` tinyint(1) NOT NULL DEFAULT '0',
  `bonus_percent` varchar(10) NOT NULL DEFAULT '0',
  `signup_tokens` varchar(10) NOT NULL DEFAULT '0',
  `support_email` varchar(100) DEFAULT NULL,
  `referral_percent` varchar(10) NOT NULL DEFAULT '0',
  `session_domain` varchar(200) NOT NULL,
  `token_name` varchar(15) NOT NULL,
  `smartcontract_address` varchar(42) DEFAULT NULL,
  `smartcontract_creator` varchar(42) DEFAULT NULL,
  `coinpayments_public_key` varchar(100) DEFAULT NULL,
  `coinpayments_private_key` varchar(100) DEFAULT NULL,
  `coinpayments_ipn_secret` varchar(100) DEFAULT NULL,
  `coinpayments_merchant_id` varchar(100) DEFAULT NULL,
  `etherscan_api_key` varchar(100) DEFAULT NULL,
  `token_price` varchar(20) DEFAULT NULL,
  `token_price_eth` varchar(100) NOT NULL DEFAULT '0',
  `footer_copyright` varchar(200) DEFAULT NULL,
  `twitter_consumer_key` varchar(200) NOT NULL,
  `twitter_consumer_secret` varchar(200) NOT NULL,
  `facebook_app_id` varchar(200) NOT NULL,
  `facebook_app_secret` varchar(200) NOT NULL,
  `recaptcha_site_key` varchar(200) DEFAULT NULL,
  `recaptcha_secret` varchar(200) DEFAULT NULL,
  `google_oauth` tinyint(1) NOT NULL DEFAULT '0',
  `SBD_wallet` varchar(100) DEFAULT NULL,
  `GOLOS_wallet` varchar(100) DEFAULT NULL,
  `BTS_wallet` varchar(100) DEFAULT NULL,
  `bitcointalk` varchar(150) DEFAULT NULL,
  `facebook` varchar(150) DEFAULT NULL,
  `twitter` varchar(150) DEFAULT NULL,
  `telegram` varchar(150) DEFAULT NULL,
  `vk` varchar(150) DEFAULT NULL,
  `youtube` varchar(150) DEFAULT NULL,
  `active` int(1) NOT NULL DEFAULT '0',
  `domain` varchar(200) NOT NULL,
  `campaign_referral_percent` varchar(10) NOT NULL DEFAULT '0',
  `campaign_referral_url` varchar(200) DEFAULT NULL,
  `campaign_articles` int(1) NOT NULL DEFAULT '0',
  `campaign_translation` int(1) NOT NULL DEFAULT '0',
  `campaign_signature` int(1) NOT NULL DEFAULT '0',
  `signature_full` text,
  `signature_senior` text,
  `signature_hero` text,
  `signature_legendary` text,
  `signature_junior` text,
  `signature_newbie` text,
  `campaign_facebook` varchar(200) DEFAULT NULL,
  `campaign_twitter` varchar(200) DEFAULT NULL,
  `campaign_instagram` varchar(200) DEFAULT NULL,
  `campaign_telegram` varchar(200) DEFAULT NULL,
  `campaign_medium` varchar(200) DEFAULT NULL,
  `campaign_slack` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `products`
--

INSERT INTO `products` (`id`, `email`, `smtp_host`, `smtp_password`, `smtp_security`, `smtp_port`, `usd_raised`, `eth_raised`, `eth_raised_smartcontract`, `tokens_sold`, `tokens_bonus`, `tokens_referrer`, `tokens_signup`, `ethereum_last_block`, `ethereum_timestamp`, `ethereum_field_required`, `name`, `short_name`, `url`, `url_main`, `url_faq`, `user_agreement`, `email_activation`, `captcha_enabled`, `bonus_percent`, `signup_tokens`, `support_email`, `referral_percent`, `session_domain`, `token_name`, `smartcontract_address`, `smartcontract_creator`, `coinpayments_public_key`, `coinpayments_private_key`, `coinpayments_ipn_secret`, `coinpayments_merchant_id`, `etherscan_api_key`, `token_price`, `token_price_eth`, `footer_copyright`, `twitter_consumer_key`, `twitter_consumer_secret`, `facebook_app_id`, `facebook_app_secret`, `recaptcha_site_key`, `recaptcha_secret`, `google_oauth`, `SBD_wallet`, `GOLOS_wallet`, `BTS_wallet`, `bitcointalk`, `facebook`, `twitter`, `telegram`, `vk`, `youtube`, `active`, `domain`, `campaign_referral_percent`, `campaign_referral_url`, `campaign_articles`, `campaign_translation`, `campaign_signature`, `signature_full`, `signature_senior`, `signature_hero`, `signature_legendary`, `signature_junior`, `signature_newbie`, `campaign_facebook`, `campaign_twitter`, `campaign_instagram`, `campaign_telegram`, `campaign_medium`, `campaign_slack`) VALUES
(1, 'sales@deex.exchange', 'smtp.beget.com', 'CDbC[K*{', 'ssl', 465, '100168.56936074741', '0', '3400.1156295825', '1218460.952445304', '0', '37922.92555058963', '202265', '4625973', '1511762806', 0, 'DEEX Token Sale', 'DEEX', 'https://presale.deex.exchange/', 'https://deex.exchange/', 'https://deex.exchange/', '', 1, 1, '0', '5', 'sales@deex.exchange', '5', 'presale.deex.exchange', 'DEEX', '0xc16cf13922c18de7842374f9baace4489f1d24af', '0x4412041c61ef9a1783eb3f8bc526ae5d05588cda', '9d7e9f4bdfce68b8998bd70469b4987f36e419c32828a022b3e561430d066011', 'f3D8525721629CACdec95D34A5738cf79275da21fC850020fE90eb9E205Fa1Aa', 'by54by@@5665b4y645yaseATkvoemhgDSAdax2fdfgd', '5fc8680b7f069f89085c2c92ed71c0b3', 'FKZ95MYIIJXUYM47M45WKDDBX12RT7VSMF', '0.1', '0', 'Â© DEEX exchange', 'EvHhwazP2PO6QDSDd1bwPr76s', 'bqcDYN40PHhXeci97BmVBa9e5PnhtGL2Xkkj32v7QoN0A5F9aV', '495576070821607', 'e538ca0e28829b7d7f1ca31770a73719', '6LcqwjkUAAAAAPlowLA1T-Gue_YxlI7kcBD_1chj', '6LcqwjkUAAAAAKbb_Z3g3hQBHilpuLkx_ZzkFxWZ', 1, '@deex', '@deexexchange', 'deexpresale1', 'https://bitcointalk.org/index.php?topic=2266957', 'https://www.facebook.com/groups/deex.exchange/', 'https://twitter.com/deex_exchange', 'https://t.me/deexexchange', 'https://vk.com/deex.exchange', 'https://www.youtube.com/channel/UC5oYUk9QC4kbM5ZBpodOUcQ', 1, 'presale.deex.exchange', '0', NULL, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2, 'sales@deex.exchange', 'smtp.beget.com', 'CDbC[K*{', 'ssl', 465, '0', '0', '0', '0', '0', '0', '0', '0', '0', 0, 'DEEX Bounty', 'DEEX', 'https://bounty.deex.exchange/', 'https://deex.exchange/', 'https://deex.exchange/', NULL, 1, 0, '0', '0', NULL, '0', 'bounty.deex.exchange', 'DEEX', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', '&copy; DEEX exchange', 'UPtkfChpui8nNNQzOLs2cJFaO', 'MC0AWz1ZyXS3iTZtpv5sgusC7GkNUO7yf9a0rVWXEUURvJAErM', '1487850031251266', 'e4967c8cd72483103a5c459267f4d8a8', NULL, NULL, 1, NULL, NULL, NULL, 'https://bitcointalk.org/index.php?topic=2266957', 'https://www.facebook.com/groups/deex.exchange/', 'https://twitter.com/deex_exchange', 'https://t.me/deexexchange', 'https://vk.com/deex.exchange', 'https://www.youtube.com/channel/UC5oYUk9QC4kbM5ZBpodOUcQ', 1, 'bounty.deex.exchange', '5', 'https://presale.deex.exchange/', 1, 1, 0, NULL, NULL, NULL, NULL, '', NULL, 'https://www.facebook.com/groups/deex.exchange/', 'https://twitter.com/deex_exchange', 'https://www.instagram.com/the_deex/', 'https://t.me/deexexchange', 'https://medium.com/@the_deex', 'https://vk.com/deex.exchange');

-- --------------------------------------------------------

--
-- Структура таблицы `requests`
--

CREATE TABLE `requests` (
  `id` bigint(11) NOT NULL,
  `uid` bigint(11) NOT NULL,
  `product_id` bigint(11) NOT NULL,
  `code` varchar(20) NOT NULL,
  `time` varchar(20) DEFAULT NULL,
  `type` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `sessions`
--

CREATE TABLE `sessions` (
  `id` bigint(11) NOT NULL,
  `uid` bigint(11) NOT NULL,
  `product_id` bigint(11) NOT NULL,
  `hash` varchar(40) NOT NULL,
  `time` varchar(20) DEFAULT NULL,
  `ip` varchar(39) DEFAULT NULL,
  `agent` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `support`
--

CREATE TABLE `support` (
  `id` bigint(11) NOT NULL,
  `uid` bigint(11) DEFAULT NULL,
  `subject` int(3) DEFAULT NULL,
  `message` text,
  `status` int(1) NOT NULL DEFAULT '0',
  `time` varchar(20) DEFAULT NULL,
  `product_id` bigint(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `users`
--

CREATE TABLE `users` (
  `id` bigint(11) NOT NULL,
  `email` varchar(100) DEFAULT NULL,
  `product_id` bigint(11) DEFAULT NULL,
  `password` varchar(60) DEFAULT NULL,
  `isactive` tinyint(1) DEFAULT '0',
  `time` varchar(20) DEFAULT NULL,
  `ip` varchar(50) DEFAULT NULL,
  `referrer` bigint(11) DEFAULT NULL,
  `p` varchar(100) DEFAULT NULL,
  `two_factor` varchar(16) DEFAULT NULL,
  `oauth_service` varchar(10) DEFAULT NULL,
  `country_code` varchar(2) DEFAULT NULL,
  `first_name` varchar(500) DEFAULT NULL,
  `last_name` varchar(500) DEFAULT NULL,
  `gender` varchar(500) DEFAULT NULL,
  `google_link` varchar(500) DEFAULT NULL,
  `facebook_birthday` varchar(500) DEFAULT NULL,
  `facebook_website` varchar(500) DEFAULT NULL,
  `facebook_location` varchar(500) DEFAULT NULL,
  `facebook_id` varchar(500) DEFAULT NULL,
  `oauth_email` varchar(500) DEFAULT NULL,
  `oauth_id` varchar(500) DEFAULT NULL,
  `twitter_name` varchar(500) DEFAULT NULL,
  `twitter_username` varchar(500) DEFAULT NULL,
  `twitter_location` varchar(500) DEFAULT NULL,
  `twitter_website` varchar(500) DEFAULT NULL,
  `twitter_followers` varchar(500) DEFAULT NULL,
  `twitter_friends` varchar(500) DEFAULT NULL,
  `twitter_created_at` varchar(500) DEFAULT NULL,
  `twitter_lang` varchar(500) DEFAULT NULL,
  `twitter_time_zone` varchar(500) DEFAULT NULL,
  `twitter_verified` varchar(50) DEFAULT NULL,
  `twitter_image` varchar(500) DEFAULT NULL,
  `oauth_google` varchar(500) DEFAULT NULL,
  `oauth_twitter` varchar(500) DEFAULT NULL,
  `oauth_facebook` varchar(500) DEFAULT NULL,
  `ethereum_address` varchar(50) DEFAULT NULL,
  `ethereum_address_provided` varchar(42) DEFAULT NULL,
  `SBD_address_provided` tinyint(1) NOT NULL DEFAULT '0',
  `GOLOS_address_provided` tinyint(1) NOT NULL DEFAULT '0',
  `BTS_address_provided` tinyint(1) NOT NULL DEFAULT '0',
  `ethereum_balance` varchar(100) DEFAULT '0',
  `ethereum_balance_timestamp` varchar(20) DEFAULT '0',
  `balance` varchar(100) DEFAULT '0',
  `balance_bonus` varchar(100) DEFAULT '0',
  `balance_referrer` varchar(100) DEFAULT '0',
  `balance_bounty` varchar(100) NOT NULL DEFAULT '0',
  `admin` int(1) DEFAULT '0',
  `bitcointalk_username` varchar(100) DEFAULT NULL,
  `translation_pending` tinyint(1) NOT NULL DEFAULT '0',
  `signature_pending` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `user_wallets`
--

CREATE TABLE `user_wallets` (
  `id` bigint(11) NOT NULL,
  `uid` bigint(11) NOT NULL,
  `product_id` bigint(11) NOT NULL,
  `wallet_address` varchar(100) NOT NULL,
  `currency` varchar(20) NOT NULL DEFAULT 'ETH',
  `time` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `balance_actions`
--
ALTER TABLE `balance_actions`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `bounty`
--
ALTER TABLE `bounty`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `currency_settings`
--
ALTER TABLE `currency_settings`
  ADD PRIMARY KEY (`product_id`);

--
-- Индексы таблицы `currency_to_eth`
--
ALTER TABLE `currency_to_eth`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `currency_to_usd`
--
ALTER TABLE `currency_to_usd`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `deposit_wallets`
--
ALTER TABLE `deposit_wallets`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `payments`
--
ALTER TABLE `payments`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `requests`
--
ALTER TABLE `requests`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `support`
--
ALTER TABLE `support`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `user_wallets`
--
ALTER TABLE `user_wallets`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `balance_actions`
--
ALTER TABLE `balance_actions`
  MODIFY `id` bigint(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;
--
-- AUTO_INCREMENT для таблицы `bounty`
--
ALTER TABLE `bounty`
  MODIFY `id` bigint(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=102;
--
-- AUTO_INCREMENT для таблицы `currency_to_eth`
--
ALTER TABLE `currency_to_eth`
  MODIFY `id` bigint(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT для таблицы `currency_to_usd`
--
ALTER TABLE `currency_to_usd`
  MODIFY `id` bigint(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT для таблицы `deposit_wallets`
--
ALTER TABLE `deposit_wallets`
  MODIFY `id` bigint(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1820;
--
-- AUTO_INCREMENT для таблицы `payments`
--
ALTER TABLE `payments`
  MODIFY `id` bigint(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1118;
--
-- AUTO_INCREMENT для таблицы `products`
--
ALTER TABLE `products`
  MODIFY `id` bigint(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT для таблицы `requests`
--
ALTER TABLE `requests`
  MODIFY `id` bigint(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=45470;
--
-- AUTO_INCREMENT для таблицы `sessions`
--
ALTER TABLE `sessions`
  MODIFY `id` bigint(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=271;
--
-- AUTO_INCREMENT для таблицы `support`
--
ALTER TABLE `support`
  MODIFY `id` bigint(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=39;
--
-- AUTO_INCREMENT для таблицы `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=45353;
--
-- AUTO_INCREMENT для таблицы `user_wallets`
--
ALTER TABLE `user_wallets`
  MODIFY `id` bigint(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12414;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
