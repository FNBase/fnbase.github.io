-- phpMyAdmin SQL Dump
-- version 4.5.4.1deb2ubuntu2.1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- 생성 시간: 20-09-10 21:06
-- 서버 버전: 10.0.38-MariaDB-0ubuntu0.16.04.1
-- PHP 버전: 7.0.33-30+ubuntu16.04.1+deb.sury.org+1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- 데이터베이스: `c180test`
--

-- --------------------------------------------------------

--
-- 테이블 구조 `_account`
--

CREATE TABLE `_account` (
  `num` int(11) NOT NULL COMMENT '정렬 및 조회를 위한 번호',
  `id` varchar(20) NOT NULL COMMENT '이용자 아이디',
  `name` varchar(20) NOT NULL COMMENT '이용자 닉네임',
  `type` char(10) NOT NULL COMMENT '유형',
  `at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '수행 시간',
  `password` text NOT NULL COMMENT '비밀번호',
  `mail` text NOT NULL,
  `mailAuth` tinyint(1) NOT NULL DEFAULT '0' COMMENT '이메일 인증 여부',
  `lastIp` text NOT NULL COMMENT '마지막으로 사용한 IP 주소',
  `isAdmin` tinyint(1) NOT NULL COMMENT '관리 권한 소지 유무',
  `canUpload` tinyint(1) NOT NULL DEFAULT '0' COMMENT '업로드 권한 여부',
  `siteBan` tinyint(1) NOT NULL DEFAULT '0' COMMENT '사이트 전체 차단 여부',
  `autoLogin` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'ip / UA 기반 자동 로그인 허용 여부',
  `userAgent` text,
  `userIntro` varchar(500) NOT NULL COMMENT '이용자 소개글',
  `point` int(11) NOT NULL COMMENT '활동 정산 포인트'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='이용자 계정 정보';

-- --------------------------------------------------------

--
-- 테이블 구조 `_ad`
--

CREATE TABLE `_ad` (
  `num` int(11) NOT NULL COMMENT '정렬 및 조회를 위한 번호',
  `id` text NOT NULL COMMENT '이용자 아이디',
  `name` text NOT NULL COMMENT '이용자 닉네임',
  `type` char(10) NOT NULL COMMENT '유형',
  `at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '수행 시간',
  `ad` text NOT NULL,
  `link` varchar(250) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='광고 출력';

-- --------------------------------------------------------

--
-- 테이블 구조 `_article`
--

CREATE TABLE `_article` (
  `num` int(11) NOT NULL COMMENT '정렬 및 조회를 위한 번호',
  `type` char(10) NOT NULL COMMENT '유형',
  `at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '수행 시간',
  `title` varchar(1000) NOT NULL COMMENT '글 제목',
  `namespace` varchar(50) DEFAULT NULL,
  `content` longtext NOT NULL,
  `lastEdit` datetime DEFAULT NULL,
  `whoEdited` text,
  `viewCount` bigint(20) NOT NULL DEFAULT '0',
  `ACL` varchar(10) DEFAULT NULL,
  `execute` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='위키 문서';

-- --------------------------------------------------------

--
-- 테이블 구조 `_auth`
--

CREATE TABLE `_auth` (
  `num` bigint(20) NOT NULL,
  `begin` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '시작 일시',
  `type` varchar(10) NOT NULL COMMENT '유형',
  `key` text NOT NULL,
  `value` varchar(20) NOT NULL COMMENT '값',
  `end` datetime DEFAULT NULL COMMENT '종료 일시'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='인증에 사용됩니다.';

-- --------------------------------------------------------

--
-- 테이블 구조 `_board`
--

CREATE TABLE `_board` (
  `num` int(11) NOT NULL COMMENT '정렬 및 조회를 위한 번호',
  `id` text NOT NULL COMMENT '이용자 아이디',
  `name` text NOT NULL COMMENT '이용자 닉네임',
  `type` char(10) NOT NULL COMMENT '유형',
  `at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '수행 시간',
  `slug` varchar(50) NOT NULL COMMENT '게시판 아이디',
  `title` varchar(50) NOT NULL COMMENT '게시판 이름',
  `nickTitle` varchar(5) NOT NULL,
  `boardIntro` varchar(500) NOT NULL COMMENT '게시판 소개글',
  `subs` int(11) NOT NULL DEFAULT '0' COMMENT '구독자 수',
  `related` text COMMENT '연관 게시판',
  `notice` text COMMENT '상단 안내문구입니다.',
  `keeper` text COMMENT '게시판 보조 관리인',
  `kicked` text COMMENT '각 게시판 추방 목록',
  `icon` text,
  `option` varchar(5) DEFAULT NULL,
  `rct` tinyint(1) NOT NULL DEFAULT '1',
  `tagSet` varchar(60) NOT NULL DEFAULT '기본, 잡담'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='게시판';

-- --------------------------------------------------------

--
-- 테이블 구조 `_comment`
--

CREATE TABLE `_comment` (
  `num` int(11) NOT NULL COMMENT '정렬 및 조회를 위한 번호',
  `id` text NOT NULL COMMENT '이용자 아이디',
  `name` text NOT NULL COMMENT '이용자 닉네임',
  `type` char(10) NOT NULL COMMENT '유형',
  `at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '수행 시간',
  `content` varchar(500) NOT NULL,
  `from` int(11) NOT NULL,
  `childOf` int(11) DEFAULT NULL,
  `parentNum` int(11) DEFAULT NULL,
  `mail` text,
  `voteCount_Up` int(11) NOT NULL,
  `voteCount_Down` int(11) NOT NULL,
  `blameCount` int(11) NOT NULL DEFAULT '0' COMMENT '신고 누적 수',
  `isEdited` datetime DEFAULT NULL,
  `whoEdited` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='일반 댓글';

-- --------------------------------------------------------

--
-- 테이블 구조 `_content`
--

CREATE TABLE `_content` (
  `num` int(11) NOT NULL COMMENT '정렬 및 조회를 위한 번호',
  `id` text NOT NULL COMMENT '이용자 아이디',
  `name` text NOT NULL COMMENT '이용자 닉네임',
  `type` char(10) NOT NULL COMMENT '유형',
  `at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '수행 시간',
  `mail` text COMMENT '이메일',
  `title` varchar(100) NOT NULL COMMENT '글 제목',
  `content` mediumtext NOT NULL,
  `board` text NOT NULL,
  `boardName` text NOT NULL COMMENT '출신 게시판의 애칭/약칭',
  `category` text COMMENT '글 종류',
  `rate` varchar(2) NOT NULL DEFAULT 'PG' COMMENT '게시글의 등급입니다. (G/PG/R)',
  `staffOnly` text COMMENT '열람 허가 대상. 쉼표로 구분.',
  `ip` text NOT NULL,
  `isEdited` datetime DEFAULT NULL,
  `whoEdited` text,
  `voteCount_Up` int(11) NOT NULL DEFAULT '0',
  `voteCount_Down` int(11) NOT NULL DEFAULT '0',
  `viewCount` bigint(20) NOT NULL DEFAULT '0',
  `commentCount` int(11) NOT NULL DEFAULT '0',
  `isMarkdown` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'Markdown 적용 여부',
  `isMedia` tinyint(1) DEFAULT NULL COMMENT '1=사진, 2=동영상, 3=유튜브',
  `offNotify` tinyint(1) NOT NULL DEFAULT '0',
  `hideMain` tinyint(1) DEFAULT NULL,
  `actmeter` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='일반 게시글';

-- --------------------------------------------------------

--
-- 테이블 구조 `_discuss`
--

CREATE TABLE `_discuss` (
  `num` int(11) NOT NULL,
  `at` datetime NOT NULL,
  `title` text NOT NULL,
  `discussName` text NOT NULL,
  `id` text NOT NULL,
  `status` varchar(10) NOT NULL,
  `lastEdit` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='위키 토론';

-- --------------------------------------------------------

--
-- 테이블 구조 `_discussThread`
--

CREATE TABLE `_discussThread` (
  `num` bigint(20) NOT NULL,
  `at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `origin` int(11) NOT NULL,
  `id` text NOT NULL,
  `name` text NOT NULL,
  `content` text NOT NULL,
  `status` varchar(10) NOT NULL DEFAULT 'ACTIVE'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- 테이블 구조 `_fnbcon`
--

CREATE TABLE `_fnbcon` (
  `num` int(11) NOT NULL COMMENT '정렬 및 조회를 위한 번호',
  `id` text COMMENT '이용자 아이디',
  `name` text NOT NULL COMMENT '이용자 닉네임',
  `type` char(10) NOT NULL COMMENT '유형',
  `at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '수행 시간',
  `folder` varchar(10) NOT NULL COMMENT '이모티콘 폴더명',
  `title` text NOT NULL COMMENT '이모티콘 이름',
  `content` text NOT NULL COMMENT '이모티콘 설명',
  `ext` varchar(4) NOT NULL DEFAULT 'png' COMMENT '확장자',
  `count` int(11) NOT NULL COMMENT '이모티콘 개수 (1부터)',
  `use` int(11) NOT NULL COMMENT '사용자 수',
  `cost` smallint(5) NOT NULL COMMENT '이모티콘 가격'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='기본 테이블 셋';

-- --------------------------------------------------------

--
-- 테이블 구조 `_history`
--

CREATE TABLE `_history` (
  `num` int(11) NOT NULL,
  `title` text NOT NULL,
  `id` text NOT NULL,
  `name` text NOT NULL,
  `rev` longtext,
  `comment` varchar(100) DEFAULT NULL,
  `at` datetime NOT NULL,
  `modify?` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='위키 편집 기록';

-- --------------------------------------------------------

--
-- 테이블 구조 `_ipban`
--

CREATE TABLE `_ipban` (
  `num` bigint(20) NOT NULL COMMENT '순번',
  `ip` text NOT NULL COMMENT '아이피 주소'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='아이피 기반 비회원 차단';

-- --------------------------------------------------------

--
-- 테이블 구조 `_log`
--

CREATE TABLE `_log` (
  `num` int(11) NOT NULL COMMENT '정렬 및 조회를 위한 번호',
  `id` text NOT NULL COMMENT '이용자 아이디',
  `name` text NOT NULL COMMENT '이용자 닉네임',
  `type` char(10) NOT NULL COMMENT '유형',
  `at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '수행 시간',
  `ip` text NOT NULL,
  `isSuccess` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='로그인 기록';

-- --------------------------------------------------------

--
-- 테이블 구조 `_ment`
--

CREATE TABLE `_ment` (
  `num` int(11) NOT NULL COMMENT '정렬 및 조회를 위한 번호',
  `id` text NOT NULL COMMENT '이용자 아이디',
  `name` text NOT NULL COMMENT '이용자 닉네임',
  `type` char(10) NOT NULL COMMENT '유형',
  `at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '수행 시간',
  `value` text,
  `target` text,
  `cmt_id` text NOT NULL,
  `reason` text,
  `ip` text,
  `isSuccess` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='알림 / 호출';

-- --------------------------------------------------------

--
-- 테이블 구조 `_othFunc`
--

CREATE TABLE `_othFunc` (
  `num` int(11) NOT NULL COMMENT '정렬 및 조회를 위한 번호',
  `id` text NOT NULL COMMENT '이용자 아이디',
  `name` text NOT NULL COMMENT '이용자 닉네임',
  `type` char(10) NOT NULL COMMENT '유형',
  `at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '수행 시간',
  `value` text,
  `target` text,
  `reason` text,
  `ip` text,
  `isSuccess` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='기타 중요도 낮은 기능';

-- --------------------------------------------------------

--
-- 테이블 구조 `_setting`
--

CREATE TABLE `_setting` (
  `num` int(11) NOT NULL COMMENT '정렬 및 조회를 위한 번호',
  `type` char(10) NOT NULL COMMENT '유형',
  `at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '수행 시간',
  `siteTitle` text NOT NULL COMMENT '사이트 제목',
  `siteDesc` text NOT NULL COMMENT '사이트 설명',
  `siteFab` text NOT NULL COMMENT '사이트 로고(파비콘)',
  `sitePath` text NOT NULL COMMENT '사이트 경로',
  `siteLang` varchar(25) NOT NULL DEFAULT 'ko-KR' COMMENT '언어 설정',
  `siteEmMail` varchar(255) NOT NULL COMMENT '비상 이메일',
  `pageHead` mediumtext NOT NULL COMMENT '<head> 태그 속에 삽입될 코드',
  `pageLeft` text COMMENT '페이지 좌측에 표시될 내용',
  `pageColor` varchar(25) NOT NULL DEFAULT '#5998d6' COMMENT '탭 색상 (theme-color)',
  `pageSubColor` text NOT NULL COMMENT '보조 색상',
  `pageBgColor` text NOT NULL COMMENT '배경 색상',
  `pageFooter` mediumtext NOT NULL COMMENT '페이지 하단 글',
  `siteTimezone` varchar(25) NOT NULL DEFAULT 'Asia/Seoul' COMMENT '기본 시간대',
  `recentHide` text COMMENT '종합 글 목록 미노출 게시판'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='사이트 전체설정';

-- --------------------------------------------------------

--
-- 테이블 구조 `_skinSet`
--

CREATE TABLE `_skinSet` (
  `num` int(11) NOT NULL COMMENT '정렬 및 조회를 위한 번호',
  `author` text NOT NULL COMMENT '제작자 표시',
  `name` text NOT NULL COMMENT '스킨 이름',
  `type` char(10) NOT NULL COMMENT '스킨 유형',
  `version` varchar(25) NOT NULL COMMENT '스킨 버전',
  `Desc` text NOT NULL COMMENT '스킨 설명',
  `DefaultColor` text NOT NULL COMMENT '기본 색상',
  `Subcolor` text NOT NULL COMMENT '보조 색상'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='스킨 개별 설정';

-- --------------------------------------------------------

--
-- 테이블 구조 `_upload`
--

CREATE TABLE `_upload` (
  `filename` text NOT NULL,
  `at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `ip` text NOT NULL,
  `num` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='업로드 기록';

-- --------------------------------------------------------

--
-- 테이블 구조 `_userSet`
--

CREATE TABLE `_userSet` (
  `num` int(11) NOT NULL COMMENT '정렬 및 조회를 위한 번호',
  `id` text NOT NULL COMMENT '이용자 아이디',
  `name` text NOT NULL COMMENT '이용자 닉네임',
  `type` char(10) NOT NULL COMMENT '유형',
  `at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '수행 시간',
  `fnbcon` varchar(500) NOT NULL DEFAULT 'default,test',
  `homepage` text COMMENT '홈페이지',
  `editor` varchar(1) DEFAULT NULL,
  `subs` text,
  `display_none` text,
  `hideAdv` tinyint(1) NOT NULL DEFAULT '0',
  `listNum` varchar(2) DEFAULT NULL,
  `tempSave` text COMMENT '임시 저장',
  `wikiColor` varchar(13) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='이용자 개인 설정';

--
-- 덤프된 테이블의 인덱스
--

--
-- 테이블의 인덱스 `_account`
--
ALTER TABLE `_account`
  ADD PRIMARY KEY (`num`),
  ADD UNIQUE KEY `id` (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- 테이블의 인덱스 `_ad`
--
ALTER TABLE `_ad`
  ADD PRIMARY KEY (`num`);

--
-- 테이블의 인덱스 `_article`
--
ALTER TABLE `_article`
  ADD PRIMARY KEY (`num`);

--
-- 테이블의 인덱스 `_auth`
--
ALTER TABLE `_auth`
  ADD PRIMARY KEY (`num`);

--
-- 테이블의 인덱스 `_board`
--
ALTER TABLE `_board`
  ADD PRIMARY KEY (`num`),
  ADD UNIQUE KEY `title` (`title`),
  ADD UNIQUE KEY `slug` (`slug`);

--
-- 테이블의 인덱스 `_comment`
--
ALTER TABLE `_comment`
  ADD PRIMARY KEY (`num`);

--
-- 테이블의 인덱스 `_content`
--
ALTER TABLE `_content`
  ADD PRIMARY KEY (`num`);

--
-- 테이블의 인덱스 `_discuss`
--
ALTER TABLE `_discuss`
  ADD PRIMARY KEY (`num`);

--
-- 테이블의 인덱스 `_discussThread`
--
ALTER TABLE `_discussThread`
  ADD PRIMARY KEY (`num`);

--
-- 테이블의 인덱스 `_fnbcon`
--
ALTER TABLE `_fnbcon`
  ADD PRIMARY KEY (`num`);

--
-- 테이블의 인덱스 `_history`
--
ALTER TABLE `_history`
  ADD PRIMARY KEY (`num`);

--
-- 테이블의 인덱스 `_ipban`
--
ALTER TABLE `_ipban`
  ADD PRIMARY KEY (`num`);

--
-- 테이블의 인덱스 `_log`
--
ALTER TABLE `_log`
  ADD PRIMARY KEY (`num`);

--
-- 테이블의 인덱스 `_ment`
--
ALTER TABLE `_ment`
  ADD PRIMARY KEY (`num`);

--
-- 테이블의 인덱스 `_othFunc`
--
ALTER TABLE `_othFunc`
  ADD PRIMARY KEY (`num`);

--
-- 테이블의 인덱스 `_setting`
--
ALTER TABLE `_setting`
  ADD PRIMARY KEY (`num`);

--
-- 테이블의 인덱스 `_skinSet`
--
ALTER TABLE `_skinSet`
  ADD PRIMARY KEY (`num`);

--
-- 테이블의 인덱스 `_upload`
--
ALTER TABLE `_upload`
  ADD PRIMARY KEY (`num`);

--
-- 테이블의 인덱스 `_userSet`
--
ALTER TABLE `_userSet`
  ADD PRIMARY KEY (`num`);

--
-- 덤프된 테이블의 AUTO_INCREMENT
--

--
-- 테이블의 AUTO_INCREMENT `_account`
--
ALTER TABLE `_account`
  MODIFY `num` int(11) NOT NULL AUTO_INCREMENT COMMENT '정렬 및 조회를 위한 번호', AUTO_INCREMENT=301;
--
-- 테이블의 AUTO_INCREMENT `_ad`
--
ALTER TABLE `_ad`
  MODIFY `num` int(11) NOT NULL AUTO_INCREMENT COMMENT '정렬 및 조회를 위한 번호', AUTO_INCREMENT=329;
--
-- 테이블의 AUTO_INCREMENT `_article`
--
ALTER TABLE `_article`
  MODIFY `num` int(11) NOT NULL AUTO_INCREMENT COMMENT '정렬 및 조회를 위한 번호', AUTO_INCREMENT=1936;
--
-- 테이블의 AUTO_INCREMENT `_auth`
--
ALTER TABLE `_auth`
  MODIFY `num` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=672;
--
-- 테이블의 AUTO_INCREMENT `_board`
--
ALTER TABLE `_board`
  MODIFY `num` int(11) NOT NULL AUTO_INCREMENT COMMENT '정렬 및 조회를 위한 번호', AUTO_INCREMENT=151;
--
-- 테이블의 AUTO_INCREMENT `_comment`
--
ALTER TABLE `_comment`
  MODIFY `num` int(11) NOT NULL AUTO_INCREMENT COMMENT '정렬 및 조회를 위한 번호', AUTO_INCREMENT=154398;
--
-- 테이블의 AUTO_INCREMENT `_content`
--
ALTER TABLE `_content`
  MODIFY `num` int(11) NOT NULL AUTO_INCREMENT COMMENT '정렬 및 조회를 위한 번호', AUTO_INCREMENT=47452;
--
-- 테이블의 AUTO_INCREMENT `_discuss`
--
ALTER TABLE `_discuss`
  MODIFY `num` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=144;
--
-- 테이블의 AUTO_INCREMENT `_discussThread`
--
ALTER TABLE `_discussThread`
  MODIFY `num` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=652;
--
-- 테이블의 AUTO_INCREMENT `_fnbcon`
--
ALTER TABLE `_fnbcon`
  MODIFY `num` int(11) NOT NULL AUTO_INCREMENT COMMENT '정렬 및 조회를 위한 번호', AUTO_INCREMENT=42;
--
-- 테이블의 AUTO_INCREMENT `_history`
--
ALTER TABLE `_history`
  MODIFY `num` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9533;
--
-- 테이블의 AUTO_INCREMENT `_ipban`
--
ALTER TABLE `_ipban`
  MODIFY `num` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '순번', AUTO_INCREMENT=264;
--
-- 테이블의 AUTO_INCREMENT `_log`
--
ALTER TABLE `_log`
  MODIFY `num` int(11) NOT NULL AUTO_INCREMENT COMMENT '정렬 및 조회를 위한 번호', AUTO_INCREMENT=28837;
--
-- 테이블의 AUTO_INCREMENT `_ment`
--
ALTER TABLE `_ment`
  MODIFY `num` int(11) NOT NULL AUTO_INCREMENT COMMENT '정렬 및 조회를 위한 번호', AUTO_INCREMENT=161680;
--
-- 테이블의 AUTO_INCREMENT `_othFunc`
--
ALTER TABLE `_othFunc`
  MODIFY `num` int(11) NOT NULL AUTO_INCREMENT COMMENT '정렬 및 조회를 위한 번호', AUTO_INCREMENT=48757;
--
-- 테이블의 AUTO_INCREMENT `_setting`
--
ALTER TABLE `_setting`
  MODIFY `num` int(11) NOT NULL AUTO_INCREMENT COMMENT '정렬 및 조회를 위한 번호', AUTO_INCREMENT=3;
--
-- 테이블의 AUTO_INCREMENT `_skinSet`
--
ALTER TABLE `_skinSet`
  MODIFY `num` int(11) NOT NULL AUTO_INCREMENT COMMENT '정렬 및 조회를 위한 번호', AUTO_INCREMENT=2;
--
-- 테이블의 AUTO_INCREMENT `_upload`
--
ALTER TABLE `_upload`
  MODIFY `num` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2671;
--
-- 테이블의 AUTO_INCREMENT `_userSet`
--
ALTER TABLE `_userSet`
  MODIFY `num` int(11) NOT NULL AUTO_INCREMENT COMMENT '정렬 및 조회를 위한 번호', AUTO_INCREMENT=289;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
