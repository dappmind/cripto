-- phpMyAdmin SQL Dump
-- version 4.5.4.1deb2ubuntu2
-- http://www.phpmyadmin.net
--
-- Хост: localhost
-- Время создания: Фев 28 2018 г., 10:18
-- Версия сервера: 5.7.21-0ubuntu0.16.04.1
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
(1, 1, 1, 1, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);

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
(1, '1517609341', '9.59493725', '1', '0.14229749', '0.02458794', '1.29210339', '0.00096290', '0.40547840', '0.63135876', '0.00679772', '0.00000489', '0.00063715', '0.00324641', '0.25851887', '0.00413974', '0.08521346', '0.00004369', '0.00014746', '0.00217594', '0.00373080', '0.00312699', '0.00021378', '0.00056060');

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
(1, '1517834536', '7619.72388702', '771.14594141', '135.16154769', '18.99978831', '1013.11093181', '0.74524219', '321.41871869', '508.30132190', '5.28597589', '0.00405925', '0.53264708', '2.52116589', '193.57148219', '2.98868396', '76.00000001', '0.03270000', '0.14538760', '1.66410070', '2.71000000', '3.00800100', '0.12837741', '1.05000000');

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

--
-- Дамп данных таблицы `deposit_wallets`
--

INSERT INTO `deposit_wallets` (`id`, `uid`, `product_id`, `currency`, `wallet_address`, `time`) VALUES
(1, 1, 1, 'ETH', '0xc45cda54c34cc01d8ad410bca0f820cfb328cf67', '1513002872'),
(2, 1, 1, 'BTC', '3HLZx9oMLFMMPt1GyzEauCbkYwyjZQRjUr', '1513003433'),
(3, 1, 1, 'LTC', 'LhFoYJeZHHzFtkSpuXTpQz9kwA12bDNcXg', '1513140987'),
(4, 4, 1, 'ETH', '0xa89b854c4b2165e9d70832ce728545d10e9c1f1e', '1516202438'),
(5, 4, 1, 'LTC', 'LZECKToLj1pt6i5DrsWwpvMyFoLMZvxvqn', '1516391989');

-- --------------------------------------------------------

--
-- Структура таблицы `payments`
--

CREATE TABLE `payments` (
  `id` bigint(11) NOT NULL,
  `uid` bigint(11) DEFAULT NULL,
  `referral_transaction` varchar(10) DEFAULT NULL,
  `referral_link` varchar(8) DEFAULT NULL,
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
  `other_raised` varchar(100) NOT NULL DEFAULT '0',
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
  `color` varchar(6) DEFAULT 'ffffff',
  `smartcontract_address` varchar(42) DEFAULT NULL,
  `smartcontract_creator` varchar(42) DEFAULT NULL,
  `token_decimals` tinyint(2) NOT NULL DEFAULT '0',
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

INSERT INTO `products` (`id`, `email`, `smtp_host`, `smtp_password`, `smtp_security`, `smtp_port`, `usd_raised`, `eth_raised`, `eth_raised_smartcontract`, `other_raised`, `tokens_sold`, `tokens_bonus`, `tokens_referrer`, `tokens_signup`, `ethereum_last_block`, `ethereum_timestamp`, `ethereum_field_required`, `name`, `short_name`, `url`, `url_main`, `url_faq`, `user_agreement`, `email_activation`, `captcha_enabled`, `bonus_percent`, `signup_tokens`, `support_email`, `referral_percent`, `session_domain`, `token_name`, `color`, `smartcontract_address`, `smartcontract_creator`, `token_decimals`, `coinpayments_public_key`, `coinpayments_private_key`, `coinpayments_ipn_secret`, `coinpayments_merchant_id`, `etherscan_api_key`, `token_price`, `token_price_eth`, `footer_copyright`, `twitter_consumer_key`, `twitter_consumer_secret`, `facebook_app_id`, `facebook_app_secret`, `recaptcha_site_key`, `recaptcha_secret`, `google_oauth`, `SBD_wallet`, `GOLOS_wallet`, `BTS_wallet`, `bitcointalk`, `facebook`, `twitter`, `telegram`, `vk`, `youtube`, `active`, `domain`, `campaign_referral_percent`, `campaign_referral_url`, `campaign_articles`, `campaign_translation`, `campaign_signature`, `signature_full`, `signature_senior`, `signature_hero`, `signature_legendary`, `signature_junior`, `signature_newbie`, `campaign_facebook`, `campaign_twitter`, `campaign_instagram`, `campaign_telegram`, `campaign_medium`, `campaign_slack`) VALUES
(1, '', '', '', 'ssl', 465, '0', '0', '0.6', '0', '0', '0', '0', '0', '0', '1517834536', 0, 'RealtyCoin ICO', 'REL', 'http://rel.relet.io/', 'http://relet.io/', 'http://rel.relet.io/', '', 1, 1, '25', '0', 'ico@realtycash.pro', '0', 'rel.relet.io', 'REL', 'f3df71', '0x961BB40FD91453DA2c9a40987cb85DB494B8eC3d', '0x6394b37cf80a7358b38068f0ca4760ad49983a1b', 9, 'c6eb2374552b99cf0c2785dcd6ede2cab3ccc3b607b22d67ed4648e6957e80a1', '72E8D9ff29D26d8f71096ABa05b6244649135f24d46Af19f42C05A5fA137eF7C', 'gererohreguregrehvbu34r743yr438rfgh7483f743gf87wfg87ew', '680127337684f0a827b8e9b03c2f3d9d', 'VSERE2KVT6SH2RSBAR165ANJXT6R27HV6W', '.50', '0', 'Â© RealtyCoin', '5Fj13FgOkUZFW5wzTsCisRk9V', 'YPw25hfUxp5RWkDQZcIq29wIghaB774Bm4GaQMDMCAlwEorUlv', '237952420074181', '47b0901d9d818eb7ed6b7143068f7ab5', '6Lf8OjwUAAAAAPdDL_LkLTaFtXAa_98s9XnO2hAW', '6Lf8OjwUAAAAAOkRd75KNMnNdz3bR2oAyzGKPRpV', 1, '', '', '', 'https://bitcointalk.org/', 'https://www.facebook.com/', 'https://twitter.com/', 'https://t.me/coinplace_eng', 'https://vk.com/', 'https://www.youtube.com/', 1, 'rel.relet.io', '0', NULL, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Структура таблицы `redirects`
--

CREATE TABLE `redirects` (
  `id` bigint(11) NOT NULL,
  `url` text NOT NULL,
  `type` varchar(20) DEFAULT NULL,
  `product_id` bigint(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `referral_links`
--

CREATE TABLE `referral_links` (
  `id` bigint(11) NOT NULL,
  `link` varchar(8) NOT NULL,
  `comment` text NOT NULL,
  `referrals` varchar(20) NOT NULL DEFAULT '0',
  `referrals_buyers` varchar(20) NOT NULL DEFAULT '0',
  `referral_visits` varchar(20) NOT NULL DEFAULT '0',
  `referral_visits_portal` varchar(20) NOT NULL DEFAULT '0',
  `referral_visits_external` varchar(20) NOT NULL DEFAULT '0',
  `referral_visits_wp` varchar(20) NOT NULL DEFAULT '0',
  `time` varchar(20) NOT NULL,
  `product_id` bigint(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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

--
-- Дамп данных таблицы `sessions`
--

INSERT INTO `sessions` (`id`, `uid`, `product_id`, `hash`, `time`, `ip`, `agent`) VALUES
(4, 3, 1, 'ad0d6315604abb9d2047b25f43c2b0fd66a59f85', '1513101007', '68.168.176.218', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_12_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.84 Safari/537.36'),
(6, 1, 1, '3586f9d0ca31e9512f8bacf8e95131389b307c74', '1513198584', '2607:fb90:98be:d74c:8096:a636:2ddc:7bad', 'Mozilla/5.0 (Linux; Android 7.0; LG-TP450 Build/NRD90U) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.84 Mobile Safari/537.36'),
(12, 4, 1, '14b962d772ea252d131eb2337c44d17308238e07', '1517609407', '174.76.82.24', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:58.0) Gecko/20100101 Firefox/58.0');

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
  `referrals` varchar(20) NOT NULL DEFAULT '0',
  `referral_visits` varchar(20) NOT NULL DEFAULT '0',
  `referral_link` varchar(8) DEFAULT NULL,
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
  `p` varchar(100) DEFAULT NULL,
  `admin` int(1) DEFAULT '0',
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
  `bitcointalk_username` varchar(100) DEFAULT NULL,
  `translation_pending` tinyint(1) NOT NULL DEFAULT '0',
  `signature_pending` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `users`
--

INSERT INTO `users` (`id`, `email`, `product_id`, `password`, `isactive`, `time`, `ip`, `referrer`, `referrals`, `referral_visits`, `referral_link`, `two_factor`, `oauth_service`, `country_code`, `first_name`, `last_name`, `gender`, `google_link`, `facebook_birthday`, `facebook_website`, `facebook_location`, `facebook_id`, `oauth_email`, `oauth_id`, `twitter_name`, `twitter_username`, `twitter_location`, `twitter_website`, `twitter_followers`, `twitter_friends`, `twitter_created_at`, `twitter_lang`, `twitter_time_zone`, `twitter_verified`, `twitter_image`, `oauth_google`, `oauth_twitter`, `oauth_facebook`, `p`, `admin`, `ethereum_address`, `ethereum_address_provided`, `SBD_address_provided`, `GOLOS_address_provided`, `BTS_address_provided`, `ethereum_balance`, `ethereum_balance_timestamp`, `balance`, `balance_bonus`, `balance_referrer`, `balance_bounty`, `bitcointalk_username`, `translation_pending`, `signature_pending`) VALUES
(1, 'testuser@example.com', 1, '$2y$10$2oOg47srCdJBdbvehOMMJu8ru4z3tKOKz2Ueon6owrC3nJu0cGds6', 1, '1512560728', '0.0.0.0', NULL, '0', '1', NULL, NULL, NULL, 'ru', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'dGVzdHVzZXJAZXhhbXBsZS5jb20x', 1, NULL, '0', 0, 0, 0, '0', '0', '1', '0', '0', '0', NULL, 0, 0),
(2, NULL, 1, NULL, 1, '1512561614', '0.0.0.0', NULL, '0', '0', NULL, NULL, 'google', 'ru', 'TechBench', NULL, NULL, 'https://plus.google.com/107518533169122930680', NULL, NULL, NULL, NULL, 'techbench-google@yahoo.com', '107518533169122930680', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 0, 0, 0, '0', '0', '0', '0', '0', '0', NULL, 0, 0),
(3, 'kbreenconsulting@gmail.com', 1, '$2y$10$9NOio6UalR8WtfbikRSB.eb72esaPOYUG2I6qOgXnwU3W02USrFHq', 1, '1513101007', '68.168.176.218', NULL, '0', '0', NULL, NULL, NULL, 'us', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'S2lyc2huZXIxIQ==', 0, NULL, '0', 0, 0, 0, '0', '0', '0', '0', '0', '0', NULL, 0, 0),
(4, 'jm@migfund.com', 1, '$2y$10$navndGs5on5IB.uEOcf.r.7RwTidTknThoyYUrQju3kWaG8ZlXgg.', 1, '1514574370', '71.220.30.112', NULL, '0', '0', NULL, NULL, NULL, 'us', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'cmF6ZHZhdHJlZSE=', 1, NULL, '0', 0, 0, 0, '0', '0', '0', '0', '0', '0', NULL, 0, 0),
(5, 'info@dappmind.com', 1, '$2y$10$6V2fmNYvrpr6TXg3mBgkuOu80EP8.gxPrBVOfLjPYvjk4YIJFOTsO', 0, '1514574494', '71.220.30.112', NULL, '0', '0', NULL, NULL, NULL, 'us', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'cmF6ZHZhdHJlZSE=', 0, NULL, '0', 0, 0, 0, '0', '0', '0', '0', '0', '0', NULL, 0, 0);

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

-- --------------------------------------------------------

--
-- Структура таблицы `visits`
--

CREATE TABLE `visits` (
  `id` bigint(11) NOT NULL,
  `uid` bigint(11) DEFAULT NULL,
  `referral_link` varchar(8) DEFAULT NULL,
  `type` varchar(20) DEFAULT NULL,
  `ip` varchar(50) DEFAULT NULL,
  `country` varchar(10) DEFAULT NULL,
  `product_id` bigint(11) NOT NULL,
  `time` varchar(20) NOT NULL
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
-- Индексы таблицы `redirects`
--
ALTER TABLE `redirects`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `referral_links`
--
ALTER TABLE `referral_links`
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
-- Индексы таблицы `visits`
--
ALTER TABLE `visits`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `balance_actions`
--
ALTER TABLE `balance_actions`
  MODIFY `id` bigint(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT для таблицы `bounty`
--
ALTER TABLE `bounty`
  MODIFY `id` bigint(11) NOT NULL AUTO_INCREMENT;
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
  MODIFY `id` bigint(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT для таблицы `payments`
--
ALTER TABLE `payments`
  MODIFY `id` bigint(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT для таблицы `products`
--
ALTER TABLE `products`
  MODIFY `id` bigint(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT для таблицы `redirects`
--
ALTER TABLE `redirects`
  MODIFY `id` bigint(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT для таблицы `referral_links`
--
ALTER TABLE `referral_links`
  MODIFY `id` bigint(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT для таблицы `requests`
--
ALTER TABLE `requests`
  MODIFY `id` bigint(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT для таблицы `sessions`
--
ALTER TABLE `sessions`
  MODIFY `id` bigint(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;
--
-- AUTO_INCREMENT для таблицы `support`
--
ALTER TABLE `support`
  MODIFY `id` bigint(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT для таблицы `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT для таблицы `user_wallets`
--
ALTER TABLE `user_wallets`
  MODIFY `id` bigint(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT для таблицы `visits`
--
ALTER TABLE `visits`
  MODIFY `id` bigint(11) NOT NULL AUTO_INCREMENT;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
