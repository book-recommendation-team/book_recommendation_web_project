-- MySQL dump 10.13  Distrib 8.0.42, for Win64 (x86_64)
--
-- Host: localhost    Database: book_recommendation_db
-- ------------------------------------------------------
-- Server version	8.0.42

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `bookhashtags`
--

DROP TABLE IF EXISTS `bookhashtags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bookhashtags` (
  `book_hashtag_id` int NOT NULL AUTO_INCREMENT,
  `book_id` int NOT NULL,
  `tag_id` int NOT NULL,
  PRIMARY KEY (`book_hashtag_id`),
  UNIQUE KEY `book_id` (`book_id`,`tag_id`),
  KEY `tag_id` (`tag_id`),
  CONSTRAINT `bookhashtags_ibfk_1` FOREIGN KEY (`book_id`) REFERENCES `books` (`book_id`) ON DELETE CASCADE,
  CONSTRAINT `bookhashtags_ibfk_2` FOREIGN KEY (`tag_id`) REFERENCES `hashtags` (`tag_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bookhashtags`
--

LOCK TABLES `bookhashtags` WRITE;
/*!40000 ALTER TABLE `bookhashtags` DISABLE KEYS */;
/*!40000 ALTER TABLE `bookhashtags` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `books`
--

DROP TABLE IF EXISTS `books`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `books` (
  `book_id` int NOT NULL AUTO_INCREMENT,
  `isbn` varchar(20) DEFAULT NULL,
  `title` varchar(255) NOT NULL,
  `author` varchar(255) DEFAULT NULL,
  `publisher` varchar(100) DEFAULT NULL,
  `pub_date` date DEFAULT NULL,
  `description` text,
  `cover_image_url` varchar(500) DEFAULT NULL,
  `link` varchar(500) DEFAULT NULL,
  `category` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`book_id`),
  UNIQUE KEY `isbn` (`isbn`)
) ENGINE=InnoDB AUTO_INCREMENT=221 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `books`
--

LOCK TABLES `books` WRITE;
/*!40000 ALTER TABLE `books` DISABLE KEYS */;
INSERT INTO `books` VALUES (1,'978-89-9999-001-0','더미북1 제목','더미저자1','더미출판사1','2023-01-01','간단한 설명1','http://example.com/cover1.jpg','http://example.com/link1',NULL),(2,'978-89-9999-002-0','더미북2 제목','더미저자2','더미출판사2','2023-02-01','간단한 설명2','http://example.com/cover2.jpg','http://example.com/link2',NULL),(3,NULL,'나의 문화유산답사기 9: 서울편 1','유홍준',NULL,NULL,'25년 간 이어온 대표 인문 시리즈, 서울 편.','img/n1.jpg','https://search.shopping.naver.com/book/catalog/32445567453',NULL),(4,NULL,'다른 방식으로 보기','존 버거',NULL,NULL,'미술 감상법에 대한 새로운 시각.','img/d.jpg','https://search.shopping.naver.com/book/catalog/32490815625',NULL),(5,NULL,'나의 문화유산답사기','유홍준',NULL,NULL,'한국 문화유산 대중서의 스테디셀러.','img/d1.jpg','https://search.shopping.naver.com/book/catalog/32445567453',NULL),(6,NULL,'사진에 관하여','수전 손택',NULL,NULL,'사진과 현실의 관계를 성찰.','img/d2.jpg','https://search.shopping.naver.com/book/catalog/32441018601',NULL),(7,NULL,'미학 오디세이','진중권',NULL,NULL,'대중을 위한 철학적 미학 입문.','img/d3.jpg','https://search.shopping.naver.com/book/catalog/32466555822',NULL),(8,NULL,'죽기 전에 꼭 봐야 할 세계 건축','피터 클락슨',NULL,NULL,'세계 주요 건축물 100선.','img/d4.jpg','https://search.shopping.naver.com/book/catalog/32436153694',NULL),(9,NULL,'한국의 미 특강','오주석',NULL,NULL,'한국 미술의 아름다움 해설.','img/d5.jpg','https://search.shopping.naver.com/book/catalog/32436144306',NULL),(10,NULL,'컬러 앤 라이트','제임스 거니',NULL,NULL,'사실적 표현을 위한 빛과 색 이론.','img/mm1.jpg','https://search.shopping.naver.com/book/catalog/51676555623',NULL),(11,NULL,'음악의 역사','클로드 팔리스카',NULL,NULL,'서양 음악사의 흐름.','img/d7.jpg','https://search.shopping.naver.com/book/catalog/55485250979',NULL),(12,NULL,'영화의 이해','루이스 자네티',NULL,NULL,'영화 이론 입문서의 고전.','img/d8.jpg','https://search.shopping.naver.com/book/catalog/32442163261',NULL),(13,NULL,'길 위의 인문학','김정남',NULL,NULL,'여행과 인문학의 만남.','img/d9.jpg','https://search.shopping.naver.com/book/catalog/33189944618',NULL),(14,NULL,'아리스토텔레스의 시학','아리스토텔레스',NULL,NULL,'비극 이론의 고전.','img/d10.jpg','https://search.shopping.naver.com/book/catalog/32436012778',NULL),(15,NULL,'미술관에 간 과학자','이정모',NULL,NULL,'과학적 시선으로 본 미술 이야기.','img/d11.jpg','https://search.shopping.naver.com/book/catalog/32438202741',NULL),(16,NULL,'에디토리얼 씽킹','최혜진',NULL,NULL,'편집 디자인의 창의적 사고 과정.','img/d12.jpg','https://search.shopping.naver.com/book/catalog/44417064619',NULL),(17,NULL,'현대 물리학과 동양사상','프리초프 카프라',NULL,NULL,'동서 사상의 융합.','img/d13.jpg','https://search.shopping.naver.com/book/catalog/32473020311',NULL),(18,NULL,'문학이란 무엇인가','장 폴 사르트르',NULL,NULL,'문학의 존재론적 의미 탐구.','img/d14.jpg','https://search.shopping.naver.com/book/catalog/32486736931',NULL),(19,NULL,'클래식 왜 안 좋아하세요?','권태영',NULL,NULL,'입문자를 위한 클래식 20인 안내서.','img/dp30.jpg','https://search.shopping.naver.com/book/catalog/54417375837',NULL),(20,NULL,'모 이야기','최연주',NULL,NULL,'일상을 포근히 그린 에세이.','img/d16.jpg','https://search.shopping.naver.com/book/catalog/37524796620',NULL),(21,NULL,'나는 고양이로소이다','나쓰메 소세키',NULL,NULL,'고양이 시선으로 본 인간 사회 풍자.','img/d17.jpg','https://search.shopping.naver.com/book/catalog/53632315796',NULL),(22,NULL,'방구석 미술관','조원재',NULL,NULL,'집에서 즐기는 흥미로운 미술 이야기.','img/d18.jpg','https://search.shopping.naver.com/book/catalog/32436144217',NULL),(23,NULL,'자연스러운 인체 드로잉','드로잉 전문가',NULL,NULL,'인체를 자연스럽게 그리는 방법.','img/d19.jpg','https://search.shopping.naver.com/book/catalog/33895602632',NULL),(24,NULL,'단 한 번의 삶','김영하',NULL,NULL,'삶과 존재를 깊이 성찰하는 산문.','img/esa1.jpg','https://search.shopping.naver.com/book/catalog/53735013051',NULL),(25,NULL,'무소유','법정',NULL,NULL,'소유하지 않는 삶의 가치.','img/dp.jpg','https://search.shopping.naver.com/book/catalog/42325184618',NULL),(26,NULL,'인연','피천득',NULL,NULL,'소중한 사람과 순간을 그린 서정 에세이.','img/dp1.jpg','https://search.shopping.naver.com/book/catalog/32482042408',NULL),(27,NULL,'개인주의자 선언','문유석',NULL,NULL,'개인의 자유와 사회적 연대를 함께 모색.','img/dp2.jpg','https://search.shopping.naver.com/book/catalog/32441659387',NULL),(28,NULL,'나는 나로 살기로 했다','김수현',NULL,NULL,'자존감을 위한 현실적 조언.','img/dp3.jpg','https://search.shopping.naver.com/book/catalog/32465494978',NULL),(29,NULL,'죽음의 수용소에서','빅터 프랭클',NULL,NULL,'의미를 찾는 인간의 의지.','img/dp4.jpg','https://search.shopping.naver.com/book/catalog/32485602637',NULL),(30,NULL,'어떻게 살 것인가','유시민',NULL,NULL,'더 나은 삶을 위한 대화.','img/dp5.jpg','https://search.shopping.naver.com/book/catalog/32465515855',NULL),(31,NULL,'혼자가 혼자에게','이병률',NULL,NULL,'고독 속에서 찾은 위로.','img/dp6.jpg','https://search.shopping.naver.com/book/catalog/32490282198',NULL),(32,NULL,'여행의 이유','김영하',NULL,NULL,'여행을 읽는 또 하나의 관점.','img/dp7.jpg','https://search.shopping.naver.com/book/catalog/46931760625',NULL),(33,NULL,'낭만적 연애와 그 후의 일상','알랭 드 보통',NULL,NULL,'사랑과 관계에 대한 철학적 통찰.','img/dp8.jpg','https://search.shopping.naver.com/book/catalog/32436139331',NULL),(34,NULL,'아픔이 길이 되려면','김승섭',NULL,NULL,'아픔을 통해 바라본 사회의 구조.','img/dp9.jpg','https://search.shopping.naver.com/book/catalog/32475523886',NULL),(35,NULL,'언어의 온도','이기주',NULL,NULL,'말과 글의 따뜻함을 이야기.','img/dp10.jpg','https://search.shopping.naver.com/book/catalog/32445599640',NULL),(36,NULL,'내 옆에 있는 사람','이병률',NULL,NULL,'관계 속 따뜻한 시선.','img/dp11.jpg','https://search.shopping.naver.com/book/catalog/32466975969',NULL),(37,NULL,'게으를 권리','폴 라파르그',NULL,NULL,'노동 중심 사회에 대한 비판.','img/dp12.jpg','https://search.shopping.naver.com/book/catalog/32466637728',NULL),(38,NULL,'월든','헨리 데이비드 소로',NULL,NULL,'자연 속에서의 자급자족 실험.','img/dp13.jpg','https://search.shopping.naver.com/book/catalog/32445721746',NULL),(39,NULL,'우리는 언젠가 만난다','채사장',NULL,NULL,'삶과 관계의 철학적 성찰.','img/dp14.jpg','https://search.shopping.naver.com/book/catalog/32466539178',NULL),(40,NULL,'슬픔을 공부하는 슬픔','신형철',NULL,NULL,'섬세한 문학‧사회 비평.','img/dp15.jpg','https://search.shopping.naver.com/book/catalog/32454453350',NULL),(41,NULL,'하늘 호수로 떠난 여행','류시화',NULL,NULL,'인도 여행기를 통한 영적 성찰.','img/dp16.jpg','https://search.shopping.naver.com/book/catalog/32487161391',NULL),(42,NULL,'개인주의자 선언','문유석',NULL,NULL,'사회와 개인의 균형을 재차 환기.','img/dp17.jpg','https://search.shopping.naver.com/book/catalog/32441659387',NULL),(43,NULL,'사랑의 기술','에리히 프롬',NULL,NULL,'사랑을 기술로 분석한 명저.','img/dp18.jpg','https://search.shopping.naver.com/book/catalog/32457424202',NULL),(44,NULL,'태도에 관하여','임경선',NULL,NULL,'삶을 대하는 태도를 모색.','img/dp19.jpg','https://search.shopping.naver.com/book/catalog/50466246618',NULL),(45,NULL,'백년허리2','정선근',NULL,NULL,'서울대 의대 재활의학과 정선근 교수의 스테디셀러인 백년허리1 진단편에 이어서 실제적인 치료 방법을 제시하고 있는 백년허리2 치료편이다. 치료편에서 저자는 허리 통증에서 벗어날 수 있는 방법을 정확히, 구체적으로, 누구나 따라할 수 있도록 설명하고 있다. 일상생활, 운동, 작업 등 허리 아픈 사람이 겪게 되는 모든 상황에서 허리를 어떻게 사용하는 것이 옳은지를 알려주는 말그대로 국민 허리 사용설명서이다.','img/r1.jpg','https://search.shopping.naver.com/book/catalog/32461159846','건강/스포츠'),(46,NULL,'백년허리2','정선근',NULL,NULL,'평생 건강한 허리를 위한 실용적인 운동법과 관리법','img/r1.jpg','https://search.shopping.naver.com/book/catalog/32443415783?query=%EB%B0%B1%EB%85%84%ED%97%88%EB%A6%AC&NaPm=ct%3Dmcvc6auw%7Cci%3De30dcf713a00549969d85d81c1264d9e6665a3a0%7Ctr%3Dboksl%7Csn%3D95694%7Chk%3Da2bd6f54efb8470d392c712323c0d2e54d878e7a','건강/스포츠'),(47,NULL,'백년허리 1','정선근',NULL,NULL,'허리 건강의 기초를 다지는 필수 가이드북','img/r2.jpg','https://search.shopping.naver.com/book/catalog/32464881699?query=%EB%B0%B1%EB%85%84%ED%97%88%EB%A6%AC&NaPm=ct%3Dmcvc6kw0%7Cci%3Dbc7e43c3af21bc6f5043a294b7b095dd779799a6%7Ctr%3Dboksl%7Csn%3D95694%7Chk%3Df6d2845b0c1bba20a4a14d8bb51fdebb07606b7b','건강/스포츠'),(48,NULL,'부모의 내면이 아이의 세상이 된다','대니얼 J.시겔, 메리 하첼',NULL,NULL,'아이의 건강한 성장을 위한 부모의 심리적 건강 관리','img/r3.jpg','https://search.shopping.naver.com/book/catalog/53596732377','건강/스포츠'),(49,NULL,'저속노화 마인드셋','정희원',NULL,NULL,'건강한 노화를 위한 마음가짐과 생활 철학','img/r4.jpg','https://search.shopping.naver.com/book/catalog/55233201844','건강/스포츠'),(50,NULL,'길 위의 뇌','정세희',NULL,NULL,'일상 속에서 뇌 건강을 지키는 실용적인 방법들','img/r5.jpg','https://search.shopping.naver.com/book/catalog/50794068618?query=%EA%B8%B8%20%EC%9C%84%EC%9D%98%20%EB%87%8C&NaPm=ct%3Dmcvc9smo%7Cci%3D9d67f65f31faa3dcadab9d161e0585248f2711e7%7Ctr%3Dboksl%7Csn%3D95694%7Chk%3D4a8ab8bb1bb33db1de9182cbe7a097da01713eec','건강/스포츠'),(51,NULL,'해독 혁명','닥터 라이블리',NULL,NULL,'몸의 독소를 제거하고 건강을 회복하는 혁신적 방법','img/r6.jpg','https://search.shopping.naver.com/book/catalog/48703888627?query=%ED%95%B4%EB%8F%85%20%ED%98%81%EB%AA%85&NaPm=ct%3Dmcvc9zko%7Cci%3D77627ae6d187d6698827038f56c2b8643e451a12%7Ctr%3Dboksl%7Csn%3D95694%7Chk%3D64dbe4852c35b1492f68e55e44b646a190dde7a2','건강/스포츠'),(52,NULL,'저속노화 식사법','정희원',NULL,NULL,'노화를 늦추는 과학적인 식단과 영양 관리법','img/r7.jpg','https://search.shopping.naver.com/book/catalog/49230537626','건강/스포츠'),(53,NULL,'내 몸 혁명','박용우',NULL,NULL,'건강한 몸을 만들기 위한 총체적인 생활 개선 가이드','img/r8.jpg','https://search.shopping.naver.com/book/catalog/44790604624?query=%EB%82%B4%20%EB%AA%B8%20%ED%98%81%EB%AA%85&NaPm=ct%3Dmcvcadgo%7Cci%3D50c90a0cdc31cd918c7fc29d187e1e6d6c5fa910%7Ctr%3Dboksl%7Csn%3D95694%7Chk%3D4007b7c1dfe599a3058b2b35ccf35493aec024a4','건강/스포츠'),(54,NULL,'느리게 나이 드는 습관','정희원',NULL,NULL,'건강한 장수를 위한 일상 습관의 중요성과 실천법','img/r9.jpg','https://search.shopping.naver.com/book/catalog/43898089618?query=%EB%8A%90%EB%A6%AC%EA%B2%8C%20%EB%82%98%EC%9D%B4%20%EB%93%9C%EB%8A%94%20%EC%8A%B5%EA%B4%80&NaPm=ct%3Dmcvcanhs%7Cci%3Dd155ff5498686e214129a1b4abb15070897aae86%7Ctr%3Dboksl%7Csn%3D95694%7Chk%3D2079cefcb2b9b9d0fb2270430b8a3ace241eab67','건강/스포츠'),(55,NULL,'기적의 항암 식단','김훈하, 김정은',NULL,NULL,'암 예방과 치료에 도움이 되는 과학적 식단 가이드','img/r10.jpg','https://search.shopping.naver.com/book/catalog/50395358626?query=%EA%B8%B0%EC%A0%81%EC%9D%98%20%ED%95%AD%EC%95%94%20%EC%8B%9D%EB%8B%A8&NaPm=ct%3Dmcvcavzc%7Cci%3D7d12ed3ca292bbb10294297dd696d22fb013a227%7Ctr%3Dboksl%7Csn%3D95694%7Chk%3Dcc23e32566607a2971ab2976d5dc4935a89940b7','건강/스포츠'),(56,NULL,'회복탄력성의 뇌과학','아디티 네루카',NULL,NULL,'스트레스와 트라우마에 맞서는 뇌의 회복 능력 탐구','img/r11.jpg','https://search.shopping.naver.com/book/catalog/54747847889','건강/스포츠'),(57,NULL,'수면의 뇌과학','크리스 윈터',NULL,NULL,'양질의 수면을 위한 과학적 이해와 실천 방법','img/r12.jpg','https://search.shopping.naver.com/book/catalog/54896514986?query=%EC%88%98%EB%A9%B4%EC%9D%98%20%EB%87%8C%EA%B3%BC%ED%95%99&NaPm=ct%3Dmcvcbei0%7Cci%3D144c48537cb5c4ceb9dfe2e50ec1387d410ffc07%7Ctr%3Dboksl%7Csn%3D95694%7Chk%3Df74436f2d976b0cb1fa0713b480ce894c1fb1af0','건강/스포츠'),(58,NULL,'넥서스','유발 하라리',NULL,NULL,'글로벌 베스트셀러 『사피엔스』 『호모 데우스』 『21세기를 위한 21가지 제언』으로 우리 시대 가장 중요한 사상가의 반열에 오른 유발 하라리 교수가 압도적 통찰로 AI 혁명의 의미와 본질을 꿰뚫어 보고 인류에게 남은 기회를 냉철하게 성찰하는 신작으로 돌아왔다. 생태적 붕괴와 국제정치적 긴장에 이어 친구인지 적인지 모를 AI 혁명까지, 인간 본성의 어떤 부분이 우리를 자기 파괴의 길로 내모는 것일까? AI는 이전 정보 기술과 무엇이 다르고, 왜 위험할까? 멸종을 향해 달려가는 가장 영리한 동물, 우리 사피엔스는 생존과 번영의 길을 찾을 수 있을까?','img/dur5.jpg','https://search.shopping.naver.com/book/catalog/50719395622?query=%EB%84%A5%EC%84%9C%EC%8A%A4&NaPm=ct%3Dmcv9knps%7Cci%3D1c7803e088b3f185433a205ad833472f78f73959%7Ctr%3Dboksl%7Csn%3D95694%7Chk%3De858420a6754cb480cad7bacc6cde51200163a99','인문/역사'),(59,NULL,'사피엔스','유발 하라리',NULL,NULL,'인류의 역사와 미래를 거시적으로 조망','img/dur.jpg','https://search.shopping.naver.com/book/catalog/32482377706?query=%EC%82%AC%ED%94%BC%EC%97%94%EC%8A%A4&NaPm=ct%3Dmcv9pads%7Cci%3Ddc5ad71344ab5d87b1254d068e97120cbbbbca55%7Ctr%3Dboksl%7Csn%3D95694%7Chk%3D2353d2214368a92cdd1c6d6d565ae0c5af48e2a7','인문/역사'),(60,NULL,'역사란 무엇인가','E.H. 카',NULL,NULL,'역사학의 고전이자 필독서','img/dur1.jpg','https://search.shopping.naver.com/book/catalog/32491397685?query=%EC%97%AD%EC%82%AC%EB%9E%80%20%EB%AC%B4%EC%97%87%EC%9D%B8%EA%B0%80&NaPm=ct%3Dmcv9phbs%7Cci%3D9e0577f681fe0f5059c132c003f92fbbc4160ce0%7Ctr%3Dboksl%7Csn%3D95694%7Chk%3D7d5ce94157c1a96900f87a15794790ee4dbc49ad','인문/역사'),(61,NULL,'로마 제국 쇠망사','에드워드 기번',NULL,NULL,'서양 고전 역사의 기념비적 저작','img/dur2.jpg','https://search.shopping.naver.com/book/catalog/32456299092?query=%EB%A1%9C%EB%A7%88%20%EC%A0%9C%EA%B5%AD%20%EC%87%A0%EB%A7%9D%EC%82%AC&NaPm=ct%3Dmcv9pswg%7Cci%3D7c7e79b601703137124823b1e9551866991353eb%7Ctr%3Dboksl%7Csn%3D95694%7Chk%3D77a30cadd5a87a0e16279bee268c198aa7db3fd7','인문/역사'),(62,NULL,'총, 균, 쇠','재레드 다이아몬드',NULL,NULL,'문명의 흥망성쇠를 환경적 관점에서 분석','img/dur3.jpg','https://search.shopping.naver.com/book/catalog/39856960624?query=%EC%B4%9D%EA%B7%A0%EC%87%A0&NaPm=ct%3Dmcv9q1e0%7Cci%3Dd918366dae18c50f256e93af136b4c006dc73970%7Ctr%3Dboksl%7Csn%3D95694%7Chk%3Dcbf29ecfeb600ae1c82d98ade59d76f154b4a941','인문/역사'),(63,NULL,'나의 문화유산답사기','유홍준',NULL,NULL,'한국 문화유산의 아름다움을 대중에게 알림','img/dur4.jpg','https://search.shopping.naver.com/book/catalog/32436241087?query=%EB%82%98%EC%9D%98%20%EB%AC%B8%ED%99%94%EC%9C%A0%EC%82%B0%EB%8B%B5%EC%82%AC%EA%B8%B0&NaPm=ct%3Dmcv9qg1s%7Cci%3D61a384213a6586db7c133acbf7a9cccceb7c3283%7Ctr%3Dboksl%7Csn%3D95694%7Chk%3De6f34154fc938ef1e09cce7496c6f49b81f5ece2','인문/역사'),(64,NULL,'넥서스','유발 하라리',NULL,NULL,'정보와 권력의 미래를 예측하는 통찰력 있는 분석','img/dur5.jpg','https://search.shopping.naver.com/book/catalog/50719395622?query=%EB%84%A5%EC%84%9C%EC%8A%A4&NaPm=ct%3Dmcv9knps%7Cci%3D1c7803e088b3f185433a205ad833472f78f73959%7Ctr%3Dboksl%7Csn%3D95694%7Chk%3De858420a6754cb480cad7bacc6cde51200163a99','인문/역사'),(65,NULL,'서양미술사','에른스트 H. 곰브리치',NULL,NULL,'미술사의 바이블로 불리는 대표적인 입문서','img/dur6.jpg','https://search.shopping.naver.com/book/catalog/33294399618?query=%EC%84%9C%EC%96%91%EB%AF%B8%EC%88%A0%EC%82%AC&NaPm=ct%3Dmcv9qpb4%7Cci%3Dfefccef26af017f9f868bb5e79894cb57eabbfe9%7Ctr%3Dboksl%7Csn%3D95694%7Chk%3D915160d74c02727423960f43608ab4cd8ae3a190','인문/역사'),(66,NULL,'문화의 수수께끼','마빈 해리스',NULL,NULL,'다양한 문화 현상을 인류학적 관점에서 해석','img/dur7.jpg','https://search.shopping.naver.com/book/catalog/32480521928?query=%EB%AC%B8%ED%99%94%EC%9D%98%20%EC%88%98%EC%88%98%EA%BB%98%EB%81%BC&NaPm=ct%3Dmcv9qykg%7Cci%3D87b5ba5aefaf7ab2fdf7e17267d3bd67995cdefb%7Ctr%3Dboksl%7Csn%3D95694%7Chk%3Dace7be21204ac288b5d15abe8559270613a23c98','인문/역사'),(67,NULL,'죽은 경제학자의 살아있는 아이디어','토드 부크홀츠',NULL,NULL,'경제사상사를 쉽고 재미있게 풀어냄','img/dur8.jpg','https://search.shopping.naver.com/book/catalog/42353371620?query=%EC%A3%BD%EC%9D%80%20%EA%B2%BD%EC%A0%9C%ED%95%99%EC%9E%90%EC%9D%98%20%EC%82%B4%EC%95%84%EC%9E%88%EB%8A%94%20%EC%95%84%EC%9D%B4%EB%94%94%EC%96%B4&NaPm=ct%3Dmcv9r6a8%7Cci%3D18d7cff852655372d279d5035dc805907bf2f85e%7Ctr%3Dboksl%7Csn%3D95694%7Chk%3Db876763806dd60cca0d54a2c9b71a0b03b62db73','인문/역사'),(68,NULL,'21세기 자본','토마 피케티',NULL,NULL,'불평등 문제를 역사적 데이터로 분석','img/dur9.jpg','https://search.shopping.naver.com/book/catalog/32473959224?query=21%EC%84%B8%EA%B8%B0%20%EC%9E%90%EB%B3%B8&NaPm=ct%3Dmcv9re00%7Cci%3Dbd6663b943620bbd2f776fe6b72a08f8c889fa79%7Ctr%3Dboksl%7Csn%3D95694%7Chk%3Df3e7954f5759f1058cd7afc4d341bdd2040eb120','인문/역사'),(69,NULL,'유럽 도시 기행1','유시민',NULL,NULL,'유럽 도시들의 역사와 문화를 깊이 있게 탐방','img/dur10.jpg','https://search.shopping.naver.com/book/catalog/32473668644?query=%EC%9C%A0%EB%9F%BD%20%EB%8F%84%EC%8B%9C%20%EA%B8%B0%ED%96%89&NaPm=ct%3Dmcv9rpko%7Cci%3Db8aaff2b9230f086c66e1010619a8a29785ab7d3%7Ctr%3Dboksl%7Csn%3D95694%7Chk%3D1658002f32c0e36a5f9b67cba2b0ff491c978ac3','인문/역사'),(70,NULL,'사마천 사기','사마천',NULL,NULL,'중국 역사서의 걸작이자 동양 사학의 출발점','img/dur11.jpg','https://search.shopping.naver.com/book/catalog/32466560260?query=%EC%82%AC%EB%A7%88%EC%B2%9C%20%EC%82%AC%EA%B8%B0&NaPm=ct%3Dmcv9ry28%7Cci%3Df5e55aa87e5ee7dc6478ef365bbe779e0fb3dbb2%7Ctr%3Dboksl%7Csn%3D95694%7Chk%3D6ae0ad3fe038ba0bf4bdf6be0ac6f00a6b43ca07','인문/역사'),(71,NULL,'조선왕조실록','대중을 위한 번역본',NULL,NULL,'한국사의 방대한 기록물','img/dur12.jpg','https://search.shopping.naver.com/book/catalog/32436408621?query=%EC%A1%B0%EC%84%A0%EC%99%95%EC%A1%B0%EC%8B%A4%EB%A1%9D&NaPm=ct%3Dmcv9s508%7Cci%3D05508df25f5460a3cece9ff44bd1a5523da16abf%7Ctr%3Dboksl%7Csn%3D95694%7Chk%3D2c2548ed015d5b018b874060c495484506a77627','인문/역사'),(72,NULL,'물질의 세계','에드 콘웨이',NULL,NULL,'현대 문명을 이루는 물질들의 숨겨진 이야기','img/a1.jpg','https://search.shopping.naver.com/book/catalog/45945140629?query=%EB%AC%BC%EC%A7%88%EC%9D%98%20%EC%84%B8%EA%B3%84&NaPm=ct%3Dmcv9skfs%7Cci%3Df40d1034a4f9c8e00dfa3d0326891f0b43a2402b%7Ctr%3Dboksl%7Csn%3D95694%7Chk%3Dbb9f15cb59a901770e50e6268913e90565a906e4','인문/역사'),(73,NULL,'삼국유사','일연',NULL,NULL,'한국 고대사와 불교문화의 소중한 기록','img/dur13.jpg','https://search.shopping.naver.com/book/catalog/32441520646?query=%EC%82%BC%EA%B5%AD%EC%9C%A0%EC%82%AC&NaPm=ct%3Dmcv9sugw%7Cci%3Da95661442bb6b404e0583cd9b8c717770f330c10%7Ctr%3Dboksl%7Csn%3D95694%7Chk%3Dbace62bc83582256edec3a162d2088340807a746','인문/역사'),(74,NULL,'역사의 종말','프랜시스 후쿠야마',NULL,NULL,'냉전 이후 서구 자유민주주의의 승리 선언','img/dur14.jpg','https://search.shopping.naver.com/book/catalog/32441619939?query=%EC%97%AD%EC%82%AC%EC%9D%98%20%EC%A2%85%EB%A7%90&NaPm=ct%3Dmcv9t8cw%7Cci%3Dc197e16db9d9bdf6ef6bc783ec690e75f0f35b25%7Ctr%3Dboksl%7Csn%3D95694%7Chk%3D2de03783f44a53b810b75690bf1e6ce832e2fd17','인문/역사'),(75,NULL,'세계사를 바꾼 10가지 약','사토 겐타로',NULL,NULL,'인류 역사는 ‘질병과 약의 투쟁 역사’다','img/dur18.jpg','https://search.shopping.naver.com/book/catalog/32466558141?query=%EC%84%B8%EA%B3%84%EC%82%AC%EB%A5%BC%20%EB%B0%94%EA%BE%BC%2010%EA%B0%80%EC%A7%80%20%EC%95%BD&NaPm=ct%3Dmcv9tj5s%7Cci%3D28aff249f6ada1d2842b3e4e388d6375482a0773%7Ctr%3Dboksl%7Csn%3D95694%7Chk%3Dba4a22f51b9e57e109025eed2c3a30509cc11ad5','인문/역사'),(76,NULL,'다시, 역사의 쓸모','최태성',NULL,NULL,'현재를 이해하기 위한 역사적 통찰력','img/dur17.jpg','https://search.shopping.naver.com/book/catalog/49208589629?query=%EB%8B%A4%EC%8B%9C%2C%20%EC%97%AD%EC%82%AC%EC%9D%98%20%EC%93%B8%EB%AA%A8&NaPm=ct%3Dmcv9tvi8%7Cci%3D111a753f4fdad18da611952ceb1f1fd3e0b1dcd1%7Ctr%3Dboksl%7Csn%3D95694%7Chk%3D20bf5022a05c4c0d3f317c6b5ed660eecf89ddee','인문/역사'),(77,NULL,'잃어버린 시간을 찾아서','마르셀 프루스트',NULL,NULL,'기억과 시간의 본질을 탐구','img/dur15.jpg','https://search.shopping.naver.com/book/catalog/36737624622?query=%EC%9E%83%EC%96%B4%EB%B2%84%EB%A6%B0%20%EC%8B%9C%EA%B0%84%EC%9D%84%20%EC%B0%BE%EC%95%84%EC%84%9C&NaPm=ct%3Dmcv9wsg0%7Cci%3Dccd438d602a7dcf302c5dd014bdde31db946d6cc%7Ctr%3Dboksl%7Csn%3D95694%7Chk%3D5df80e5f573771b29217505d3436a2c4df8923ef','인문/역사'),(78,NULL,'호모데우스','유발 하라리',NULL,NULL,'기술 발전이 가져올 인류의 미래를 예측','img/dur19.jpg','https://search.shopping.naver.com/book/catalog/32487126410?query=%ED%98%B8%EB%AA%A8%20%EB%8D%B0%EC%9A%B0%EC%8A%A4&NaPm=ct%3Dmcv9x1pc%7Cci%3Dfb5e8df18a33a3c36949fdecd2a6448dc54043d5%7Ctr%3Dboksl%7Csn%3D95694%7Chk%3D4c0e49e9965d3cb98ddcbc28e866bcf4ebe4caa5','인문/역사'),(79,NULL,'용의자 X의 헌신','히가시노 게이고',NULL,NULL,'천재 수학자 이시가미는 옆집에 사는 야스코가 전남편을 살해한 것을 알게 된다. 그녀를 향한 깊은 사랑으로 그는 완벽한 알리바이를 설계하며 자신의 모든 것을 바친다. 사건을 파고드는 천재 물리학자 유카와와의 치열한 두뇌 싸움 속에서, 상상을 초월하는 헌신적인 사랑의 비밀이 드러난다.','img/m3.jpg','https://search.shopping.naver.com/book/catalog/32463541483','미스테리/추리'),(80,NULL,'셜록 홈즈 전집','아서 코난 도일',NULL,NULL,'탐정 소설의 고전이자 원형','img/m.jpg','https://search.shopping.naver.com/book/catalog/32491716827?query=%EC%85%9C%EB%A1%9D%20%ED%99%88%EC%A6%88%20%EC%A0%84%EC%A7%91%20%EC%84%B8%ED%8A%B8&NaPm=ct%3Dmcvaeik8%7Cci%3D9924dcf538bbd98cdec3038a21c4ef09fe997ba7%7Ctr%3Dboksl%7Csn%3D95694%7Chk%3D5666aaa11a614a772f79ff424a5fe0bd54be5754','미스테리/추리'),(81,NULL,'그리고 아무도 없었다','애거서 크리스티',NULL,NULL,'밀실 추리 소설의 대가','img/m1.jpg','https://search.shopping.naver.com/book/catalog/32463426752?query=%EA%B7%B8%EB%A6%AC%EA%B3%A0%20%EC%95%84%EB%AC%B4%EB%8F%84%20%EC%97%86%EC%97%88%EB%8B%A4&NaPm=ct%3Dd736d36b62b1227405fa14c108e3057744cebc20%7Ctr%3Dboksl%7Csn%3D95694%7Chk%3Dc969bc301fedf65fbbcc5bff76a4f9f7ee2b87e9','미스테리/추리'),(82,NULL,'검은 고양이','에드거 앨런 포',NULL,NULL,'고딕 소설과 심리 스릴러의 선구자','img/m2.jpg','https://search.shopping.naver.com/book/catalog/39570707619?query=%EA%B2%80%EC%9D%80%20%EA%B3%A0%EC%96%91%EC%9D%B4&NaPm=ct%3Dmcvaf5pk%7Cci%3D27332be374cfe3df039d6b41c74f3c78d84f11dd%7Ctr%3Dboksl%7Csn%3D95694%7Chk%3D5a6035d01f2cd1db89d5568d2a2d04faeee02209','미스테리/추리'),(83,NULL,'용의자 X의 헌신','히가시노 게이고',NULL,NULL,'반전과 심리 묘사가 뛰어난 일본 미스터리','img/m3.jpg','https://search.shopping.naver.com/book/catalog/32463541483','미스테리/추리'),(84,NULL,'이방인','알베르 카뮈',NULL,NULL,'부조리 문학의 대표작','img/m4.jpg','https://search.shopping.naver.com/book/catalog/32465496972?query=%EC%9D%B4%EB%B0%A9%EC%9D%B8&NaPm=ct%3Dmcvafs34%7Cci%3D2ae9a51d3cb2735b1c01d2745299b17d8da7a579%7Ctr%3Dboksl%7Csn%3D95694%7Chk%3D0daace47f658c0f1520f06f47a933df370b3adcb','미스테리/추리'),(85,NULL,'살인자의 기억법','김영하',NULL,NULL,'기억 상실 살인범의 독특한 시점','img/m5.jpg','https://search.shopping.naver.com/book/catalog/32445380150?query=%EC%82%B4%EC%9D%B8%EC%9E%90%EC%9D%98%20%EA%B8%B0%EC%96%B5%EB%B2%95&NaPm=ct%3Dmcvafzsw%7Cci%3Dfd2185717f8847d6d1d967b6d062c205de013e33%7Ctr%3Dboksl%7Csn%3D95694%7Chk%3D4bc0d330fa37fc48015b0ff87d32a4bf3191090a','미스테리/추리'),(86,NULL,'눈먼 암살자','마거릿 애트우드',NULL,NULL,'문학성과 서스펜스를 겸비한 작품','img/m6.jpg','https://search.shopping.naver.com/book/catalog/32486069451?query=%EB%88%88%EB%A8%BC%20%EC%95%94%EC%82%B4%EC%9E%90&NaPm=ct%3Dmcvag8ag%7Cci%3Dcde13f0041d6b8d706f5d02628766c98343818e8%7Ctr%3Dboksl%7Csn%3D95694%7Chk%3Dcd4765d87b777dedebccc9910056183eb81e3332','미스테리/추리'),(87,NULL,'나를 찾아줘','길리언 플린',NULL,NULL,'예측 불허의 반전 심리 스릴러','img/m7.jpg','https://search.shopping.naver.com/book/catalog/32455951957?query=%EB%82%98%EB%A5%BC%20%EC%B0%BE%EC%95%84%EC%A4%98&NaPm=ct%3Dmcvagq1c%7Cci%3D3fe2cabd833e56b6851386f1fa0eb0d384a04a33%7Ctr%3Dboksl%7Csn%3D95694%7Chk%3Dbc0aced3345f5e170a5f8773798d231667de0bc8','미스테리/추리'),(88,NULL,'침묵의 봄','레이첼 카슨',NULL,NULL,'환경 미스터리 고전','img/m8.jpg','https://search.shopping.naver.com/book/catalog/47250914620?query=%EC%B9%A8%EB%AC%B5%EC%9D%98%20%EB%B4%84&NaPm=ct%3Dmcxrpx6w%7Cci%3Ddbeab8f549d1fbd6f34543158adbc7bd70363d17%7Ctr%3Dboksl%7Csn%3D95694%7Chk%3D66d4662cfd4e1ec2ba2044ddb1f67b9cb1a8190b','미스테리/추리'),(89,NULL,'양들의 침묵','토마스 해리스',NULL,NULL,'사이코패스 범죄 스릴러의 대표작','img/m9.jpg','https://search.shopping.naver.com/book/catalog/37993612653?query=%EC%96%91%EB%93%A4%EC%9D%98%20%EC%B9%A8%EB%AC%B5&NaPm=ct%3Dmcvamzcg%7Cci%3D9d4dc7e2aad09170636c2801c3775b7ef0aa94a6%7Ctr%3Dboksl%7Csn%3D95694%7Chk%3D9ef8c6e267a4b2df9c67d501e0781fb068bac159','미스테리/추리'),(90,NULL,'나미야 잡화점의 기적','히가시노 게이고',NULL,NULL,'따뜻한 판타지 미스터리','img/m10.jpg','https://search.shopping.naver.com/book/catalog/36801579622?query=%EB%82%98%EB%AF%B8%EC%95%BC%20%EC%9E%A1%ED%99%94%EC%A0%90%EC%9D%98%20%EA%B8%B0%EC%A0%81&NaPm=ct%3Dmcvavan9dk%7Cci%3D7795a37a4957224c1afa0c7091be83486272ab02%7Ctr%3Dboksl%7Csn%3D95694%7Chk%3D67107793576e49f9cfe82342e4915bfa430eb041','미스테리/추리'),(91,NULL,'장미의 이름','움베르토 에코',NULL,NULL,'중세 수도원 배경의 지적 추리 소설','img/m11.jpg','https://search.shopping.naver.com/book/catalog/32477587844?query=%EC%9E%A5%EB%AF%B8%EC%9D%98%20%EC%9D%B4%EB%A6%84&NaPm=ct%3Dmcvank6g%7Cci%3D4234cdc06363d49b3166dcc8309a4a2236c27cd8%7Ctr%3Dboksl%7Csn%3D95694%7Chk%3Dd582e4b8ec6980584783d9c83dd259d75b8b33f0','미스테리/추리'),(92,NULL,'죄와 벌','표도르 도스토옙스키',NULL,NULL,'범죄와 인간 양심의 문제를 다룬 심리 소설','img/m12.jpg','https://search.shopping.naver.com/book/catalog/32463522644?query=%EC%A3%84%EC%99%80%20%EB%B2%8C&NaPm=ct%3Dmcvvanr4g%7Cci%3D3a3bf6ac825db8dec45ead9b002bed9cca17ad11%7Ctr%3Dboksl%7Csn%3D95694%7Chk%3Dde3a2d9c024313c4b159a1d36e11dbbbbe847603','미스테리/추리'),(93,NULL,'나는 고양이로소이다','나쓰메 소세키',NULL,NULL,'인간 사회 풍자','img/m13.jpg','https://search.shopping.naver.com/book/catalog/32491412836?query=%EB%82%98%EB%8A%94%20%EA%B3%A0%EC%96%91%EC%9D%B4%EB%A1%9C%EC%86%8C%EC%9D%B4%EB%8B%A4&NaPm=ct%3Dmcvvao0ds%7Cci%3Db603840d303484a31812aaf5a93d7cab9e1c8a27%7Ctr%3Dboksl%7Csn%3D95694%7Chk%3Dcb5c60e1c59551d40a23beeb5b22efe62748186f','미스테리/추리'),(94,NULL,'검은 집','기시 유스케',NULL,NULL,'일본 호러 미스터리','img/m14.jpg','https://search.shopping.naver.com/book/catalog/35304167846?query=%EA%B2%80%EC%9D%80%20%EC%A7%91&NaPm=ct%3Dmcvvaoaew%7Cci%3D82cfc178b2358aa13c3d69a47b7675ebef396182%7Ctr%3Dboksl%7Csn%3D95694%7Chk%3Ddd1208b166de3096ccb105d6ca16af164b7235d6','미스테리/추리'),(95,NULL,'애크로이드 살인 사건','애거사 크리스티',NULL,NULL,'추리 소설사에 길이 남을 혁신적인 트릭','img/m15.jpg','https://search.shopping.naver.com/book/catalog/32486413942','미스테리/추리'),(96,NULL,'고독한 용의자','찬호께이',NULL,NULL,'홍콩 추리 소설의 독특한 매력을 보여주는 작품','img/m16.jpg','https://search.shopping.naver.com/book/catalog/54213715512','미스테리/추리'),(97,NULL,'첫번째 거짓말이 중요하다','애슐리 엘스턴',NULL,NULL,'청소년을 위한 흥미진진한 미스터리 소설','img/m17.jpg','https://search.shopping.naver.com/book/catalog/54069896693','미스테리/추리'),(98,NULL,'하우스메이드','프리다 맥파튼',NULL,NULL,'계급 갈등과 복수를 다룬 심리 스릴러','img/m18.jpg','https://search.shopping.naver.com/book/catalog/39075448620?query=%ED%95%98%EC%9A%B0%EC%8A%A4%EB%A9%94%EC%9D%B4%EB%93%9C&NaPm=ct%3Dmcvap7lc%7Cci%3D88f55ce5b16868ed01fa793744b62d30d9c9d22a%7Ctr%3Dboksl%7Csn%3D95694%7Chk%3D6bf3b2f480eaa9e1464821155bc852bd9d0fe537','미스테리/추리'),(99,NULL,'Y의 비극','앨러리 퀸',NULL,NULL,'본격 추리 소설의 황금기를 대표하는 고전','img/m19.jpg','https://search.shopping.naver.com/book/catalog/32463439697?query=Y%EC%9D%98%20%EB%B9%84%EA%B7%B9&NaPm=ct%3Dmcvapejc%7Cci%3D1f818ccfe933f7026c71eab422ed9b5f6b6686a0%7Ctr%3Dboksl%7Csn%3D95694%7Chk%3Db45d508401125d562af3c9e0c37bc3d1c49d856d','미스테리/추리'),(100,NULL,'정의란 무엇인가','마이클 샌델',NULL,NULL,'한국에 \'정의\' 열풍을 불러일으킨 마이클 샌델은 구제 금융, 대리 출산, 동성 결혼, 과거사 공개 사과 등 현대 사회에서 우리가 흔히 부딪히는 문제를 통해 \'무엇이 정의로운가\'에 대한 해답을 탐구했다. 이 책은 탁월한 정치 철학자들이 남긴 시대를 초월한 철학적인 질문을 알기 쉽게 소개한다. 이를 통해 옳고 그름, 정의와 부당함, 평등과 불평등, 개인의 권리와 공동선을 둘러싼 주장들이 경쟁하는 공적 담론과 토론의 장에서 정의에 관한 자신만의 견해를 정립하고 논리 기반을 굳건하게 다지는 토대를 제공한다. 이 책은 현대 사회의 문제를 진단하고 새로운 대안을 찾아내는 정치 철학자들의 지적 탐색 과정을 보여준다.','img/c.jpg','https://search.shopping.naver.com/book/catalog/32496186730?query=%EC%A0%95%EC%9D%98%EB%9E%80%20%EB%AC%B4%EC%97%87%EC%9D%B8%EA%B0%80&NaPm=ct%3Dmcvatsps%7Cci%3Daae8d75304057911d156f3e6d6b0b32eb47cec67%7Ctr%3Dboksl%7Csn%3D95694%7Chk%3D7c85b83a1643d6d8323e4ebf532b7fff987827c1','철학'),(101,NULL,'정의란 무엇인가','마이클 샌델',NULL,NULL,'현대 사회의 정의 문제에 대한 윤리적 고찰','img/c.jpg','https://search.shopping.naver.com/book/catalog/32496186730?query=%EC%A0%95%EC%9D%98%EB%9E%80%20%EB%AC%B4%EC%97%87%EC%9D%B8%EA%B0%80&NaPm=ct%3Dmcvatsps%7Cci%3Daae8d75304057911d156f3e6d6b0b32eb47cec67%7Ctr%3Dboksl%7Csn%3D95694%7Chk%3D7c85b83a1643d6d8323e4ebf532b7fff987827c1','철학'),(102,NULL,'국가','플라톤',NULL,NULL,'이상적인 국가와 정의에 대한 서양 철학의 고전','img/c1.jpg','https://search.shopping.naver.com/book/catalog/54399687943?query=%EA%B5%AD%EA%B0%80%20%ED%94%8C%EB%9D%BC%ED%86%A0%EB%A9%8C&NaPm=ct%3Dmcvaxi7c%7Cci%3Dd728e87cccfd37ef97cba1956260c58c9b2e5cda%7Ctr%3Dboksl%7Csn%3D95694%7Chk%3D266bacbbe0cc7cf1ad63afd64cc51b6cf87cd584','철학'),(103,NULL,'순수이성비판','임마누엘 칸트',NULL,NULL,'근대 서양 철학의 기념비적 저작','img/c2.jpg','https://search.shopping.naver.com/book/catalog/32456295914?query=%EC%88%9C%EC%88%9C%EC%9D%B4%EC%84%B1%EB%B9%84%ED%8C%90&NaPm=ct%3Dmcvaxpx4%7Cci%3Db9824e224368e11225044bcd540d402e6a696bc3%7Ctr%3Dboksl%7Csn%3D95694%7Chk%3Dfa93f2ef4d7549ab1437c9c2aeca5640021d4d16','철학'),(104,NULL,'차라투스트라는 이렇게 말했다','프리드리히 니체',NULL,NULL,'초인 사상과 영원 회귀 사상','img/c3.jpg','https://search.shopping.naver.com/book/catalog/32445527545?query=%EC%B0%A8%EB%9D%BC%ED%88%AC%EC%8A%A4%ED%8A%B8%EB%9D%BC%EB%8A%94%20%EC%9D%B4%EB%A0%87%EA%B2%8C%20%EB%A7%90%ED%96%88%EB%8B%A4&NaPm=ct%3Dmcvaxxmw%7Cci%3D6a33d859cc0da367d16cfc8bd07129f9d3213b9b%7Ctr%3Dboksl%7Csn%3D95694%7Chk%3D93415c6b7643f2ad4ef275e8d248a9dfb64dbe8c','철학'),(105,NULL,'데미안','헤르만 헤세',NULL,NULL,'자아를 찾아가는 성장과 철학적 여정','img/c4.jpg','https://search.shopping.naver.com/book/catalog/32441645060?query=%EB%8D%B0%EB%AF%B8%EC%95%88&NaPm=ct%3Dmcvay3t4%7Cci%3D398963cbb4ec46261c02cd703c3e6fedd5d224ac%7Ctr%3Dboksl%7Csn%3D95694%7Chk%3D63cb429593ee6b79a3b0ca6d116937cf9a2aedb9','철학'),(106,NULL,'죽은 시인의 사회','N.H. 클라인바움',NULL,NULL,'자유로운 사고와 삶의 본질 탐구','img/c5.jpg','https://search.shopping.naver.com/book/catalog/32463251656?query=%EC%A3%BD%EC%9D%80%20%EC%8B%9C%EC%9D%B8%EC%9D%98%20%EC%82%AC%ED%9A%8C&NaPm=ct%3Dmcvaycao%7Cci%3D1536dd35342b8357574d2ef2337dce297523bbb3%7Ctr%3Dboksl%7Csn%3D95694%7Chk%3D8678e3c042e516858e8de70427ddf1476a5e33db','철학'),(107,NULL,'군주론','니콜로 마키아벨리',NULL,NULL,'정치 철학의 냉혹한 현실을 보여주는 고전','img/c6.jpg','https://search.shopping.naver.com/book/catalog/32454452301?query=%EA%B5%B0%EC%A3%BC%EB%A1%A0&NaPm=ct%3Dmcvayj8o%7Cci%3D7b019c952ae29789af32e7172c734f3e0f4acbaa%7Ctr%3Dboksl%7Csn%3D95694%7Chk%3D2856f7e71e3836f2a88de3c02c889f137b6ee96f','철학'),(108,NULL,'자유론','존 스튜어트 밀',NULL,NULL,'개인의 자유와 사회의 역할에 대한 고찰','img/c7.jpg','https://search.shopping.naver.com/book/catalog/53249090482?query=%EC%9E%90%EC%9C%A0%EB%A1%A0&NaPm=ct%3Dmcvayq6o%7Cci%3D0e17bd486171c5b16fa21988eaafb38c45213595%7Ctr%3Dboksl%7Csn%3D95694%7Chk%3D2815503344308e5a4602e0e205574437609b9bb8','철학'),(109,NULL,'아픔이 길이 되려면','김승섭',NULL,NULL,'사회적 고통을 의학적 관점에서 성찰한 인문학적 탐구','img/c8.jpg','https://search.shopping.naver.com/book/catalog/32475523886?query=%EC%95%84%ED%94%84%EC%9D%B4%20%EA%B8%B8%EC%9D%B4%20%EB%90%98%EB%A0%A4%EB%A9%B4&NaPm=ct%3Dmcvayyo8%7Cci%3Df86aa1df92a01bc281809d3db87dca7b02ae8795%7Ctr%3Dboksl%7Csn%3D95694%7Chk%3D0ec04e1ea467fd883cbf0c835d53814d39687418','철학'),(110,NULL,'도덕경','노자',NULL,NULL,'무위자연과 도의 철학을 담은 동양 철학의 고전','img/c9.jpg','https://search.shopping.naver.com/book/catalog/37236380619?query=%EB%8F%84%EB%8D%95%EA%B2%BD&NaPm=ct%3Dmcvaziqg%7Cci%3D0366fc377d86693cdfc26ba1048c7035f5d1fa25%7Ctr%3Dboksl%7Csn%3D95694%7Chk%3D7eda0400e6fe304a7cb37b561e6d757bcdd19518','철학'),(111,NULL,'철학이 필요한 시간','강신주',NULL,NULL,'일상 속 철학적 사유를 권하는 책','img/c10.jpg','https://search.shopping.naver.com/book/catalog/32441101016?query=%EC%B2%A0%ED%95%84%EC%9D%B4%20%ED%95%84%EC%9A%94%ED%95%9C%20%EC%8B%9C%EA%B0%84&NaPm=ct%3Dmcvazsrk%7Cci%3D839949028eaa13f7cd08834422de9358d82264a2%7Ctr%3Dboksl%7Csn%3D95694%7Chk%3D33f5ee9d409c8692ff1bc34b1aff831321440f1c','철학'),(112,NULL,'논어','공자',NULL,NULL,'유교 사상의 핵심이자 동양 철학의 근간','img/c11.jpg','https://search.shopping.naver.com/book/catalog/34906313618?query=%EB%85%BC%EC%96%B4&NaPm=ct%3Dmcvb0540%7Cci%3D68be772616e8b18ecbedff087bf0bf4aea912a49%7Ctr%3Dboksl%7Csn%3D95694%7Chk%3Dad0fdb82c184b6d3281ba11fbc10121b35e1d58b','철학'),(113,NULL,'마흔에 읽는 쇼펜하우어','쇼펜하우어',NULL,NULL,'중년의 관점에서 재해석한 쇼펜하우어의 철학적 지혜','img/c12.jpg','https://search.shopping.naver.com/book/catalog/42305597619?query=%EB%A7%88%ED%9D%9C%EC%97%90%EC%9D%BD%EB%8A%94%EC%87%BC%ED%8E%9C%ED%95%98%EC%9A%B0%EC%96%B4&NaPm=ct%3Dmcvb0edc%7Cci%3D530b70dc3ef97df91bd12182084b08edc2546d66%7Ctr%3Dboksl%7Csn%3D95694%7Chk%3D79e5a09e8b1de78a099391366da996a71fb2e104','철학'),(114,NULL,'소피의 세계','요슈타인 가아더',NULL,NULL,'소설로 읽는 철학','img/c13.jpg','https://search.shopping.naver.com/book/catalog/32490720633?query=%EC%86%8C%ED%94%BC%EC%9D%98%20%EC%84%B8%EA%B3%84&NaPm=ct%3Dmcvb0oeg%7Cci%3Db0ab9920a5509762a6f06022284e0a55a6bcc170%7Ctr%3Dboksl%7Csn%3D95694%7Chk%3Dcd76a61488c0d9e762eca7610bc3804239e79097','철학'),(115,NULL,'시지프 신화','알베르 카뮈',NULL,NULL,'부조리한 삶에 대한 실존주의적 성찰','img/c14.jpg','https://search.shopping.naver.com/book/catalog/32473323658?query=%EC%8B%9C%EC%A7%80%ED%94%84%20%EC%8B%A0%ED%99%94&NaPm=ct%3Dmcvb0zz4%7Cci%3Dd890b6a8858a491163fe83bb99653f33b8108c00%7Ctr%3Dboksl%7Csn%3D95694%7Chk%3Dda137bec05a939bf8598de27846d065724b7f9ac','철학'),(116,NULL,'철학은 어떻게 삶의 무기가 되는가','야마구치 슈',NULL,NULL,'실용적인 관점에서 철학을 해석','img/c15.jpg','https://search.shopping.naver.com/book/catalog/32456306648?query=%EC%B2%A0%ED%95%84%EC%9D%80%20%EC%96%B4%EB%96%BB%EA%B2%8C%20%EC%82%B6%EC%9D%98%20%EB%AC%B4%EA%B8%B0%EA%B0%80%20%EB%90%98%EB%8A%94%EA%B0%80&NaPm=ct%3Dmcvb1as0%7Cci%3De938981105353938f3391e997fb2d7da409ceade%7Ctr%3Dboksl%7Csn%3D95694%7Chk%3D48e11f35c09d810cdd2bffc076dad1da5430448d','철학'),(117,NULL,'모든 것이 되는 법','에밀리 와프닉',NULL,NULL,'다양한 관심사를 가진 현대인을 위한 삶의 철학','img/c16.jpg','https://search.shopping.naver.com/book/catalog/32441030298?query=%EB%AA%A8%EB%93%A0%20%EA%B2%83%EC%9D%B4%20%EB%90%98%EB%8A%94%20%EB%B2%95&NaPm=ct%3Dmcvb1j9k%7Cci%3Da615955d9aaf293cc865c8f04dbfb24748f98ac1%7Ctr%3Dboksl%7Csn%3D95694%7Chk%3Dcc1a85839daddde4e6e49a75d8053e7703ee1236','철학'),(118,NULL,'깨진 틈이 있어야 그 사이로 빛이 들어온다','니체',NULL,NULL,'고통과 상처를 통해 찾는 삶의 의미와 희망','img/c17.jpg','https://search.shopping.naver.com/book/catalog/46032325620?query=%EA%B9%A8%EC%A7%84%20%ED%8B%88%EC%9D%B4%20%EC%9E%88%EC%96%B4%EC%95%BC&NaPm=ct%3Dmcvb1siw%7Cci%3D89c4ace8e93177ca13ec34de946aaaec06977080%7Ctr%3Dboksl%7Csn%3D95694%7Chk%3Dfb27ea4796a602db8c94fd86979af92ed0e2d5b8','철학'),(119,NULL,'나를 아프게 한 말들이 모두 진실은 아니었다','마르쿠스 아우렐리우스',NULL,NULL,'스토아 철학을 통한 마음의 평정과 내적 성장','img/c18.jpg','https://search.shopping.naver.com/book/catalog/54724585242?query=%EB%82%98%EB%A5%BC%20%EC%95%84%ED%94%84%EA%B2%8C%20%ED%95%9C%20%EB%A7%90%EC%9D%80&NaPm=ct%3Dmcvb1zgw%7Cci%3Dd9888c512a052f5fd79c7419f2c5629b46547147%7Ctr%3Dboksl%7Csn%3D95694%7Chk%3D0238098954ec60bda4c765af55df5334634ae274','철학'),(120,NULL,'왜 당신은 다른 사람을 위해 살고 있는가','고윤',NULL,NULL,'진정한 자아와 독립적인 삶에 대한 철학적 탐구','img/c19.jpg','https://search.shopping.naver.com/book/catalog/46430404619?query=%EC%99%9C%20%EB%8B%B9%EC%8B%A0%EC%9D%80%20%EB%8B%A4%EB%A5%B8%20%EC%82%AC%EB%9E%8C%EC%9D%84&NaPm=ct%3Dmcvb27yg%7Cci%3Dc9437e6d85bfb9ff37b89380a55be0b9fd9643a5%7Ctr%3Dboksl%7Csn%3D95694%7Chk%3D622da139afffa08c28fe3e76195da55805b5d113','철학'),(121,NULL,'캐드','시튼스 스케치',NULL,NULL,'정교한 설계 프로그램 \'캐드\'를 다루는 건축 디자이너들의 치열한 세계를 그린 소설. 복잡한 도면처럼 얽힌 인물들의 관계와 꿈, 그리고 사랑 속에서 각자의 이상적인 공간과 삶을 구축해나가는 과정을 섬세하게 담아냈다.','img/추천1.jpg','https://search.shopping.naver.com/book/catalog/55283479358?cat_id=50005754&frm=PBOKMOD&query=%EA%B6%A4%EB%8F%84+%EC%B1%85&NaPm=ct%3Dmcu73ndk%7Cci%3Dbb6593432c0957c6fe92b57ac2d4fefff4976b09%7Ctr%3Dboknx%7Csn%3D95694%7Chk%3D30c230fd815215174a368650d1652d3033a631da','시/소설'),(122,NULL,'하늘과 바람과 별과 시','윤동주',NULL,NULL,'한국 근대시의 정수','img/tl1.jpg','https://search.shopping.naver.com/book/catalog/32463733922?query=%EC%9C%A4%EB%8F%99%EC%A3%BC%2C%20%ED%95%98%EB%8A%98%EA%B3%BC%20%EB%B0%94%EB%9E%8C%EA%B3%BC%20%EB%B3%84%EA%B3%BC%20%EC%8B%9C&NaPm=ct%3Dmcu86sbs%7Cci%3D0b201b2f1ee8b755148c272297406e5f53b79831%7Ctr%3Dboksl%7Csn%3D95694%7Chk%3D521fda1db9a9c45ad8bbf93f027adb476800f668','시/소설'),(123,NULL,'진달래꽃','김소월',NULL,NULL,'한국 서정시의 대표작','img/tl2.jpg','https://search.shopping.naver.com/book/catalog/54546391727?query=%EC%A7%84%EB%8B%AC%EB%9E%98%EA%BD%83&NaPm=ct%3Dmcu87k3s%7Cci%3D98f5bb26f4fb4aac39f92a1fde7d410a564b4386%7Ctr%3Dboksl%7Csn%3D95694%7Chk%3D84e3f197210529dd657d0cf773ced25f72cfef46','시/소설'),(124,NULL,'꽃','김춘수',NULL,NULL,'존재론적 탐구를 담은 대표 시집','img/tl3.jpg','https://search.shopping.naver.com/book/catalog/32466876665?query=%EA%BD%83%20%EA%B9%80%EC%B6%98%EC%88%98&NaPm=ct%3Dmcu88bvs%7Cci%3D36b3356ec5616ca27e758267c0be3b7ebacc25f4%7Ctr%3Dboksl%7Csn%3D95694%7Chk%3Db0f973e6ab5ac4e2bc740da31be566b8115ce975','시/소설'),(125,NULL,'님의 침묵','한용운',NULL,NULL,'독립과 사랑을 노래한 민족시','img/tl4.jpg','https://search.shopping.naver.com/book/catalog/47639297631?query=%EB%8B%98%EC%9D%98%20%EC%B9%A8%EB%AC%B5&NaPm=ct%3Dmcu88v68%7Cci%3Dc9654931ed63ce8a45e813838250bfce2f4a727b%7Ctr%3Dboksl%7Csn%3D95694%7Chk%3D39d33a2b9ce8a56dff09000c7ecc37d1b6910a15','시/소설'),(126,NULL,'별 헤는 밤','윤동주',NULL,NULL,'서정성과 저항 정신의 조화','img/tl5.jpg','https://search.shopping.naver.com/book/catalog/32438215646?cat_id=50005587&frm=PBOKMOD&query=%EB%B3%84+%ED%97%A4%EB%8A%94+%EB%B0%A4+%EC%9C%A4%EB%8F%99%EC%A3%BC','시/소설'),(127,NULL,'서랍에 저녁을 넣어 두었다','한강',NULL,NULL,'일상의 소중함을 시적으로 담아낸 감성적 에세이','img/tl6.jpg','https://search.shopping.naver.com/book/catalog/55401590140?query=%EB%B3%84%20%ED%97%A4%EB%8A%94%20%EB%B0%A4&NaPm=ct%3Dmcu898ag%7Cci%3D19eb4669abf28bb2b51b1d8df79d18f03697e7af%7Ctr%3Dboksl%7Csn%3D95694%7Chk%3D3e07160217814a77bd6adc8d7912dc386cfd2d1b','시/소설'),(128,NULL,'풀꽃','나태주',NULL,NULL,'짧지만 깊은 울림을 주는 현대시','img/tl7.jpg','https://search.shopping.naver.com/book/catalog/32466957130?query=%ED%92%80%EA%BD%83&NaPm=ct%3Dmcu8a1m0%7Cci%3D81bd91e62c7c7dcf1bcba153534b2a7414dcb024%7Ctr%3Dboksl%7Csn%3D95694%7Chk%3D04d2a1b1faf7fbaf5b8f63344eb53c571055b3e1','시/소설'),(129,NULL,'사랑하라 한번도 상처받지 않은 것처럼','류시화 엮음',NULL,NULL,'대중에게 사랑받는 외국 시 모음','img/tl8.jpg','https://search.shopping.naver.com/book/catalog/32467019677?query=%EC%82%AC%EB%9E%91%ED%95%98%EB%9D%BC%20%ED%95%9C%20%EB%B2%88%EB%8F%84&NaPm=ct%3Dmcu8ahtc%7Cci%3D1fe856b0792789565b3e1fa46c3f0c62a362ec0b%7Ctr%3Dboksl%7Csn%3D95694%7Chk%3D57e76d25d2ee49bc6560933d44a188b81fc4cbf8','시/소설'),(130,NULL,'슬픔이 기쁨에게','정호승',NULL,NULL,'현실 비판과 따뜻한 시선','img/tl9.jpg','https://search.shopping.naver.com/book/catalog/32485499679?query=%EC%8A%AC%ED%94%94%EC%9D%B4%20%EA%B8%B0%EC%81%A8%EC%97%90%EA%B2%8C&NaPm=ct%3Dmcu8auxk%7Cci%3Db319d6951b20de091a36ab7145805e1ec90370bd%7Ctr%3Dboksl%7Csn%3D95694%7Chk%3D47483bdd4a9277b325ded48e89c346d5b36a68a5','시/소설'),(131,NULL,'입속의 검은 잎','기형도',NULL,NULL,'도시인의 불안과 절망을 담은 대표작','img/tl10.jpg','https://search.shopping.naver.com/book/catalog/32483636914?query=%EC%9E%85%EC%86%8D%EC%9D%98%20%EA%B2%80%EC%9D%80%20%EC%9E%85&NaPm=ct%3Dmcu8be80%7Cci%3D7ffbb2ffe244550a91d57d5d0eac8fe71cbee3b4%7Ctr%3Dboksl%7Csn%3D95694%7Chk%3D012b1a13e506ae8eb5f86b2812c4525745c65414','시/소설'),(132,NULL,'서시','윤동주',NULL,NULL,'시대의 아픔을 노래한 대표 서시','img/tl11.jpg','https://www.aladin.co.kr/shop/wproduct.aspx?ISBN=E002535323&start=pnaverebook','시/소설'),(133,NULL,'나와 나타샤와 흰 당나귀','백석',NULL,NULL,'토속적이고 향토적인 언어','img/tl12.jpg','https://search.shopping.naver.com/book/catalog/32503753847?query=%EB%82%98%EC%99%80%20%EB%82%98%ED%83%80%EC%83%A4%EC%99%80%20%ED%9D%B0%20%EB%8B%B9%EB%82%98%EA%B7%80&NaPm=ct%3Dmcu8elyo%7Cci%3D113440d25100a6cd0085f6624e6552d5da871e96%7Ctr%3Dboksl%7Csn%3D95694%7Chk%3Dd40d88ce2a9446810a8e9f5aa2606e30a7bec69c','시/소설'),(134,NULL,'혼모노','성해나',NULL,NULL,'현대 사회의 허위와 진실을 탐구하는 예리한 통찰','img/tl13.jpg','https://search.shopping.naver.com/book/catalog/53688114534?query=%ED%98%BC%EB%AA%A8%EB%85%B8&NaPm=ct%3Dmcu8eyb4%7Cci%3Dc35f544c863c396e178a97de6d90e9c1f1b6616f%7Ctr%3Dboksl%7Csn%3D95694%7Chk%3D7bcf34d126b808fab7dee86d832e3f995ec2696a','시/소설'),(135,NULL,'소년이 온다','한강',NULL,NULL,'5·18 광주를 배경으로 한 역사의 아픔과 인간성 탐구','img/tl14.jpg','https://search.shopping.naver.com/book/catalog/32491401626?query=%EC%86%8C%EB%85%84%EC%9D%B4%20%EC%98%A8%EB%8B%A4&NaPm=ct%3Dmcu8f7kg%7Cci%3Dcf3e900ab3de60f99efdcefcce42765f67381b17%7Ctr%3Dboksl%7Csn%3D95694%7Chk%3Ddeeef330fea457cfa641f1ccf1e1b507e2f2147e','시/소설'),(136,NULL,'급류','정대건',NULL,NULL,'격동하는 시대 속 인간의 삶과 의지를 그린 힘 있는 소설','img/tl15.jpg','https://search.shopping.naver.com/book/catalog/36801578630?query=%EA%B8%89%EB%A5%98&NaPm=ct%3Dmcu8fg20%7Cci%3D3ad1a4e4dbd70dc47540dbc16c0fd029fed32f7d%7Ctr%3Dboksl%7Csn%3D95694%7Chk%3D765152e955dd021174e81218a9e920968dd51145','시/소설'),(137,NULL,'채식주의자','한강',NULL,NULL,'여성의 의식과 해방을 그린 충격적이고 강렬한 작품','img/tl16.jpg','https://search.shopping.naver.com/book/catalog/32482041666?query=%EC%B1%84%EC%8B%9D%EC%A3%BC%EC%9D%98%EC%9E%90&NaPm=ct%3Dmcu8fpbc%7Cci%3D7a760c6ab456e96150acdfd84b2010a01526f045%7Ctr%3Dboksl%7Csn%3D95694%7Chk%3D6a3d887e1dc1453859db0a2c86ce90f8c57893c4','시/소설'),(138,NULL,'작별하지 않는다','한강',NULL,NULL,'이별과 기억, 존재에 대한 철학적 성찰이 담긴 시적 소설','img/tl17.jpg','https://search.shopping.naver.com/book/catalog/32436366634?query=%EC%9E%91%EB%B3%84%ED%95%98%EC%A7%80%20%EC%95%8A%EB%8A%94%EB%8B%A4&NaPm=ct%3Dmcu8fxsw%7Cci%3D304c1edc0baea0a2ec2de55a7a3685fe3f264871%7Ctr%3Dboksl%7Csn%3D95694%7Chk%3Dd006a111d798c8b14bad596b815dc17b9e812a36','시/소설'),(139,NULL,'외눈박이 물고기의 사랑','류시화',NULL,NULL,'결핍 속에서도 사랑과 이해를 찾아가는 에세이.','img/tl18.jpg','https://search.shopping.naver.com/book/catalog/32466557894?query=%EC%99%B8%EB%88%88%EB%B0%95%EC%9D%B4%20%EB%AC%BC%EA%B3%A0%EA%B8%B0&NaPm=ct%3Dmcu8g9dk%7Cci%3D662c7e19493954b5f593b254c6475bb8856127a0%7Ctr%3Dboksl%7Csn%3D95694%7Chk%3Dbc70a5dd10527ca20a949dcd253b1fa893f68e1f','시/소설'),(140,NULL,'내가 사랑하는 사람','정호승',NULL,NULL,'사랑과 존재의 의미','img/tl20.jpg','https://search.shopping.naver.com/book/catalog/32466974725?query=%EB%82%B4%EA%B0%80%20%EC%82%AC%EB%9E%91%ED%95%98%EB%8A%94%20%EC%82%AC%EB%9E%8C&NaPm=ct%3Dmcu8glq0%7Cci%3Dec8daf1474f3dc318a0475df920c4086acaa9fe6%7Ctr%3Dboksl%7Csn%3D95694%7Chk%3De78ed1b41e4a46813c8d33c7fd0465c92955cd9c','시/소설'),(141,NULL,'흰','한강',NULL,NULL,'색깔과 기억을 통해 삶과 죽음을 탐구하는 서정적 산문','img/tl21.jpg','https://search.shopping.naver.com/book/catalog/53686290980?query=%ED%9D%B0&NaPm=ct%3Dmcu8gtfs%7Cci%3D1a853d7382a9a090790d8b305d41166eaac2c51d%7Ctr%3Dboksl%7Csn%3D95694%7Chk%3D42d0353d1e49315652138dc8da823e6e8935d5ed','시/소설'),(142,NULL,'듄','프랭크 허버트',NULL,NULL,'20세기 영미 SF계의 거장인 프랭크 허버트가 죽을 때까지 작업한 이 연대기는 제1부 듄Dune(1965), 제2부 듄, 메시아Dune, Messiah(1969), 제3부 듄의 후예들Children of Dune(1976), 제4부 듄의 신황제God Emperor of Dune(1981), 제5부 듄의 이단자들Heretics of Dune(1984), 제6부 듄의 신전Chapterhouse: Dune(1985) 총6부작으로 이루어져 있으며 우주 시대 3만 년의 인류 역사가 담겨 있다. 『듄』은 공상 과학 소설이라는 장르 문학에 속하면서도 화려한 주인공들과 플롯의 탄탄함에 힘입어 이례적으로 출간 이후 현재까지 1200만 부 이상이 팔렸다. 프랭크 허버트가 6년 간의 자료 조사 끝에 착수한 사막의 행성, 듄이라는 인류 미래의 세계를 그리는 작업은 그의 아들 브라이언 허버트가 이어받아 지금도 계속되고 있다.','img/s4.jpg','https://search.shopping.naver.com/book/catalog/32472972895?query=%EB%93%84&NaPm=ct%3Dmcvbbngo%7Cci%3Da188d28f2bae158494d0e16a43aa742d09494f3a%7Ctr%3Dboksl%7Csn%3D95694%7Chk%3Df0b13e4863c1fa454967242c73261b80dc3b4fd9','SF/판타지'),(143,NULL,'반지의 제왕 1','J.R.R. 톨킨',NULL,NULL,'판타지 장르의 절대적 고전 1','img/s1.jpg','https://search.shopping.naver.com/book/catalog/32439721312?query=%EB%B0%98%EC%A7%80%EC%9D%98%20%EC%A0%9C%EC%99%95&NaPm=ct%3Dmcvbe1vs%7Cci%3D5dd760201f539cff6ce0f1e373d951d3195c9997%7Ctr%3Dboksl%7Csn%3D95694%7Chk%3D7183ec30f4cf2ff5d78a8363a5eb3a0a3e7f958c','SF/판타지'),(144,NULL,'반지의 제왕 2','J.R.R. 톨킨',NULL,NULL,'판타지 장르의 절대적 고전 2','img/s2.jpg','https://search.shopping.naver.com/book/catalog/32444848610?query=%EB%B0%98%EC%A7%80%EC%9D%98%20%EC%A0%9C%EC%99%95&NaPm=ct%3Dmcvbe9lk%7Cci%3D630bce1b27562f82fdcc57ebd88170eb8175985b%7Ctr%3Dboksl%7Csn%3D95694%7Chk%3D06f21ea5f5c942e28e9893fa5549dc076d4c9dfd','SF/판타지'),(145,NULL,'파운데이션','아이작 아시모프',NULL,NULL,'SF의 바이블이자 우주 오페라의 대명사','img/s3.jpg','https://search.shopping.naver.com/book/catalog/32492175982?query=%ED%8C%8C%EC%9A%B4%EB%8D%B0%EC%9D%B4%EC%85%98&NaPm=ct%3Dmcvbel68%7Cci%3D42dfd17793f5503984136ba6ecbbf3dbaa22ac8c%7Ctr%3Dboksl%7Csn%3D95694%7Chk%3D9276a055236bbab018445381f8d31d512601a238','SF/판타지'),(146,NULL,'듄','프랭크 허버트',NULL,NULL,'생태, 종교, 정치 등 깊이 있는 세계관의 SF 걸작','img/s4.jpg','https://search.shopping.naver.com/book/catalog/32472972895?query=%EB%93%84&NaPm=ct%3Dmcvbbngo%7Cci%3Da188d28f2bae158494d0e16a43aa742d09494f3a%7Ctr%3Dboksl%7Csn%3D95694%7Chk%3Df0b13e4863c1fa454967242c73261b80dc3b4fd9','SF/판타지'),(147,NULL,'어스시의 마법사','어슐러 르 귄',NULL,NULL,'판타지 문학에 깊이를 더한 작품','img/s5.jpg','https://search.shopping.naver.com/book/catalog/32436270284?query=%EC%96%B4%EC%8A%A4%EC%8B%9C%EC%9D%98%20%EB%A7%88%EB%B2%95%EC%82%AC&NaPm=ct%3Dmcvbfpao%7Cci%3Dfcf8509aa4cefacb3488304e9f534bb6dfb9797d%7Ctr%3Dboksl%7Csn%3D95694%7Chk%3Df595d3fcfc516da938ce96ec60634b5e6b7a4d6e','SF/판타지'),(148,NULL,'1984','조지 오웰',NULL,NULL,'디스토피아 SF의 경전','img/s6.jpg','https://search.shopping.naver.com/book/catalog/32486053981?query=1984&NaPm=ct%3Dmcvbfw8o%7Cci%3D31677635905914ddada1fdc6b8ea3b32ebcd1b1d%7Ctr%3Dboksl%7Csn%3D95694%7Chk%3Dd9dd9d0cc6ce17526287584db79bbf294ca8918a','SF/판타지'),(149,NULL,'멋진 신세계','올더스 헉슬리',NULL,NULL,'기술 발전이 가져온 비극적 미래 예언','img/s7.jpg','https://search.shopping.naver.com/book/catalog/32482025744?query=%EB%A9%8B%EC%A7%84%20%EC%8B%A0%EC%84%B8%EA%B3%84&NaPm=ct%3Dmcvbg5i0%7Cci%3D018009bef6fc9d5a21b9c61a2b933904155c5f97%7Ctr%3Dboksl%7Csn%3D95694%7Chk%3D643b0b184b748a7f1f6b2cded4615847e3e2798d','SF/판타지'),(150,NULL,'해리 포터 시리즈','J.K. 롤링',NULL,NULL,'현대 판타지의 문화 아이콘','img/s8.jpg','https://search.shopping.naver.com/book/catalog/51907198618?query=%ED%95%B4%EB%A6%AC%ED%8F%AC%ED%84%B0%20%EC%8B%9C%EB%A6%AC%EC%A6%88&NaPm=ct%3Dmcvbh480%7Cci%3D62db35d2c2382b475404c4c46e164325c21cdbbc%7Ctr%3Dboksl%7Csn%3D95694%7Chk%3Da470457cb584addc9d112114ce477211040629c2','SF/판타지'),(151,NULL,'우리가 빛의 속도로 갈 수 없다면','김초엽',NULL,NULL,'한국 SF의 새로운 가능성을 보여준 단편집','img/s9.jpg','https://search.shopping.naver.com/book/catalog/32436342677?query=%EC%9A%B0%EB%A6%AC%EA%B0%80%20%EB%B9%9B%EC%9D%98%20%EC%86%8D%EB%8F%84%EB%A1%9C%20%EA%B0%88%20%EC%88%98%20%EC%97%86%EB%8B%A4%EB%A9%B4&NaPm=ct%3Dmcvbhcpk%7Cci%3Df033d66b09aa4df5771a0109eb7dc717ce66a7d9%7Ctr%3Dboksl%7Csn%3D95694%7Chk%3De3ef64962388aafe01b594af36face283a4258f8','SF/판타지'),(152,NULL,'지구 끝의 온실','김초엽',NULL,NULL,'기후 변화와 인류의 미래를 다룬 장편 SF','img/s10.jpg','https://search.shopping.naver.com/book/catalog/32475579086?query=%EC%A7%80%EA%B5%AC%20%EB%81%9D%EC%9D%98%20%EC%98%A8%EC%8B%A4&NaPm=ct%3Dmcvbhl74%7Cci%3D743c8aa8e6c7f08384f0e4f680735c4e4dd2a2ba%7Ctr%3Dboksl%7Csn%3D95694%7Chk%3Daf1368280ff9abbed5b87b73821f4fb616e3fab9','SF/판타지'),(153,NULL,'은하수를 여행하는 히치하이커를 위한 안내서','더글러스 애덤스',NULL,NULL,'유머러스하고 기발한 우주 여행 SF 코미디','img/s11.jpg','https://search.shopping.naver.com/book/catalog/32474633768?query=%EC%9D%80%ED%95%98%EC%88%98%EB%A5%BC%20%EC%97%AC%ED%96%89%ED%95%98%EB%8A%94&NaPm=ct%3Dmcvbhz34%7Cci%3Dce657694c34bcf03a38938520cecb42a0ce0197e%7Ctr%3Dboksl%7Csn%3D95694%7Chk%3D1610a082f4c7437179f83f1df2120323a24fcc74','SF/판타지'),(154,NULL,'파리대왕','윌리엄 골딩',NULL,NULL,'문명과 야만성에 대한 깊이 있는 탐구','img/s12.jpg','https://search.shopping.naver.com/book/catalog/32463599839?query=%ED%8C%8C%EB%A6%AC%EB%8C%80%EC%99%95&NaPm=ct%3Dmcvbi7ko%7Cci%3Dab4f210d7fd5dffc3d29e6751be4e6a1abec5777%7Ctr%3Dboksl%7Csn%3D95694%7Chk%3Dc1602ce647c7720af4cb49f57a0c97ecd087545f','SF/판타지'),(155,NULL,'사이보그가 되다','김초엽, 김원영',NULL,NULL,'기술과 인간의 경계에 대한 현대적 성찰','img/s13.jpg','https://search.shopping.naver.com/book/catalog/32474035096?query=%EC%82%AC%EC%9D%B4%EB%B3%B4%EA%B7%B8%EA%B0%80%20%EB%90%98%EB%8B%A4&NaPm=ct%3Dmcvbigu0%7Cci%3D2d785c1f6b9d0dd72806d2ef829c11ccb4c03afc%7Ctr%3Dboksl%7Csn%3D95694%7Chk%3De83aa4edcc60fc86327fb717e0bc16440782855f','SF/판타지'),(156,NULL,'스페이스 오디세이','아서 C. 클라크',NULL,NULL,'인류의 기원과 진화를 탐구한 SF','img/s14.jpg','https://search.shopping.naver.com/book/catalog/32463430774?query=%EC%8A%A4%ED%8E%98%EC%9D%B4%EC%8A%A4%20%EC%98%A4%EB%94%94%EC%84%B8%EC%9D%B4&NaPm=ct%3Dmcvbiuq0%7Cci%3Dea9987774a027821c9d8310a0f2d03d8425fda39%7Ctr%3Dboksl%7Csn%3D95694%7Chk%3Dbd5ed0b5e7d60434ed1ccbc791054cccd4c4d6d0','SF/판타지'),(157,NULL,'백만 광년의 고독 속에서 한 줄의 시를 읽다','류시화',NULL,NULL,'우주적 스케일에서 바라본 인간 존재의 의미','img/s15.jpg','https://search.shopping.naver.com/book/catalog/32482671630?query=%EB%B0%B1%EB%A7%8C%EA%B4%91%EB%85%84%EC%9D%98%20%EA%B3%A0%EB%8F%85&NaPm=ct%3Dmcvbj5iw%7Cci%3D2994f618f1daff931de08777c007edcaeec83dcf%7Ctr%3Dboksl%7Csn%3D95694%7Chk%3Db5b9872894948db9afa3fc7b17ddcc673789345a','SF/판타지'),(158,NULL,'나는 전설이다','리처드 매드슨',NULL,NULL,'포스트 아포칼립스 장르의 원형','img/s16.jpg','https://search.shopping.naver.com/book/catalog/32463133625?query=%EB%82%98%EB%8A%94%20%EC%A0%84%EC%84%A4%EC%9D%B4%EB%8B%A4&NaPm=ct%3Dmcvbjcgw%7Cci%3D4312e1215b866298b9a7494a5012a26c414e7472%7Ctr%3Dboksl%7Csn%3D95694%7Chk%3Dbfc9e506355773814d6bad878c0133c33ce32aff','SF/판타지'),(159,NULL,'호밀밭의 파수꾼','J.D. 샐린저',NULL,NULL,'청소년 성장 소설의 고전','img/s17.jpg','https://search.shopping.naver.com/book/catalog/32474243888?query=%ED%98%B8%EB%B0%80%EB%B0%AD%EC%9D%98%20%ED%8C%8C%EC%88%97%EA%B7%B8%EB%82%98&NaPm=ct%3Dmcvbjotc%7Cci%3Dd1e277f59afb1904cac7f19e2902464d67a29256%7Ctr%3Dboksl%7Csn%3D95694%7Chk%3D26aafbdff8a6f7f1da166ca223f4c6000fc2f688','SF/판타지'),(160,NULL,'시녀 이야기','마거릿 애트우드',NULL,NULL,'페미니즘 디스토피아 소설','img/s18.jpg','https://search.shopping.naver.com/book/catalog/32530942121?query=%EC%8B%9C%EB%85%80%20%EC%9D%B4%EC%95%BC%EA%B8%B0&NaPm=ct%3Dmcvbk2pc%7Cci%3D1d667de7ee54680ca883409537652c90e8f915b1%7Ctr%3Dboksl%7Csn%3D95694%7Chk%3D7448154e97fae4886ba08664058a9a5ce92c6b7f','SF/판타지'),(161,NULL,'장미의 이름','움베르토 에코',NULL,NULL,'중세 수도원을 배경으로 한 지적 추리 소설','img/s19.jpg','https://search.shopping.naver.com/book/catalog/32477587844?query=%EC%9E%A5%EB%AF%B8%EC%9D%98%20%EC%9D%B4%EB%A6%84&NaPm=ct%3Dmcvbkf1s%7Cci%3Dd3204571fc22947684a0509fcaee25c57b4bdf08%7Ctr%3Dboksl%7Csn%3D95694%7Chk%3D516107e1858c2cd0baece016499d26b56cdfe26d','SF/판타지'),(162,NULL,'설국열차','자크 로브',NULL,NULL,'계급 사회를 풍자한 포스트 아포칼립스','img/s20.jpg','https://search.shopping.naver.com/book/catalog/32497866836?query=%EC%84%A4%EA%B5%AD%EC%97%B4%EC%B0%A8&NaPm=ct%3Dmcvbklzs%7Cci%3Dd7f69c4ca557890797b04ffb8b5abc2d7392413f%7Ctr%3Dboksl%7Csn%3D95694%7Chk%3D1a5047039a9fe33853ecd4fd4c5916ee7ede8196','SF/판타지'),(163,NULL,'관촌수필','이문구','문학과지성사','2018-09-03','우리 문학 토양을 단단하고 풍요롭게 다져온 작품을 만나다.','./img/celeb/parkchanwook_book01.jpg','https://product.kyobobook.co.kr/detail/S000000570374','박찬욱'),(164,NULL,'괴물들','클레어 데더러','을유문화사','2024-09-30','위대한 걸작을 탄생시킨 괴물 예술가를 어떻게 마주할 것인가?','./img/celeb/parkchanwook_book02.jpg','https://product.kyobobook.co.kr/detail/S000214356477','박찬욱'),(165,NULL,'브라이턴 록','그레이엄 그린','현대문학','2021-04-23','악의 본성을 탐구한 걸작 미스터리','./img/celeb/parkchanwook_book03.jpg','https://product.kyobobook.co.kr/detail/S000001945339','박찬욱'),(166,NULL,'오너러블 스쿨보이','존 르카레','열린책들','2022-07-20','사상 최고 첩보 시리즈 카를라 3부작의 두 번째 작품 출간','./img/celeb/parkchanwook_book04.jpg','https://product.kyobobook.co.kr/detail/S000061448966','박찬욱'),(167,NULL,'이민자들','W. G. 제발트','창비','2018-03-22','제발트 탄생 75주년 기념 개정판 출간','./img/celeb/parkchanwook_book05.jpg','https://product.kyobobook.co.kr/detail/S000000612803','박찬욱'),(168,NULL,'정확한 사랑의 실험','신형철','마음산책','2014-10-01','이야기 속에 숨어 있는 인간의 비밀을 ‘정확한 문장’으로 말한다!','./img/celeb/parkchanwook_book06.jpg','https://product.kyobobook.co.kr/detail/S000000938887','박찬욱'),(169,NULL,'지속의 순간들','제프 다이어','을유문화사','2022-03-05','사진을 찍지 않는 사진 비평가만의 새롭고 독특한 시선','./img/celeb/parkchanwook_book07.jpg','https://product.kyobobook.co.kr/detail/S000000576590','박찬욱'),(170,NULL,'창백한 언덕 풍경','가즈오 이시구로','민음사','2012-11-30','흐릿한 기억 속에서 재생되는 과거의 상처!','./img/celeb/parkchanwook_book08.jpg','https://product.kyobobook.co.kr/detail/S000000621324','박찬욱'),(171,NULL,'제이콥의 방','버지니아 울프','솔','2019-05-15','버지니아 울프의 방대한 문학세계를 완성하다.','./img/celeb/iu_book01.jpg','https://product.kyobobook.co.kr/detail/S000001789142','아이유'),(172,NULL,'최선의 삶','임솔아','문학동네','2024-06-14','상처의 크기는 나이에 비례하지 않는다.','./img/celeb/iu_book02.jpg','https://product.kyobobook.co.kr/detail/S000213561796','아이유'),(173,NULL,'참을 수 없는 존재의 가벼움','밀란 쿤데라','민음사','2018-06-20','특별한 동시에 잊을 수 없는 어떤 사랑 이야기!','./img/celeb/iu_book03.jpg','https://product.kyobobook.co.kr/detail/S000000619722','아이유'),(174,NULL,'왜 나는 너를 사랑하는가','알랭 드 보통','창미래','2022-11-10','연애가 사랑이 되는 순간, 우연이 사랑이 되는 순간의 비밀','./img/celeb/iu_book04.jpg','https://product.kyobobook.co.kr/detail/S000200205332','아이유'),(175,NULL,'인간 실격','다자이 오사무','민음사','2012-04-10','청춘의 한 시기를 통과 의례처럼 거쳐야 하는 일본 데카당스 문학의 대표작','./img/celeb/iu_book05.jpg','https://product.kyobobook.co.kr/detail/S000000620240','아이유'),(176,NULL,'희한한 위로','강세형','수오서재','2020-07-20','위로는 정말 그런 걸지도 모른다 엉뚱하고 희한한 곳에서 찾아오는 것','./img/celeb/iu_book06.jpg','https://product.kyobobook.co.kr/detail/S000001939518','아이유'),(177,NULL,'슬픔의 위안','론 마라스코, 브라이언 셔프','현암사','2019-03-15','슬픔의 발생과 과정, 회복과 흔적을 어루만지는 따스한 성찰의 에세이','./img/celeb/iu_book07.jpg','https://product.kyobobook.co.kr/detail/S000000574960','아이유'),(178,NULL,'최선은 그런 것이에요','이규리','문학동네','2014-05-10','지상의 존재들이 빚어내는 삶의 비의에 응답하는 따뜻한 시선','./img/celeb/munsanghoon_book01.jpg','https://product.kyobobook.co.kr/detail/S000000778987','문상훈'),(179,NULL,'서른, 잔치는 끝났다','최영미','이미','2020-09-15','시대의 아픔과 상처를 위로하는 사랑','./img/celeb/munsanghoon_book02.jpg','https://product.kyobobook.co.kr/detail/S000001979711','문상훈'),(180,NULL,'황금빛 모서리','김중식','문학과지성사','1993-05-01','짧은 글귀 안에 담긴 심오한 뜻.','./img/celeb/munsanghoon_book03.jpg','https://product.kyobobook.co.kr/detail/S000000568234','문상훈'),(181,NULL,'바다는 잘 있습니다','이병률','문학과지성사','2017-09-20','숱한 낙담 끝에 오는 다짐들,그럴 수밖에 없는 최종의 마음들','./img/celeb/munsanghoon_book04.jpg','https://product.kyobobook.co.kr/detail/S000000570297','문상훈'),(182,NULL,'그 여름의 끝','이성복','문학과지성사','1990-06-01','나와 타자에 대한 진정성의 사랑','./img/celeb/munsanghoon_book05.jpg','https://product.kyobobook.co.kr/detail/S000000568113','문상훈'),(183,NULL,'수학자의 아침','김소연','문학과지성사','2013-11-11','정지한 사물들의 고요한 그림자를 둘러보는 시간','./img/celeb/munsanghoon_book06.jpg','https://product.kyobobook.co.kr/detail/S000000569961','문상훈'),(184,NULL,'지금 여기가 맨 앞','이문재','문학동네','2014-05-20','기도하듯 주문 외듯 신탁을 전하듯 씌어진 잠언 지향의 시편들','./img/celeb/munsanghoon_book07.jpg','https://product.kyobobook.co.kr/detail/S000000778919','문상훈'),(185,NULL,'이기적 유전자','리처드 도킨스','을유문화사','2023-01-30','과학을 넘어선 우리 시대의 고전','./img/celeb/faker_book01.jpg','https://product.kyobobook.co.kr/detail/S000000576524','페이커'),(186,NULL,'우리는 왜 잠을 자야 할까','매슈 워커','열린책들','2019-02-25','수면과 꿈의 과학','./img/celeb/faker_book02.jpg','https://product.kyobobook.co.kr/detail/S000000582009','페이커'),(187,NULL,'내가 틀릴 수도 있습니다','밀비욘 나티코 린데블라드','다산초당','2024-01-08','전 세계가 사랑한 어느 다정한 승려의 삶과 지혜','./img/celeb/faker_book03.jpg','https://product.kyobobook.co.kr/detail/S000001687471','페이커'),(188,NULL,'수도자처럼 생각하기','제이 셰티','다산초당','2024-08-14','소진되고 지친 삶을 위한 고요함의 기술','./img/celeb/faker_book04.jpg','https://product.kyobobook.co.kr/detail/S000001687276','페이커'),(189,NULL,'죽음의 수용소에서','빅터 프랭클','청아출판사','2020-05-30','죽음조차 희망으로 승화시킨 인간 존엄성의 승리','./img/celeb/faker_book05.jpg','https://product.kyobobook.co.kr/detail/S000000616949','페이커'),(190,NULL,'사피엔스','유발 하라리','김영사','2023-04-01','인간의 역사와 미래에 대한 가장 논쟁적이고 대담한 대서사','./img/celeb/faker_book06.jpg','https://product.kyobobook.co.kr/detail/S000001939518','페이커'),(191,NULL,'1Q84','무라카미 하루키','문학동네','2009-08-25','무라카미 하루키 문학의 결정판!','./img/celeb/faker_book07.jpg','https://product.kyobobook.co.kr/detail/S000000574960','페이커'),(192,NULL,'월든','헨리 데이빗 소로우','은행나무','2011-08-22','대자연의 예찬과 문명사회에 대한 통렬한 비판이 담긴 불멸의 고전','./img/celeb/faker_book08.jpg','https://product.kyobobook.co.kr/detail/S000000574960','페이커'),(193,NULL,'사물의 뒷모습','안규철','현대문학','2021-03-19','안규철의 내 이야기로 그린 그림, 그 두 번째 이야기','./img/celeb/parkjungmin_book01.jpg','https://product.kyobobook.co.kr/detail/S000001945337','박정민'),(194,NULL,'사유 속의 영화','이윤영','문학과지성사','2011-04-18','영화 이론 선집','./img/celeb/parkjungmin_book02.jpg','https://product.kyobobook.co.kr/detail/S000000569720','박정민'),(195,NULL,'아침 그리고 저녁','욘 포세라','문학동네','2019-07-26','시적이고 음악적인 문체로 묘파하는 인간의 삶과 생존투쟁, 그리고 죽음','./img/celeb/parkjungmin_book03.jpg','https://product.kyobobook.co.kr/detail/S000000780415','박정민'),(196,NULL,'나는 나를 파괴할 권리가 있다','김영하','복복서가','2022-05-23','『나는 나를 파괴할 권리가 있다』 개정판','./img/celeb/parkjungmin_book04.jpg','https://product.kyobobook.co.kr/detail/S000061353843','박정민'),(197,NULL,'혼모노','성해나','창비','2025-03-28','무엇이 진짜이고 무엇이 가짜인가 그 경계에서 ‘혼모노’를 묻다','./img/celeb/parkjungmin_book05.jpg','https://product.kyobobook.co.kr/detail/S000216111714','박정민'),(198,NULL,'죽은 왕녀를 위한 파반느','박민규','위즈덤하우스','2009-07-20','더욱 섬세하고 예리해진 무규칙이종소설가의 리얼 로맨틱 귀환!','./img/celeb/parkjungmin_book06.jpg','https://product.kyobobook.co.kr/detail/S000000887679','박정민'),(199,NULL,'웬만해선 아무렇지 않다','이기호','마음산책','2016-02-25','웃음과 눈물의 절묘함 특별한 짧은 소설','./img/celeb/parkjungmin_book07.jpg','https://product.kyobobook.co.kr/detail/S000000938918','박정민'),(200,NULL,'음악소설집','김애란 , 김연수 , 윤성희 , 은희경 , 편혜영','프란츠','2024-07-01','우리 삶의 장면 속엔 늘 음악이 있었다','./img/celeb/parkjungmin_book08.jpg','https://product.kyobobook.co.kr/detail/S000213662853','박정민'),(201,NULL,'블로노트','타블로','달','2026-09-28','매일 한 줄로 인생을 말하는 블로노트!','./img/celeb/rm_book01.jpg','https://product.kyobobook.co.kr/detail/S000001764060','RM'),(202,NULL,'한입 코끼리','황경신','큐리어스','2014-11-20','생에 대한 성찰이 돋보이는 황경신의 연작 소설!','./img/celeb/rm_book02.jpg','https://ebook-product.kyobobook.co.kr/dig/epd/ebook/E000002994770','RM'),(203,NULL,'모순','양귀자','쓰다','2013-04-01','인생은 살아가면서 탐구하는 것!','./img/celeb/rm_book03.jpg','https://product.kyobobook.co.kr/detail/S000001632467','RM'),(204,NULL,'해변의 카프카','무라카미 하루키','문학사상','2024-06-10','묘한 고독감과 서정성으로 독자들의 시선을 사로잡는다.','./img/celeb/rm_book04.jpg','https://product.kyobobook.co.kr/detail/S000213398973','RM'),(205,NULL,'데미안','헤르만 헤세','민음사','2009-01-20','새는 알에서 나오려고 투쟁한다. 알은 세계이다. 태어나려는 자는 하나의 세계를 깨뜨려야 한다.','./img/celeb/rm_book05.jpg','https://product.kyobobook.co.kr/detail/S000000620240','RM'),(206,NULL,'1984','조지 오웰','민음사','2007-03-30','세계가 나아갈 방향을 제시하는 탁월한 통찰','./img/celeb/rm_book06.jpg','https://product.kyobobook.co.kr/detail/S000000620214','RM'),(207,NULL,'지금 알고 있는 걸 그때도 알았더라면','류시화','열림원','2014-12-03','지역과 시대를 뛰어넘은 고백록과 기도문을 엮은 잠언시집!','./img/celeb/rm_book07.jpg','https://product.kyobobook.co.kr/detail/S000001079757','RM'),(208,NULL,'언어의 무게','파스칼 메르시어','비채','2023-04-03','《리스본행 야간열차》 이후 16년 만의 신작 장편소설','./img/celeb/rm_book08.jpg','https://product.kyobobook.co.kr/detail/S000201368764','RM'),(209,NULL,'이별 없는 세대','볼프강 보르헤르트','문학과지성사','2018-11-05','버지니아 울프의 방대한 문학세계를 완성하다.','./img/celeb/hankang_book01.jpg','https://product.kyobobook.co.kr/detail/S000000570406','한강'),(210,NULL,'카라마조프가의 형제들','표도르 도스토옙스키','민음사','2007-09-20','도스토예프스키가 남긴 마지막 작품이자 최고의 작품!','./img/celeb/hankang_book02.jpg','https://product.kyobobook.co.kr/detail/S000000620291','한강'),(211,NULL,'케테 콜비츠','카테리네 크라머','이온서가','2023-10-07','슬픔을 구출하는 예술','./img/celeb/hankang_book03.jpg','https://product.kyobobook.co.kr/detail/S000210455283','한강'),(212,NULL,'어느 시인의 죽음','보리스 파스테르나크','까치','2011-05-25','영적 교감의 기록이자 내면을 향한 끝없는 여로의 기록','./img/celeb/hankang_book04.jpg','https://product.kyobobook.co.kr/detail/S000001128430','한강'),(213,NULL,'아버지의 땅','임철우','문학과지성사','2018-09-03','우리 문학 토양을 단단하고 풍요롭게 다져온 작품을 만나다!','./img/celeb/hankang_book05.jpg','https://product.kyobobook.co.kr/detail/S000000570377','한강'),(214,NULL,'사자왕 형제의 모험','아스트리드 린드그렌','창비','2015-07-10','삶과 문학의 영원한 화두에 관해 이야기하는 고전','./img/celeb/hankang_book06.jpg','https://product.kyobobook.co.kr/detail/S000000611315','한강'),(215,NULL,'어둠 속에서 헤엄치기','토마시 예드로프스키','푸른숲','2021-06-18','우리가 읽은 것 중에 가장 놀라운 동시대의 퀴어 소설','./img/celeb/hongkyung_book01.jpg','https://product.kyobobook.co.kr/detail/S000001744907','홍경'),(216,NULL,'집을 순례하다','나카무라 요시후미','사이','2011-03-30','20세기 건축의 거장 8명이 지은 9개의 ＜명작의 집＞ 순례기!','./img/celeb/hongkyung_book02.jpg','https://product.kyobobook.co.kr/detail/S000213561796','홍경'),(217,NULL,'아침의 피아노','김진영','한겨레출판사','2018-10-05','철학자 김진영의 애도 일기','./img/celeb/hongkyung_book03.jpg','https://product.kyobobook.co.kr/detail/S000216668744','홍경'),(218,NULL,'예민함이라는 무기','롤프 젤린','나무생각','2018-07-18','자극에 둔감해진 시대를 살아가는 우리에게 필요한','./img/celeb/hongkyung_book04.jpg','https://product.kyobobook.co.kr/detail/S000001808222','홍경'),(219,NULL,'일인칭 단수','무라카미 하루키','문학동네','2020-11-26','‘나’라는 소우주를 탐색하는 여덟 갈래의 이야기','./img/celeb/hongkyung_book05.jpg','https://product.kyobobook.co.kr/detail/S000000780790','홍경'),(220,NULL,'여수의 사랑','한강','문학과지성사','2018-11-09','오늘의 한강을 있게 한 어제의 한강을 읽다!','./img/celeb/hongkyung_book06.jpg','https://product.kyobobook.co.kr/detail/S000000570387','홍경');
/*!40000 ALTER TABLE `books` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `celebrecommendations`
--

DROP TABLE IF EXISTS `celebrecommendations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `celebrecommendations` (
  `celeb_rec_id` int NOT NULL AUTO_INCREMENT,
  `celeb_name` varchar(100) NOT NULL,
  `celeb_description` text,
  `celeb_image_url` varchar(500) DEFAULT NULL,
  `recommend_date` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`celeb_rec_id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `celebrecommendations`
--

LOCK TABLES `celebrecommendations` WRITE;
/*!40000 ALTER TABLE `celebrecommendations` DISABLE KEYS */;
/*!40000 ALTER TABLE `celebrecommendations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `celebrecommendedbooks`
--

DROP TABLE IF EXISTS `celebrecommendedbooks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `celebrecommendedbooks` (
  `celeb_rec_book_id` int NOT NULL AUTO_INCREMENT,
  `celeb_rec_id` int NOT NULL,
  `book_id` int NOT NULL,
  `order_in_rec` int DEFAULT NULL,
  PRIMARY KEY (`celeb_rec_book_id`),
  UNIQUE KEY `celeb_rec_id` (`celeb_rec_id`,`book_id`),
  KEY `book_id` (`book_id`),
  CONSTRAINT `celebrecommendedbooks_ibfk_1` FOREIGN KEY (`celeb_rec_id`) REFERENCES `celebrecommendations` (`celeb_rec_id`) ON DELETE CASCADE,
  CONSTRAINT `celebrecommendedbooks_ibfk_2` FOREIGN KEY (`book_id`) REFERENCES `books` (`book_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `celebrecommendedbooks`
--

LOCK TABLES `celebrecommendedbooks` WRITE;
/*!40000 ALTER TABLE `celebrecommendedbooks` DISABLE KEYS */;
/*!40000 ALTER TABLE `celebrecommendedbooks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `content_blocks`
--

DROP TABLE IF EXISTS `content_blocks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `content_blocks` (
  `block_id` int NOT NULL AUTO_INCREMENT,
  `review_id` int NOT NULL,
  `block_type` enum('text','image') NOT NULL,
  `block_order` int NOT NULL,
  `text_content` text,
  `image_url` varchar(500) DEFAULT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`block_id`),
  KEY `review_id` (`review_id`),
  CONSTRAINT `content_blocks_ibfk_1` FOREIGN KEY (`review_id`) REFERENCES `reviews` (`review_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `content_blocks`
--

LOCK TABLES `content_blocks` WRITE;
/*!40000 ALTER TABLE `content_blocks` DISABLE KEYS */;
INSERT INTO `content_blocks` VALUES (4,3,'text',1,'다같이 부자 됩시다!','','2025-07-10 23:06:43','2025-07-10 23:06:43');
/*!40000 ALTER TABLE `content_blocks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hashtags`
--

DROP TABLE IF EXISTS `hashtags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `hashtags` (
  `tag_id` int NOT NULL AUTO_INCREMENT,
  `tag_name` varchar(50) NOT NULL,
  PRIMARY KEY (`tag_id`),
  UNIQUE KEY `tag_name` (`tag_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hashtags`
--

LOCK TABLES `hashtags` WRITE;
/*!40000 ALTER TABLE `hashtags` DISABLE KEYS */;
/*!40000 ALTER TABLE `hashtags` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `playlistbooks`
--

DROP TABLE IF EXISTS `playlistbooks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `playlistbooks` (
  `playlist_book_id` int NOT NULL AUTO_INCREMENT,
  `playlist_id` int NOT NULL,
  `book_id` int NOT NULL,
  `added_at` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`playlist_book_id`),
  UNIQUE KEY `playlist_id` (`playlist_id`,`book_id`),
  KEY `book_id` (`book_id`),
  CONSTRAINT `playlistbooks_ibfk_1` FOREIGN KEY (`playlist_id`) REFERENCES `playlists` (`playlist_id`) ON DELETE CASCADE,
  CONSTRAINT `playlistbooks_ibfk_2` FOREIGN KEY (`book_id`) REFERENCES `books` (`book_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `playlistbooks`
--

LOCK TABLES `playlistbooks` WRITE;
/*!40000 ALTER TABLE `playlistbooks` DISABLE KEYS */;
/*!40000 ALTER TABLE `playlistbooks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `playlists`
--

DROP TABLE IF EXISTS `playlists`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `playlists` (
  `playlist_id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` text,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`playlist_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `playlists_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `playlists`
--

LOCK TABLES `playlists` WRITE;
/*!40000 ALTER TABLE `playlists` DISABLE KEYS */;
/*!40000 ALTER TABLE `playlists` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reviewbook`
--

DROP TABLE IF EXISTS `reviewbook`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reviewbook` (
  `book_id` int NOT NULL AUTO_INCREMENT,
  `isbn` varchar(20) DEFAULT NULL,
  `title` varchar(255) NOT NULL,
  `author` varchar(255) NOT NULL,
  `publisher` varchar(255) DEFAULT NULL,
  `cover_image_url` varchar(500) DEFAULT NULL,
  `naver_link` varchar(500) DEFAULT NULL,
  `description` text,
  `pubdate` date DEFAULT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`book_id`),
  UNIQUE KEY `isbn` (`isbn`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reviewbook`
--

LOCK TABLES `reviewbook` WRITE;
/*!40000 ALTER TABLE `reviewbook` DISABLE KEYS */;
INSERT INTO `reviewbook` VALUES (1,'9791169213868','자바 최적화 (클라우드 시대의 자바 성능 튜닝을 위한 실용적인 기법)','벤저민 J. 에번스','','https://shopping-phinf.pstatic.net/main_5481319/54813194388.20250520082541.jpg','https://search.shopping.naver.com/book/catalog/54813194388','',NULL,'2025-07-11 07:23:08','2025-07-11 07:23:08'),(2,'9791194368311','쓰는 인간 (종이에 기록한 사유와 창조의 역사)','롤런드 앨런','','https://shopping-phinf.pstatic.net/main_5526949/55269496515.20250617094239.jpg','https://search.shopping.naver.com/book/catalog/55269496515','',NULL,'2025-07-11 07:43:50','2025-07-11 07:43:50'),(3,'9791198987631','세계 경제 지각 변동 (트럼프가 흔드는 세계 경제, 어디로 가는가)','박종훈','','https://shopping-phinf.pstatic.net/main_5540159/55401590712.20250621110430.jpg','https://search.shopping.naver.com/book/catalog/55401590712','',NULL,'2025-07-11 08:00:05','2025-07-11 08:00:05');
/*!40000 ALTER TABLE `reviewbook` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reviews`
--

DROP TABLE IF EXISTS `reviews`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reviews` (
  `review_id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `book_id` int NOT NULL,
  `review_text` text NOT NULL,
  `rating` tinyint NOT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`review_id`),
  KEY `user_id` (`user_id`),
  KEY `book_id` (`book_id`),
  CONSTRAINT `reviews_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`),
  CONSTRAINT `reviews_ibfk_2` FOREIGN KEY (`book_id`) REFERENCES `reviewbook` (`book_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reviews`
--

LOCK TABLES `reviews` WRITE;
/*!40000 ALTER TABLE `reviews` DISABLE KEYS */;
INSERT INTO `reviews` VALUES (3,1,3,'다같이 부자 됩시다!',3,'2025-07-11 08:00:05','2025-07-10 23:06:43');
/*!40000 ALTER TABLE `reviews` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `userinterests`
--

DROP TABLE IF EXISTS `userinterests`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `userinterests` (
  `user_interest_id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `interest_tag` varchar(50) NOT NULL,
  PRIMARY KEY (`user_interest_id`),
  UNIQUE KEY `user_id` (`user_id`,`interest_tag`),
  CONSTRAINT `userinterests_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `userinterests`
--

LOCK TABLES `userinterests` WRITE;
/*!40000 ALTER TABLE `userinterests` DISABLE KEYS */;
/*!40000 ALTER TABLE `userinterests` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `user_id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  `nickname` varchar(50) NOT NULL,
  `email` varchar(100) DEFAULT NULL,
  `gender` enum('M','F','O') DEFAULT NULL,
  `mbti` varchar(10) DEFAULT NULL,
  `reg_date` datetime DEFAULT CURRENT_TIMESTAMP,
  `last_login_date` datetime DEFAULT NULL,
  `status` enum('active','inactive','withdrawn') DEFAULT 'active',
  `hobbies` text,
  `deleted_at` datetime DEFAULT NULL,
  `name` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `username` (`username`),
  UNIQUE KEY `nickname` (`nickname`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'sst7050','$2a$10$IDwHRwbvpCJiS9erIOdra.5nAmIrM3w1AASBQO9DFv3nci6sW7DXG','gustjr','sst@naver.com','M','INTP','2025-07-03 15:06:00','2025-07-11 08:06:22','active','science,coding,fashion,technology,education',NULL,'현석'),(2,'s12345','$2a$10$rSEx5k9Yr8iPhG7fVOfbye2i9urzEfZEtJqVQIsGsHwWS8tgXKAFC','현석','sss@naver.com','M','INFP','2025-07-04 14:30:01','2025-07-04 14:30:32','withdrawn','reading,technology','2025-07-04 05:33:09','심현석'),(3,'sst2525','$2a$10$TZArtraBdlw.09n8R8qFWeIWQ.5hp2o0FHcKc9Bv/CEP2t42VIYNW','현수','sst23@naver.com','F','ENFJ','2025-07-07 17:46:01',NULL,'active','reading,travel,technology',NULL,'심현수'),(4,'sst1999','$2a$10$qdJf0ghROstgtAA9HLct8ej2z42LRbQfkB9QupH/SCGSYepQxIiai','현석심','asdasd@naver.com','M','ESTJ','2025-07-08 10:45:07',NULL,'active','reading,gaming,fashion',NULL,'현석심'),(5,'sst1995','$2a$10$lkF5zX5Y3LcyuP/.XnnwAuR9V5ShsPwl9lFfv2LDzI/7Wku6bRE6q','현석아','dfddf@naver.com','M','ENTP','2025-07-08 10:56:35',NULL,'active','movie,gaming,coding',NULL,'현석심이'),(6,'shs1999','$2a$10$xvUr4bxGUze2XpDLulsx3OlxcLOe8KOlDYcqGVjKFkhc1uZ7fl/V.','현석이','sstt@naver.com','M','ESFJ','2025-07-08 11:04:06','2025-07-09 16:28:22','withdrawn','reading,travel,science','2025-07-09 07:28:35','현석아'),(7,'sst2050','$2a$10$lyyStqCCGlosgewljJGgS.r.ws9swV8YmorkKQmXQavXnud8BI0zW','현수스','sst70500@naver.com','M','ENTJ','2025-07-08 11:06:29',NULL,'active','movie,gaming,coding',NULL,'현수심'),(8,'yasuo','$2a$10$f0EUW9TerwI.ugyH3jeqAeb21vHlbUxnaH8ZmnF6HsO70MI8Y2CB.',' yasuo','yasuo@naver.com','M','ENTJ','2025-07-08 11:08:42',NULL,'active','gaming,coding,fashion',NULL,'야스오'),(9,'yone','$2a$10$ly9Jg.K0OL6Hy9YUXX4m3OCHYrW0c0Imh4NicMpxEOQcEw6o1CBO2','요네','yone@naver.com','M','ENTJ','2025-07-08 11:12:47','2025-07-08 14:19:00','withdrawn','gaming','2025-07-08 05:19:13','요네스'),(10,'timo','$2a$10$Q0PX8bQmftY45PFjyTNk7.0P50zB1UmxTT4ZC0OuDZ6W7.JUtqV5S','티모','timo@naver.com','M','ENFJ','2025-07-08 11:26:29','2025-07-08 12:41:34','active','reading',NULL,'티모'),(11,'sss','$2a$10$0n/52FGfPkotU1Aot56/C.FakooU7Q4j5OcXbcsnXG4a19xfqUhmy','sss','ssssss@naver.com','F','ISFJ','2025-07-08 16:04:10',NULL,'active','cooking,fashion',NULL,'sss');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wishlists`
--

DROP TABLE IF EXISTS `wishlists`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `wishlists` (
  `user_id` int NOT NULL,
  `book_id` int NOT NULL,
  `added_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`user_id`,`book_id`),
  KEY `book_id` (`book_id`),
  CONSTRAINT `wishlists_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE,
  CONSTRAINT `wishlists_ibfk_2` FOREIGN KEY (`book_id`) REFERENCES `books` (`book_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wishlists`
--

LOCK TABLES `wishlists` WRITE;
/*!40000 ALTER TABLE `wishlists` DISABLE KEYS */;
INSERT INTO `wishlists` VALUES (1,144,'2025-07-10 19:25:37'),(1,145,'2025-07-10 19:25:38'),(1,146,'2025-07-10 19:25:38'),(1,148,'2025-07-10 19:25:40'),(1,149,'2025-07-10 19:25:39'),(1,151,'2025-07-10 19:25:42'),(1,153,'2025-07-10 19:25:43'),(1,154,'2025-07-10 19:25:44'),(1,156,'2025-07-10 19:25:45'),(1,157,'2025-07-10 19:25:46'),(1,159,'2025-07-10 19:25:47'),(1,160,'2025-07-10 19:25:49'),(1,162,'2025-07-10 19:25:48');
/*!40000 ALTER TABLE `wishlists` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'book_recommendation_db'
--

--
-- Dumping routines for database 'book_recommendation_db'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-07-11  8:15:03
