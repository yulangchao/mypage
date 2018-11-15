-- phpMyAdmin SQL Dump
-- version 4.5.4.1deb2ubuntu2.1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Nov 15, 2018 at 09:29 PM
-- Server version: 5.7.24-0ubuntu0.16.04.1
-- PHP Version: 7.0.32-0ubuntu0.16.04.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `myblog`
--

-- --------------------------------------------------------

--
-- Table structure for table `blogs`
--

CREATE TABLE `blogs` (
  `id` int(10) UNSIGNED NOT NULL,
  `title` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `body` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `blogs`
--

INSERT INTO `blogs` (`id`, `title`, `body`, `created`, `modified`) VALUES
(1, 'Use Nginx to make a hls server on Ubuntu', '<div id="out" class="markdown-body"><h3>Use Nginx to make a hls server on Ubuntu</h3>\r\n<h4>1. nginx + nginx-rtmp-module</h4>\r\n<pre><code>       sudo apt-get install build-essential libpcre3 libpcre3-dev libssl-dev\r\n       mkdir ~/temp &amp;&amp; cd ~/temp\r\n       wget http://nginx.org/download/nginx-1.12.0.tar.gz\r\n       git clone git://github.com/arut/nginx-rtmp-module.git\r\n       tar xzf nginx-1.12.0.tar.gz\r\n       cd nginx-1.12.0\r\n       sudo ./configure --with-http_ssl_module --add-module=../nginx-rtmp-module\r\n       sudo make\r\n       sudo make install\r\n       sudo /usr/local/nginx/sbin/nginx\r\n</code></pre>\r\n<p>Now you installed the nginx. It can be test at http://localhost:80</p>\r\n<h4>2. Modify the config of nginx</h4>\r\n<pre><code>        vim /usr/local/nginx/conf/nginx.conf\r\n</code></pre>\r\n<h6>Copy the content below to the nginx.conf</h6>\r\n<pre><code>        #user  nobody;\r\n        worker_processes  1;\r\n        #error_log  logs/error.log;\r\n        #error_log  logs/error.log  notice;\r\n        #error_log  logs/error.log  info;\r\n        #pid        logs/nginx.pid;\r\n        events {\r\n            worker_connections  1024;\r\n        }\r\n        http {\r\n            include       mime.types;\r\n            default_type  application/octet-stream;\r\n            #log_format  main  \'$remote_addr - $remote_user [$time_local] "$request" \'\r\n            #                  \'$status $body_bytes_sent "$http_referer" \'\r\n            #                  \'"$http_user_agent" "$http_x_forwarded_for"\';\r\n            #access_log  logs/access.log  main;\r\n            sendfile        on;\r\n            #tcp_nopush     on;\r\n            #keepalive_timeout  0;\r\n            keepalive_timeout  65;\r\n            #gzip  on;\r\n            server {\r\n                listen  8080;   \r\n                  location /{   \r\n                      proxy_pass http://127.0.0.1:8081/;  \r\n                      proxy_redirect default;\r\n                  }\r\n                location /stat {\r\n                    rtmp_stat all;\r\n                    rtmp_stat_stylesheet stat.xsl;\r\n                }\r\n                location /stat.xsl {\r\n                    root /usr/local/src/nginx-rtmp-module/;\r\n                }\r\n                location /control {\r\n                    rtmp_control all;\r\n                }\r\n                location /hls {\r\n                    # Serve HLS fragments\r\n                    types {\r\n                        application/vnd.apple.mpegurl m3u8;\r\n                        video/mp2t ts;\r\n                    }\r\n                    root /usr/local/var/www;\r\n                    add_header Cache_Control no-cache;\r\n                    expires -1;\r\n                }\r\n            }\r\n        }\r\n        rtmp {\r\n            server {\r\n                listen 1935; \r\n                chunk_size 4000;\r\n                  application rtmp{    # the path for rtmp protocol\r\n                  live on;\r\n                  max_connections 1024;\r\n                  }\r\n                application hls {  # the path for HLS protocol\r\n                   live on;\r\n                     hls on;\r\n                     hls_path /usr/local/var/www/hls;\r\n                     hls_fragment 5s;\r\n                   record off;\r\n                }\r\n            }\r\n        }\r\n</code></pre>\r\n<p>...</p>\r\n<pre><code>      sudo mkdir /usr/local/var\r\n      sudo mkdir /usr/local/var/www\r\n      sudo mkdir /usr/local/var/www/hls\r\n      sudo /usr/local/nginx/sbin/nginx -s stop\r\n      sudo /usr/local/nginx/sbin/nginx\r\n</code></pre>\r\n<p>...</p>\r\n<h4>3. Using obs to push stream</h4>\r\n<h6>Push server: rtmp://localhost:1935/hls</h6>\r\n<h6>Push stream: stream</h6>\r\n<h6>Start Obs</h6>\r\n<h6>Test source of the stream:</h6>\r\n<pre><code>      1.RTMP：rtmp://localhost:1935/hls/stream\r\n\r\n      2.HLS：http://localhost:8080/hls/stream.m3u8</code></pre>\r\n</div>', '2018-01-15 06:48:13', '2018-01-15 21:23:25');

-- --------------------------------------------------------

--
-- Table structure for table `brw_files`
--

CREATE TABLE `brw_files` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `record_id` int(10) UNSIGNED NOT NULL,
  `model` varchar(255) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `category_code` varchar(255) NOT NULL,
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `brw_images`
--

CREATE TABLE `brw_images` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `record_id` int(10) UNSIGNED NOT NULL,
  `model` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `category_code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `brw_images`
--

INSERT INTO `brw_images` (`id`, `name`, `record_id`, `model`, `description`, `category_code`, `created`, `modified`) VALUES
(1, 'warehouse.png', 1, 'Website', '', 'main', '2018-01-12 05:20:37', '2018-01-12 05:20:37'),
(2, 'vue.png', 2, 'Website', '', 'main', '2018-01-12 05:22:09', '2018-01-12 05:22:09'),
(3, 'course.png', 3, 'Website', '', 'main', '2018-01-12 05:22:56', '2018-01-12 05:22:56'),
(4, 'taxi.png', 4, 'Website', '', 'main', '2018-01-12 05:23:46', '2018-01-12 05:23:46'),
(5, 'canadaso.png', 5, 'Website', '', 'main', '2018-01-12 05:26:09', '2018-01-12 05:26:09'),
(6, 'warehouse.png', 7, 'Website', '', 'main', '2018-01-12 05:30:35', '2018-01-12 05:30:35'),
(7, 'vue.png', 8, 'Website', '', 'main', '2018-01-12 05:30:44', '2018-01-12 05:30:44'),
(8, '360截图166809118210099.png', 1, 'Blog', NULL, 'main', '2018-01-15 21:32:59', '2018-01-15 21:32:59'),
(9, '360截图166809118210099.png', 1, 'Blog', NULL, 'main', '2018-01-15 21:33:37', '2018-01-15 21:33:37'),
(10, '20180219144316.png', 9, 'Website', '', 'main', '2018-02-19 22:43:42', '2018-02-19 22:43:42'),
(11, '20180220154715.png', 10, 'Website', '', 'main', '2018-02-20 23:48:39', '2018-02-20 23:48:39'),
(12, '20180317220410.png', 11, 'Website', '', 'main', '2018-03-18 05:04:19', '2018-03-18 05:04:19'),
(13, '20180317220500.png', 12, 'Website', '', 'main', '2018-03-18 05:05:08', '2018-03-18 05:05:08'),
(14, '20180317220558.png', 13, 'Website', '', 'main', '2018-03-18 05:06:05', '2018-03-18 05:06:05'),
(15, '20180804220632.png', 14, 'Website', '', 'main', '2018-08-05 05:06:41', '2018-08-05 05:06:41'),
(16, '20180804220830.png', 15, 'Website', '', 'main', '2018-08-05 05:08:37', '2018-08-05 05:08:37'),
(17, '20180804221015.png', 16, 'Website', '', 'main', '2018-08-05 05:10:30', '2018-08-05 05:10:30'),
(18, '20181004141412.png', 17, 'Website', '', 'main', '2018-10-04 21:14:26', '2018-10-04 21:14:26');

-- --------------------------------------------------------

--
-- Table structure for table `brw_users`
--

CREATE TABLE `brw_users` (
  `id` int(10) UNSIGNED NOT NULL,
  `email` varchar(250) NOT NULL,
  `password` varchar(255) NOT NULL,
  `last_login` datetime DEFAULT NULL,
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `brw_users`
--

INSERT INTO `brw_users` (`id`, `email`, `password`, `last_login`, `created`, `modified`) VALUES
(2, 'test@gmail.com', 'cb9dd60a394cddb9abf1a0dc0d973ca7cd015edf', '2018-10-04 21:12:59', '2017-12-19 22:41:55', '2017-12-19 22:41:55');

-- --------------------------------------------------------

--
-- Table structure for table `histories`
--

CREATE TABLE `histories` (
  `id` int(10) UNSIGNED NOT NULL,
  `address` varchar(100) DEFAULT NULL,
  `body` text,
  `price` int(11) DEFAULT NULL,
  `link` varchar(100) DEFAULT NULL,
  `city` varchar(100) NOT NULL,
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `websites`
--

CREATE TABLE `websites` (
  `id` int(10) UNSIGNED NOT NULL,
  `title` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `link` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `views` int(11) DEFAULT '0',
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `websites`
--

INSERT INTO `websites` (`id`, `title`, `content`, `link`, `views`, `created`, `modified`) VALUES
(3, 'Online Medical Course', 'Cakephp, Php, Jquery, JS', 'http://learnintegrative.com/', 14, '2018-01-12 05:22:56', '2018-01-12 05:22:56'),
(4, 'Taxi Application', 'Cakephp, Jquery', 'https://jike.ca', 17, '2018-01-12 05:23:46', '2018-01-12 05:23:46'),
(5, 'Canada So', 'Cakephp, Jquery', 'http://canadaso.ca/', 8, '2018-01-12 05:26:09', '2018-01-12 05:26:09'),
(7, 'WareHouse System', 'Angular4, Nodejs, MongoDB, Socket.io', 'http://storage.beimei.fun', 20, '2018-01-12 05:20:37', '2018-01-12 05:26:21'),
(8, 'NA Infomation Platform', 'Vue2, Nodejs, Mongodb', 'http://na.beimei.fun', 30, '2018-01-12 05:22:09', '2018-01-12 05:22:09'),
(9, 'HIC区块链', 'HIC区块链', 'http://hic.center/', NULL, '2018-02-19 22:43:42', '2018-02-19 22:43:42'),
(10, 'Virtual Coins Info', 'Virtual Coins Info Platform 虚拟货币信息平台Demo', 'http://beimei.fun:8765/coins?type=BTC-USD', NULL, '2018-02-20 23:48:39', '2018-02-20 23:48:59'),
(11, 'Laravel Online Store', 'Laravel5 Online Store (Demo)', 'http://beimei.fun:8000/', NULL, '2018-03-18 05:04:19', '2018-03-18 05:04:19'),
(12, 'Online Book Store', 'Online Book Store (Demo)', 'http://beimei.fun:8001/', NULL, '2018-03-18 05:05:08', '2018-03-18 05:05:08'),
(13, 'NA Online', '北美在线门户网站（进行中）', 'http://beimei.online/', NULL, '2018-03-18 05:06:05', '2018-03-18 05:06:05'),
(14, 'Cleaner App', 'Mobile Cleaner App in Vancouver', 'http://www.wiicleaner.com', NULL, '2018-08-05 05:06:41', '2018-08-05 05:07:16'),
(15, 'Cleaner Side App', 'Cleaner Side Mobile App', 'http://cleaner.wiicleaner.com', NULL, '2018-08-05 05:08:37', '2018-08-05 05:08:37'),
(16, 'WareHouse with Vue', 'Vue, Firebase, Google cloud and some css staff', 'https://daigou-fc599.firebaseapp.com', NULL, '2018-08-05 05:10:30', '2018-08-05 05:10:30'),
(17, '抽奖 团购系统', '抽奖系统 团购ing', 'https://gift.beimei.fun/#/home', 24, '2018-10-04 21:14:26', '2018-10-04 21:14:26');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `blogs`
--
ALTER TABLE `blogs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `brw_files`
--
ALTER TABLE `brw_files`
  ADD PRIMARY KEY (`id`),
  ADD KEY `category_code` (`category_code`);

--
-- Indexes for table `brw_images`
--
ALTER TABLE `brw_images`
  ADD PRIMARY KEY (`id`),
  ADD KEY `category_code` (`category_code`(191));

--
-- Indexes for table `brw_users`
--
ALTER TABLE `brw_users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`email`);

--
-- Indexes for table `histories`
--
ALTER TABLE `histories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `websites`
--
ALTER TABLE `websites`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `blogs`
--
ALTER TABLE `blogs`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `brw_files`
--
ALTER TABLE `brw_files`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `brw_images`
--
ALTER TABLE `brw_images`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;
--
-- AUTO_INCREMENT for table `brw_users`
--
ALTER TABLE `brw_users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `histories`
--
ALTER TABLE `histories`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `websites`
--
ALTER TABLE `websites`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
