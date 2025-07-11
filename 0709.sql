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
) ENGINE=InnoDB AUTO_INCREMENT=163 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `books`
--

LOCK TABLES `books` WRITE;
/*!40000 ALTER TABLE `books` DISABLE KEYS */;
INSERT INTO `books` VALUES (1,'978-89-9999-001-0','더미북1 제목','더미저자1','더미출판사1','2023-01-01','간단한 설명1','http://example.com/cover1.jpg','http://example.com/link1',NULL),(2,'978-89-9999-002-0','더미북2 제목','더미저자2','더미출판사2','2023-02-01','간단한 설명2','http://example.com/cover2.jpg','http://example.com/link2',NULL),(3,NULL,'나의 문화유산답사기 9: 서울편 1','유홍준',NULL,NULL,'25년 간 이어온 대표 인문 시리즈, 서울 편.','img/n1.jpg','https://search.shopping.naver.com/book/catalog/32445567453',NULL),(4,NULL,'다른 방식으로 보기','존 버거',NULL,NULL,'미술 감상법에 대한 새로운 시각.','img/d.jpg','https://search.shopping.naver.com/book/catalog/32490815625',NULL),(5,NULL,'나의 문화유산답사기','유홍준',NULL,NULL,'한국 문화유산 대중서의 스테디셀러.','img/d1.jpg','https://search.shopping.naver.com/book/catalog/32445567453',NULL),(6,NULL,'사진에 관하여','수전 손택',NULL,NULL,'사진과 현실의 관계를 성찰.','img/d2.jpg','https://search.shopping.naver.com/book/catalog/32441018601',NULL),(7,NULL,'미학 오디세이','진중권',NULL,NULL,'대중을 위한 철학적 미학 입문.','img/d3.jpg','https://search.shopping.naver.com/book/catalog/32466555822',NULL),(8,NULL,'죽기 전에 꼭 봐야 할 세계 건축','피터 클락슨',NULL,NULL,'세계 주요 건축물 100선.','img/d4.jpg','https://search.shopping.naver.com/book/catalog/32436153694',NULL),(9,NULL,'한국의 미 특강','오주석',NULL,NULL,'한국 미술의 아름다움 해설.','img/d5.jpg','https://search.shopping.naver.com/book/catalog/32436144306',NULL),(10,NULL,'컬러 앤 라이트','제임스 거니',NULL,NULL,'사실적 표현을 위한 빛과 색 이론.','img/mm1.jpg','https://search.shopping.naver.com/book/catalog/51676555623',NULL),(11,NULL,'음악의 역사','클로드 팔리스카',NULL,NULL,'서양 음악사의 흐름.','img/d7.jpg','https://search.shopping.naver.com/book/catalog/55485250979',NULL),(12,NULL,'영화의 이해','루이스 자네티',NULL,NULL,'영화 이론 입문서의 고전.','img/d8.jpg','https://search.shopping.naver.com/book/catalog/32442163261',NULL),(13,NULL,'길 위의 인문학','김정남',NULL,NULL,'여행과 인문학의 만남.','img/d9.jpg','https://search.shopping.naver.com/book/catalog/33189944618',NULL),(14,NULL,'아리스토텔레스의 시학','아리스토텔레스',NULL,NULL,'비극 이론의 고전.','img/d10.jpg','https://search.shopping.naver.com/book/catalog/32436012778',NULL),(15,NULL,'미술관에 간 과학자','이정모',NULL,NULL,'과학적 시선으로 본 미술 이야기.','img/d11.jpg','https://search.shopping.naver.com/book/catalog/32438202741',NULL),(16,NULL,'에디토리얼 씽킹','최혜진',NULL,NULL,'편집 디자인의 창의적 사고 과정.','img/d12.jpg','https://search.shopping.naver.com/book/catalog/44417064619',NULL),(17,NULL,'현대 물리학과 동양사상','프리초프 카프라',NULL,NULL,'동서 사상의 융합.','img/d13.jpg','https://search.shopping.naver.com/book/catalog/32473020311',NULL),(18,NULL,'문학이란 무엇인가','장 폴 사르트르',NULL,NULL,'문학의 존재론적 의미 탐구.','img/d14.jpg','https://search.shopping.naver.com/book/catalog/32486736931',NULL),(19,NULL,'클래식 왜 안 좋아하세요?','권태영',NULL,NULL,'입문자를 위한 클래식 20인 안내서.','img/dp30.jpg','https://search.shopping.naver.com/book/catalog/54417375837',NULL),(20,NULL,'모 이야기','최연주',NULL,NULL,'일상을 포근히 그린 에세이.','img/d16.jpg','https://search.shopping.naver.com/book/catalog/37524796620',NULL),(21,NULL,'나는 고양이로소이다','나쓰메 소세키',NULL,NULL,'고양이 시선으로 본 인간 사회 풍자.','img/d17.jpg','https://search.shopping.naver.com/book/catalog/53632315796',NULL),(22,NULL,'방구석 미술관','조원재',NULL,NULL,'집에서 즐기는 흥미로운 미술 이야기.','img/d18.jpg','https://search.shopping.naver.com/book/catalog/32436144217',NULL),(23,NULL,'자연스러운 인체 드로잉','드로잉 전문가',NULL,NULL,'인체를 자연스럽게 그리는 방법.','img/d19.jpg','https://search.shopping.naver.com/book/catalog/33895602632',NULL),(24,NULL,'단 한 번의 삶','김영하',NULL,NULL,'삶과 존재를 깊이 성찰하는 산문.','img/esa1.jpg','https://search.shopping.naver.com/book/catalog/53735013051',NULL),(25,NULL,'무소유','법정',NULL,NULL,'소유하지 않는 삶의 가치.','img/dp.jpg','https://search.shopping.naver.com/book/catalog/42325184618',NULL),(26,NULL,'인연','피천득',NULL,NULL,'소중한 사람과 순간을 그린 서정 에세이.','img/dp1.jpg','https://search.shopping.naver.com/book/catalog/32482042408',NULL),(27,NULL,'개인주의자 선언','문유석',NULL,NULL,'개인의 자유와 사회적 연대를 함께 모색.','img/dp2.jpg','https://search.shopping.naver.com/book/catalog/32441659387',NULL),(28,NULL,'나는 나로 살기로 했다','김수현',NULL,NULL,'자존감을 위한 현실적 조언.','img/dp3.jpg','https://search.shopping.naver.com/book/catalog/32465494978',NULL),(29,NULL,'죽음의 수용소에서','빅터 프랭클',NULL,NULL,'의미를 찾는 인간의 의지.','img/dp4.jpg','https://search.shopping.naver.com/book/catalog/32485602637',NULL),(30,NULL,'어떻게 살 것인가','유시민',NULL,NULL,'더 나은 삶을 위한 대화.','img/dp5.jpg','https://search.shopping.naver.com/book/catalog/32465515855',NULL),(31,NULL,'혼자가 혼자에게','이병률',NULL,NULL,'고독 속에서 찾은 위로.','img/dp6.jpg','https://search.shopping.naver.com/book/catalog/32490282198',NULL),(32,NULL,'여행의 이유','김영하',NULL,NULL,'여행을 읽는 또 하나의 관점.','img/dp7.jpg','https://search.shopping.naver.com/book/catalog/46931760625',NULL),(33,NULL,'낭만적 연애와 그 후의 일상','알랭 드 보통',NULL,NULL,'사랑과 관계에 대한 철학적 통찰.','img/dp8.jpg','https://search.shopping.naver.com/book/catalog/32436139331',NULL),(34,NULL,'아픔이 길이 되려면','김승섭',NULL,NULL,'아픔을 통해 바라본 사회의 구조.','img/dp9.jpg','https://search.shopping.naver.com/book/catalog/32475523886',NULL),(35,NULL,'언어의 온도','이기주',NULL,NULL,'말과 글의 따뜻함을 이야기.','img/dp10.jpg','https://search.shopping.naver.com/book/catalog/32445599640',NULL),(36,NULL,'내 옆에 있는 사람','이병률',NULL,NULL,'관계 속 따뜻한 시선.','img/dp11.jpg','https://search.shopping.naver.com/book/catalog/32466975969',NULL),(37,NULL,'게으를 권리','폴 라파르그',NULL,NULL,'노동 중심 사회에 대한 비판.','img/dp12.jpg','https://search.shopping.naver.com/book/catalog/32466637728',NULL),(38,NULL,'월든','헨리 데이비드 소로',NULL,NULL,'자연 속에서의 자급자족 실험.','img/dp13.jpg','https://search.shopping.naver.com/book/catalog/32445721746',NULL),(39,NULL,'우리는 언젠가 만난다','채사장',NULL,NULL,'삶과 관계의 철학적 성찰.','img/dp14.jpg','https://search.shopping.naver.com/book/catalog/32466539178',NULL),(40,NULL,'슬픔을 공부하는 슬픔','신형철',NULL,NULL,'섬세한 문학‧사회 비평.','img/dp15.jpg','https://search.shopping.naver.com/book/catalog/32454453350',NULL),(41,NULL,'하늘 호수로 떠난 여행','류시화',NULL,NULL,'인도 여행기를 통한 영적 성찰.','img/dp16.jpg','https://search.shopping.naver.com/book/catalog/32487161391',NULL),(42,NULL,'개인주의자 선언','문유석',NULL,NULL,'사회와 개인의 균형을 재차 환기.','img/dp17.jpg','https://search.shopping.naver.com/book/catalog/32441659387',NULL),(43,NULL,'사랑의 기술','에리히 프롬',NULL,NULL,'사랑을 기술로 분석한 명저.','img/dp18.jpg','https://search.shopping.naver.com/book/catalog/32457424202',NULL),(44,NULL,'태도에 관하여','임경선',NULL,NULL,'삶을 대하는 태도를 모색.','img/dp19.jpg','https://search.shopping.naver.com/book/catalog/50466246618',NULL),(45,NULL,'백년허리2','정선근',NULL,NULL,'서울대 의대 재활의학과 정선근 교수의 스테디셀러인 백년허리1 진단편에 이어서 실제적인 치료 방법을 제시하고 있는 백년허리2 치료편이다. 치료편에서 저자는 허리 통증에서 벗어날 수 있는 방법을 정확히, 구체적으로, 누구나 따라할 수 있도록 설명하고 있다. 일상생활, 운동, 작업 등 허리 아픈 사람이 겪게 되는 모든 상황에서 허리를 어떻게 사용하는 것이 옳은지를 알려주는 말그대로 국민 허리 사용설명서이다.','img/r1.jpg','https://search.shopping.naver.com/book/catalog/32461159846','건강/스포츠'),(46,NULL,'백년허리2','정선근',NULL,NULL,'평생 건강한 허리를 위한 실용적인 운동법과 관리법','img/r1.jpg','https://search.shopping.naver.com/book/catalog/32461159846','건강/스포츠'),(47,NULL,'백년허리 1','정선근',NULL,NULL,'허리 건강의 기초를 다지는 필수 가이드북','img/r2.jpg','https://search.shopping.naver.com/book/catalog/32441695777','건강/스포츠'),(48,NULL,'부모의 내면이 아이의 세상이 된다','대니얼 J.시겔, 메리 하첼',NULL,NULL,'아이의 건강한 성장을 위한 부모의 심리적 건강 관리','img/r3.jpg','https://search.shopping.naver.com/book/catalog/40542385623','건강/스포츠'),(49,NULL,'저속노화 마인드셋','정희원',NULL,NULL,'건강한 노화를 위한 마음가짐과 생활 철학','img/r4.jpg','https://search.shopping.naver.com/book/catalog/46881757624','건강/스포츠'),(50,NULL,'길 위의 뇌','정세희',NULL,NULL,'일상 속에서 뇌 건강을 지키는 실용적인 방법들','img/r5.jpg','https://search.shopping.naver.com/book/catalog/47690626624','건강/스포츠'),(51,NULL,'해독 혁명','닥터 라이블리',NULL,NULL,'몸의 독소를 제거하고 건강을 회복하는 혁신적 방법','img/r6.jpg','https://search.shopping.naver.com/book/catalog/32470073992','건강/스포츠'),(52,NULL,'저속노화 식사법','정희원',NULL,NULL,'노화를 늦추는 과학적인 식단과 영양 관리법','img/r7.jpg','https://search.shopping.naver.com/book/catalog/45695882618','건강/스포츠'),(53,NULL,'내 몸 혁명','박용우',NULL,NULL,'건강한 몸을 만들기 위한 총체적인 생활 개선 가이드','img/r8.jpg','https://search.shopping.naver.com/book/catalog/32470068305','건강/스포츠'),(54,NULL,'느리게 나이 드는 습관','정희원',NULL,NULL,'건강한 장수를 위한 일상 습관의 중요성과 실천법','img/r9.jpg','https://shopping.naver.com/book/catalog/41235476621','건강/스포츠'),(55,NULL,'기적의 항암 식단','김훈하, 김정은',NULL,NULL,'암 예방과 치료에 도움이 되는 과학적 식단 가이드','img/r10.jpg','https://search.shopping.naver.com/book/catalog/32483162283','건강/스포츠'),(56,NULL,'회복탄력성의 뇌과학','아디티 네루카',NULL,NULL,'스트레스와 트라우마에 맞서는 뇌의 회복 능력 탐구','img/r11.jpg','https://search.shopping.naver.com/book/catalog/46241088621','건강/스포츠'),(57,NULL,'수면의 뇌과학','크리스 윈터',NULL,NULL,'양질의 수면을 위한 과학적 이해와 실천 방법','img/r12.jpg','https://search.shopping.naver.com/book/catalog/39561655618','건강/스포츠'),(58,NULL,'넥서스','유발 하라리',NULL,NULL,'글로벌 베스트셀러 『사피엔스』 『호모 데우스』 『21세기를 위한 21가지 제언』으로 우리 시대 가장 중요한 사상가의 반열에 오른 유발 하라리 교수가 압도적 통찰로 AI 혁명의 의미와 본질을 꿰뚫어 보고 인류에게 남은 기회를 냉철하게 성찰하는 신작으로 돌아왔다. 생태적 붕괴와 국제정치적 긴장에 이어 친구인지 적인지 모를 AI 혁명까지, 인간 본성의 어떤 부분이 우리를 자기 파괴의 길로 내모는 것일까? AI는 이전 정보 기술과 무엇이 다르고, 왜 위험할까? 멸종을 향해 달려가는 가장 영리한 동물, 우리 사피엔스는 생존과 번영의 길을 찾을 수 있을까?','img/dur5.jpg','https://search.shopping.naver.com/book/catalog/48538749622','인문/역사'),(59,NULL,'사피엔스','유발 하라리',NULL,NULL,'인류의 역사와 미래를 거시적으로 조망','img/dur.jpg','https://search.shopping.naver.com/book/catalog/32441695627','인문/역사'),(60,NULL,'역사란 무엇인가','E.H. 카',NULL,NULL,'역사학의 고전이자 필독서','img/dur1.jpg','https://search.shopping.naver.com/book/catalog/32436139335','인문/역사'),(61,NULL,'로마 제국 쇠망사','에드워드 기번',NULL,NULL,'서양 고전 역사의 기념비적 저작','img/dur2.jpg','https://search.shopping.naver.com/book/catalog/32466981881','인문/역사'),(62,NULL,'총, 균, 쇠','재레드 다이아몬드',NULL,NULL,'문명의 흥망성쇠를 환경적 관점에서 분석','img/dur3.jpg','https://search.shopping.naver.com/book/catalog/32436139206','인문/역사'),(63,NULL,'나의 문화유산답사기','유홍준',NULL,NULL,'한국 문화유산의 아름다움을 대중에게 알림','img/dur4.jpg','https://search.shopping.naver.com/book/catalog/32485593026','인문/역사'),(64,NULL,'넥서스','유발 하라리',NULL,NULL,'정보와 권력의 미래를 예측하는 통찰력 있는 분석','img/dur5.jpg','https://search.shopping.naver.com/book/catalog/48538749622','인문/역사'),(65,NULL,'서양미술사','에른스트 H. 곰브리치',NULL,NULL,'미술사의 바이블로 불리는 대표적인 입문서','img/dur6.jpg','https://search.shopping.naver.com/book/catalog/32488887754','인문/역사'),(66,NULL,'문화의 수수께끼','마빈 해리스',NULL,NULL,'다양한 문화 현상을 인류학적 관점에서 해석','img/dur7.jpg','https://search.shopping.naver.com/book/catalog/32488887857','인문/역사'),(67,NULL,'죽은 경제학자의 살아있는 아이디어','토드 부크홀츠',NULL,NULL,'경제사상사를 쉽고 재미있게 풀어냄','img/dur8.jpg','https://search.shopping.naver.com/book/catalog/32441695719','인문/역사'),(68,NULL,'21세기 자본','토마 피케티',NULL,NULL,'불평등 문제를 역사적 데이터로 분석','img/dur9.jpg','https://search.shopping.naver.com/book/catalog/32474415891','인문/역사'),(69,NULL,'유럽 도시 기행1','유시민',NULL,NULL,'유럽 도시들의 역사와 문화를 깊이 있게 탐방','img/dur10.jpg','https://search.shopping.naver.com/book/catalog/32482037989','인문/역사'),(70,NULL,'사마천 사기','사마천',NULL,NULL,'중국 역사서의 걸작이자 동양 사학의 출발점','img/dur11.jpg','https://search.shopping.naver.com/book/catalog/32486927391','인문/역사'),(71,NULL,'조선왕조실록','대중을 위한 번역본',NULL,NULL,'한국사의 방대한 기록물','img/dur12.jpg','https://search.shopping.naver.com/book/catalog/44476735622','인문/역사'),(72,NULL,'물질의 세계','에드 콘웨이',NULL,NULL,'현대 문명을 이루는 물질들의 숨겨진 이야기','img/a1.jpg','https://search.shopping.naver.com/book/catalog/42529329623','인문/역사'),(73,NULL,'삼국유사','일연',NULL,NULL,'한국 고대사와 불교문화의 소중한 기록','img/dur13.jpg','https://search.shopping.naver.com/book/catalog/32486927393','인문/역사'),(74,NULL,'역사의 종말','프랜시스 후쿠야마',NULL,NULL,'냉전 이후 서구 자유민주주의의 승리 선언','img/dur14.jpg','https://search.shopping.naver.com/book/catalog/32445834817','인문/역사'),(75,NULL,'세계사를 바꾼 10가지 약','사토 겐타로',NULL,NULL,'인류 역사는 ‘질병과 약의 투쟁 역사’다','img/dur18.jpg','https://search.shopping.naver.com/book/catalog/37622287618','인문/역사'),(76,NULL,'다시, 역사의 쓸모','최태성',NULL,NULL,'현재를 이해하기 위한 역사적 통찰력','img/dur17.jpg','https://search.shopping.naver.com/book/catalog/40540789622','인문/역사'),(77,NULL,'잃어버린 시간을 찾아서','마르셀 프루스트',NULL,NULL,'기억과 시간의 본질을 탐구','img/dur15.jpg','https://shopping.naver.com/book/catalog/32486926955','인문/역사'),(78,NULL,'호모데우스','유발 하라리',NULL,NULL,'기술 발전이 가져올 인류의 미래를 예측','img/dur19.jpg','https://search.shopping.naver.com/book/catalog/32485593019','인문/역사'),(79,NULL,'용의자 X의 헌신','히가시노 게이고',NULL,NULL,'천재 수학자 이시가미는 옆집에 사는 야스코가 전남편을 살해한 것을 알게 된다. 그녀를 향한 깊은 사랑으로 그는 완벽한 알리바이를 설계하며 자신의 모든 것을 바친다. 사건을 파고드는 천재 물리학자 유카와와의 치열한 두뇌 싸움 속에서, 상상을 초월하는 헌신적인 사랑의 비밀이 드러난다.','img/m3.jpg','https://search.shopping.naver.com/book/catalog/32485602737','미스테리/추리'),(80,NULL,'셜록 홈즈 전집','아서 코난 도일',NULL,NULL,'탐정 소설의 고전이자 원형','img/m.jpg','https://search.shopping.naver.com/book/catalog/32488888060','미스테리/추리'),(81,NULL,'그리고 아무도 없었다','애거서 크리스티',NULL,NULL,'밀실 추리 소설의 대가','img/m1.jpg','https://search.shopping.naver.com/book/catalog/32466981895','미스테리/추리'),(82,NULL,'검은 고양이','에드거 앨런 포',NULL,NULL,'고딕 소설과 심리 스릴러의 선구자','img/m2.jpg','https://search.shopping.naver.com/book/catalog/32470076211','미스테리/추리'),(83,NULL,'용의자 X의 헌신','히가시노 게이고',NULL,NULL,'반전과 심리 묘사가 뛰어난 일본 미스터리','img/m3.jpg','https://search.shopping.naver.com/book/catalog/32485602737','미스테리/추리'),(84,NULL,'이방인','알베르 카뮈',NULL,NULL,'부조리 문학의 대표작','img/m4.jpg','https://search.shopping.naver.com/book/catalog/32486927233','미스테리/추리'),(85,NULL,'살인자의 기억법','김영하',NULL,NULL,'기억 상실 살인범의 독특한 시점','img/m5.jpg','https://search.shopping.naver.com/book/catalog/32482037996','미스테리/추리'),(86,NULL,'눈먼 암살자','마거릿 애트우드',NULL,NULL,'문학성과 서스펜스를 겸비한 작품','img/m6.jpg','https://search.shopping.naver.com/book/catalog/32474416182','미스테리/추리'),(87,NULL,'나를 찾아줘','길리언 플린',NULL,NULL,'예측 불허의 반전 심리 스릴러','img/m7.jpg','https://search.shopping.naver.com/book/catalog/32461160358','미스테리/추리'),(88,NULL,'침묵의 봄','레이첼 카슨',NULL,NULL,'환경 미스터리 고전','img/m8.jpg','https://search.shopping.naver.com/book/catalog/32488887756','미스테리/추리'),(89,NULL,'양들의 침묵','토마스 해리스',NULL,NULL,'사이코패스 범죄 스릴러의 대표작','img/m9.jpg','https://search.shopping.naver.com/book/catalog/32486927239','미스테리/추리'),(90,NULL,'나미야 잡화점의 기적','히가시노 게이고',NULL,NULL,'따뜻한 판타지 미스터리','img/m10.jpg','https://search.shopping.naver.com/book/catalog/32485592882','미스테리/추리'),(91,NULL,'장미의 이름','움베르토 에코',NULL,NULL,'중세 수도원 배경의 지적 추리 소설','img/m11.jpg','https://search.shopping.naver.com/book/catalog/32436139198','미스테리/추리'),(92,NULL,'죄와 벌','표도르 도스토옙스키',NULL,NULL,'범죄와 인간 양심의 문제를 다룬 심리 소설','img/m12.jpg','https://search.shopping.naver.com/book/catalog/32436139265','미스테리/추리'),(93,NULL,'나는 고양이로소이다','나쓰메 소세키',NULL,NULL,'인간 사회 풍자','img/m13.jpg','https://search.shopping.naver.com/book/catalog/32486927390','미스테리/추리'),(94,NULL,'검은 집','기시 유스케',NULL,NULL,'일본 호러 미스터리','img/m14.jpg','https://search.shopping.naver.com/book/catalog/32488887968','미스테리/추리'),(95,NULL,'애크로이드 살인 사건','애거사 크리스티',NULL,NULL,'추리 소설사에 길이 남을 혁신적인 트릭','img/m15.jpg','https://search.shopping.naver.com/book/catalog/32470076214','미스테리/추리'),(96,NULL,'고독한 용의자','찬호께이',NULL,NULL,'홍콩 추리 소설의 독특한 매력을 보여주는 작품','img/m16.jpg','https://shopping.naver.com/book/catalog/46219451622','미스테리/추리'),(97,NULL,'첫번째 거짓말이 중요하다','애슐리 엘스턴',NULL,NULL,'청소년을 위한 흥미진진한 미스터리 소설','img/m17.jpg','https://search.shopping.naver.com/book/catalog/44933907621','미스테리/추리'),(98,NULL,'하우스메이드','프리다 맥파튼',NULL,NULL,'계급 갈등과 복수를 다룬 심리 스릴러','img/m18.jpg','https://search.shopping.naver.com/book/catalog/40893245625','미스테리/추리'),(99,NULL,'Y의 비극','앨러리 퀸',NULL,NULL,'본격 추리 소설의 황금기를 대표하는 고전','img/m19.jpg','https://search.shopping.naver.com/book/catalog/32466981912','미스테리/추리'),(100,NULL,'정의란 무엇인가','마이클 샌델',NULL,NULL,'한국에 \'정의\' 열풍을 불러일으킨 마이클 샌델은 구제 금융, 대리 출산, 동성 결혼, 과거사 공개 사과 등 현대 사회에서 우리가 흔히 부딪히는 문제를 통해 \'무엇이 정의로운가\'에 대한 해답을 탐구했다. 이 책은 탁월한 정치 철학자들이 남긴 시대를 초월한 철학적인 질문을 알기 쉽게 소개한다. 이를 통해 옳고 그름, 정의와 부당함, 평등과 불평등, 개인의 권리와 공동선을 둘러싼 주장들이 경쟁하는 공적 담론과 토론의 장에서 정의에 관한 자신만의 견해를 정립하고 논리 기반을 굳건하게 다지는 토대를 제공한다. 이 책은 현대 사회의 문제를 진단하고 새로운 대안을 찾아내는 정치 철학자들의 지적 탐색 과정을 보여준다.','img/c.jpg','https://search.shopping.naver.com/book/catalog/32482037988','철학'),(101,NULL,'정의란 무엇인가','마이클 샌델',NULL,NULL,'현대 사회의 정의 문제에 대한 윤리적 고찰','img/c.jpg','https://search.shopping.naver.com/book/catalog/32482037988','철학'),(102,NULL,'국가','플라톤',NULL,NULL,'이상적인 국가와 정의에 대한 서양 철학의 고전','img/c1.jpg','https://search.shopping.naver.com/book/catalog/32441695738','철학'),(103,NULL,'순수이성비판','임마누엘 칸트',NULL,NULL,'근대 서양 철학의 기념비적 저작','img/c2.jpg','https://search.shopping.naver.com/book/catalog/32470076212','철학'),(104,NULL,'차라투스트라는 이렇게 말했다','프리드리히 니체',NULL,NULL,'초인 사상과 영원 회귀 사상','img/c3.jpg','https://search.shopping.naver.com/book/catalog/32436139360','철학'),(105,NULL,'데미안','헤르만 헤세',NULL,NULL,'자아를 찾아가는 성장과 철학적 여정','img/c4.jpg','https://search.shopping.naver.com/book/catalog/32445834882','철학'),(106,NULL,'죽은 시인의 사회','N.H. 클라인바움',NULL,NULL,'자유로운 사고와 삶의 본질 탐구','img/c5.jpg','https://search.shopping.naver.com/book/catalog/32461160410','철학'),(107,NULL,'군주론','니콜로 마키아벨리',NULL,NULL,'정치 철학의 냉혹한 현실을 보여주는 고전','img/c6.jpg','https://search.shopping.naver.com/book/catalog/32466981880','철학'),(108,NULL,'자유론','존 스튜어트 밀',NULL,NULL,'개인의 자유와 사회의 역할에 대한 고찰','img/c7.jpg','https://search.shopping.naver.com/book/catalog/32470076213','철학'),(109,NULL,'아픔이 길이 되려면','김승섭',NULL,NULL,'사회적 고통을 의학적 관점에서 성찰한 인문학적 탐구','img/c8.jpg','https://search.shopping.naver.com/book/catalog/32475523886','철학'),(110,NULL,'도덕경','노자',NULL,NULL,'무위자연과 도의 철학을 담은 동양 철학의 고전','img/c9.jpg','https://search.shopping.naver.com/book/catalog/32461160359','철학'),(111,NULL,'철학이 필요한 시간','강신주',NULL,NULL,'일상 속 철학적 사유를 권하는 책','img/c10.jpg','https://search.shopping.naver.com/book/catalog/32461159849','철학'),(112,NULL,'논어','공자',NULL,NULL,'유교 사상의 핵심이자 동양 철학의 근간','img/c11.jpg','https://search.shopping.naver.com/book/catalog/32488887848','철학'),(113,NULL,'마흔에 읽는 쇼펜하우어','쇼펜하우어',NULL,NULL,'중년의 관점에서 재해석한 쇼펜하우어의 철학적 지혜','img/c12.jpg','https://search.shopping.naver.com/book/catalog/40542385624','철학'),(114,NULL,'소피의 세계','요슈타인 가아더',NULL,NULL,'소설로 읽는 철학','img/c13.jpg','https://search.shopping.naver.com/book/catalog/32486926956','철학'),(115,NULL,'시지프 신화','알베르 카뮈',NULL,NULL,'부조리한 삶에 대한 실존주의적 성찰','img/c14.jpg','https://search.shopping.naver.com/book/catalog/32470076215','철학'),(116,NULL,'철학은 어떻게 삶의 무기가 되는가','야마구치 슈',NULL,NULL,'실용적인 관점에서 철학을 해석','img/c15.jpg','https://search.shopping.naver.com/book/catalog/33682283621','철학'),(117,NULL,'모든 것이 되는 법','에밀리 와프닉',NULL,NULL,'다양한 관심사를 가진 현대인을 위한 삶의 철학','img/c16.jpg','https://search.shopping.naver.com/book/catalog/32485592881','철학'),(118,NULL,'깨진 틈이 있어야 그 사이로 빛이 들어온다','니체',NULL,NULL,'고통과 상처를 통해 찾는 삶의 의미와 희망','img/c17.jpg','https://search.shopping.naver.com/book/catalog/47690626625','철학'),(119,NULL,'나를 아프게 한 말들이 모두 진실은 아니었다','마르쿠스 아우렐리우스',NULL,NULL,'스토아 철학을 통한 마음의 평정과 내적 성장','img/c18.jpg','https://shopping.naver.com/book/catalog/46881757625','철학'),(120,NULL,'왜 당신은 다른 사람을 위해 살고 있는가','고윤',NULL,NULL,'진정한 자아와 독립적인 삶에 대한 철학적 탐구','img/c19.jpg','https://search.shopping.naver.com/book/catalog/45695882619','철학'),(121,NULL,'캐드','시튼스 스케치',NULL,NULL,'정교한 설계 프로그램 \'캐드\'를 다루는 건축 디자이너들의 치열한 세계를 그린 소설. 복잡한 도면처럼 얽힌 인물들의 관계와 꿈, 그리고 사랑 속에서 각자의 이상적인 공간과 삶을 구축해나가는 과정을 섬세하게 담아냈다.','img/추천1.jpg','https://search.shopping.naver.com/book/catalog/48590624623','시/소설'),(122,NULL,'하늘과 바람과 별과 시','윤동주',NULL,NULL,'한국 근대시의 정수','img/tl1.jpg','https://search.shopping.naver.com/book/catalog/32488887849','시/소설'),(123,NULL,'진달래꽃','김소월',NULL,NULL,'한국 서정시의 대표작','img/tl2.jpg','https://search.shopping.naver.com/book/catalog/32486927231','시/소설'),(124,NULL,'꽃','김춘수',NULL,NULL,'존재론적 탐구를 담은 대표 시집','img/tl3.jpg','https://search.shopping.naver.com/book/catalog/32486927242','시/소설'),(125,NULL,'님의 침묵','한용운',NULL,NULL,'독립과 사랑을 노래한 민족시','img/tl4.jpg','https://search.shopping.naver.com/book/catalog/32488887955','시/소설'),(126,NULL,'별 헤는 밤','윤동주',NULL,NULL,'서정성과 저항 정신의 조화','img/tl5.jpg','https://search.shopping.naver.com/book/catalog/32488887849','시/소설'),(127,NULL,'서랍에 저녁을 넣어 두었다','한강',NULL,NULL,'일상의 소중함을 시적으로 담아낸 감성적 에세이','img/tl6.jpg','https://search.shopping.naver.com/book/catalog/32482038161','시/소설'),(128,NULL,'풀꽃','나태주',NULL,NULL,'짧지만 깊은 울림을 주는 현대시','img/tl7.jpg','https://search.shopping.naver.com/book/catalog/32486927392','시/소설'),(129,NULL,'사랑하라 한번도 상처받지 않은 것처럼','류시화 엮음',NULL,NULL,'대중에게 사랑받는 외국 시 모음','img/tl8.jpg','https://search.shopping.naver.com/book/catalog/32486926959','시/소설'),(130,NULL,'슬픔이 기쁨에게','정호승',NULL,NULL,'현실 비판과 따뜻한 시선','img/tl9.jpg','https://search.shopping.naver.com/book/catalog/32488887967','시/소설'),(131,NULL,'입속의 검은 잎','기형도',NULL,NULL,'도시인의 불안과 절망을 담은 대표작','img/tl10.jpg','https://search.shopping.naver.com/book/catalog/32488887851','시/소설'),(132,NULL,'서시','윤동주',NULL,NULL,'시대의 아픔을 노래한 대표 서시','img/tl11.jpg','https://search.shopping.naver.com/book/catalog/32488887849','시/소설'),(133,NULL,'나와 나타샤와 흰 당나귀','백석',NULL,NULL,'토속적이고 향토적인 언어','img/tl12.jpg','https://search.shopping.naver.com/book/catalog/32461160356','시/소설'),(134,NULL,'혼모노','성해나',NULL,NULL,'현대 사회의 허위와 진실을 탐구하는 예리한 통찰','img/tl13.jpg','https://search.shopping.naver.com/book/catalog/40540789623','시/소설'),(135,NULL,'소년이 온다','한강',NULL,NULL,'5·18 광주를 배경으로 한 역사의 아픔과 인간성 탐구','img/tl14.jpg','https://search.shopping.naver.com/book/catalog/32482037993','시/소설'),(136,NULL,'급류','정대건',NULL,NULL,'격동하는 시대 속 인간의 삶과 의지를 그린 힘 있는 소설','img/tl15.jpg','https://search.shopping.naver.com/book/catalog/46881757622','시/소설'),(137,NULL,'채식주의자','한강',NULL,NULL,'여성의 의식과 해방을 그린 충격적이고 강렬한 작품','img/tl16.jpg','https://search.shopping.naver.com/book/catalog/32482038162','시/소설'),(138,NULL,'작별하지 않는다','한강',NULL,NULL,'이별과 기억, 존재에 대한 철학적 성찰이 담긴 시적 소설','img/tl17.jpg','https://search.shopping.naver.com/book/catalog/32482038160','시/소설'),(139,NULL,'외눈박이 물고기의 사랑','류시화',NULL,NULL,'결핍 속에서도 사랑과 이해를 찾아가는 에세이.','img/tl18.jpg','https://search.shopping.naver.com/book/catalog/32486926960','시/소설'),(140,NULL,'내가 사랑하는 사람','정호승',NULL,NULL,'사랑과 존재의 의미','img/tl20.jpg','https://search.shopping.naver.com/book/catalog/32488887966','시/소설'),(141,NULL,'흰','한강',NULL,NULL,'색깔과 기억을 통해 삶과 죽음을 탐구하는 서정적 산문','img/tl21.jpg','https://search.shopping.naver.com/book/catalog/32482038163','시/소설'),(142,NULL,'듄','프랭크 허버트',NULL,NULL,'20세기 영미 SF계의 거장인 프랭크 허버트가 죽을 때까지 작업한 이 연대기는 제1부 듄Dune(1965), 제2부 듄, 메시아Dune, Messiah(1969), 제3부 듄의 후예들Children of Dune(1976), 제4부 듄의 신황제God Emperor of Dune(1981), 제5부 듄의 이단자들Heretics of Dune(1984), 제6부 듄의 신전Chapterhouse: Dune(1985) 총6부작으로 이루어져 있으며 우주 시대 3만 년의 인류 역사가 담겨 있다. 『듄』은 공상 과학 소설이라는 장르 문학에 속하면서도 화려한 주인공들과 플롯의 탄탄함에 힘입어 이례적으로 출간 이후 현재까지 1200만 부 이상이 팔렸다. 프랭크 허버트가 6년 간의 자료 조사 끝에 착수한 사막의 행성, 듄이라는 인류 미래의 세계를 그리는 작업은 그의 아들 브라이언 허버트가 이어받아 지금도 계속되고 있다.','img/s4.jpg','https://search.shopping.naver.com/book/catalog/32488887752','SF/판타지'),(143,NULL,'반지의 제왕 1','J.R.R. 톨킨',NULL,NULL,'판타지 장르의 절대적 고전 1','img/s1.jpg','https://search.shopping.naver.com/book/catalog/32486927389','SF/판타지'),(144,NULL,'반지의 제왕 2','J.R.R. 톨킨',NULL,NULL,'판타지 장르의 절대적 고전 2','img/s2.jpg','https://search.shopping.naver.com/book/catalog/32486927389','SF/판타지'),(145,NULL,'파운데이션','아이작 아시모프',NULL,NULL,'SF의 바이블이자 우주 오페라의 대명사','img/s3.jpg','https://search.shopping.naver.com/book/catalog/32470076210','SF/판타지'),(146,NULL,'듄','프랭크 허버트',NULL,NULL,'생태, 종교, 정치 등 깊이 있는 세계관의 SF 걸작','img/s4.jpg','https://search.shopping.naver.com/book/catalog/32488887752','SF/판타지'),(147,NULL,'어스시의 마법사','어슐러 르 귄',NULL,NULL,'판타지 문학에 깊이를 더한 작품','img/s5.jpg','https://search.shopping.naver.com/book/catalog/32485593025','SF/판타지'),(148,NULL,'1984','조지 오웰',NULL,NULL,'디스토피아 SF의 경전','img/s6.jpg','https://search.shopping.naver.com/book/catalog/32466981997','SF/판타지'),(149,NULL,'멋진 신세계','올더스 헉슬리',NULL,NULL,'기술 발전이 가져온 비극적 미래 예언','img/s7.jpg','https://search.shopping.naver.com/book/catalog/32482038166','SF/판타지'),(150,NULL,'해리 포터 시리즈','J.K. 롤링',NULL,NULL,'현대 판타지의 문화 아이콘','img/s8.jpg','https://search.shopping.naver.com/book/catalog/32445834873','SF/판타지'),(151,NULL,'우리가 빛의 속도로 갈 수 없다면','김초엽',NULL,NULL,'한국 SF의 새로운 가능성을 보여준 단편집','img/s9.jpg','https://search.shopping.naver.com/book/catalog/32487161393','SF/판타지'),(152,NULL,'지구 끝의 온실','김초엽',NULL,NULL,'기후 변화와 인류의 미래를 다룬 장편 SF','img/s10.jpg','https://search.shopping.naver.com/book/catalog/32436139200','SF/판타지'),(153,NULL,'은하수를 여행하는 히치하이커를 위한 안내서','더글러스 애덤스',NULL,NULL,'유머러스하고 기발한 우주 여행 SF 코미디','img/s11.jpg','https://search.shopping.naver.com/book/catalog/32486927238','SF/판타지'),(154,NULL,'파리대왕','윌리엄 골딩',NULL,NULL,'문명과 야만성에 대한 깊이 있는 탐구','img/s12.jpg','https://search.shopping.naver.com/book/catalog/32485593024','SF/판타지'),(155,NULL,'사이보그가 되다','김초엽, 김원영',NULL,NULL,'기술과 인간의 경계에 대한 현대적 성찰','img/s13.jpg','https://search.shopping.naver.com/book/catalog/32441695629','SF/판타지'),(156,NULL,'스페이스 오디세이','아서 C. 클라크',NULL,NULL,'인류의 기원과 진화를 탐구한 SF','img/s14.jpg','https://search.shopping.naver.com/book/catalog/32488887853','SF/판타지'),(157,NULL,'백만 광년의 고독 속에서 한 줄의 시를 읽다','류시화',NULL,NULL,'우주적 스케일에서 바라본 인간 존재의 의미','img/s15.jpg','https://search.shopping.naver.com/book/catalog/32486926958','SF/판타지'),(158,NULL,'나는 전설이다','리처드 매드슨',NULL,NULL,'포스트 아포칼립스 장르의 원형','img/s16.jpg','https://search.shopping.naver.com/book/catalog/32486927236','SF/판타지'),(159,NULL,'호밀밭의 파수꾼','J.D. 샐린저',NULL,NULL,'청소년 성장 소설의 고전','img/s17.jpg','https://search.shopping.naver.com/book/catalog/32485593023','SF/판타지'),(160,NULL,'시녀 이야기','마거릿 애트우드',NULL,NULL,'페미니즘 디스토피아 소설','img/s18.jpg','https://search.shopping.naver.com/book/catalog/32470076214','SF/판타지'),(161,NULL,'장미의 이름','움베르토 에코',NULL,NULL,'중세 수도원을 배경으로 한 지적 추리 소설','img/s19.jpg','https://search.shopping.naver.com/book/catalog/32436139198','SF/판타지'),(162,NULL,'설국열차','자크 로브',NULL,NULL,'계급 사회를 풍자한 포스트 아포칼립스','img/s20.jpg','https://search.shopping.naver.com/book/catalog/32486927394','SF/판타지');
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
-- Table structure for table `reviews`
--

DROP TABLE IF EXISTS `reviews`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reviews` (
  `review_id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `book_id` int NOT NULL,
  `rating` tinyint NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `content` text,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`review_id`),
  KEY `user_id` (`user_id`),
  KEY `book_id` (`book_id`),
  CONSTRAINT `reviews_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE,
  CONSTRAINT `reviews_ibfk_2` FOREIGN KEY (`book_id`) REFERENCES `books` (`book_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reviews`
--

LOCK TABLES `reviews` WRITE;
/*!40000 ALTER TABLE `reviews` DISABLE KEYS */;
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
INSERT INTO `users` VALUES (1,'sst7050','$2a$10$IDwHRwbvpCJiS9erIOdra.5nAmIrM3w1AASBQO9DFv3nci6sW7DXG','gustjr','sst@naver.com','M','INTP','2025-07-03 15:06:00','2025-07-09 17:28:43','active','science,coding,fashion,technology,education',NULL,'현석'),(2,'s12345','$2a$10$rSEx5k9Yr8iPhG7fVOfbye2i9urzEfZEtJqVQIsGsHwWS8tgXKAFC','현석','sss@naver.com','M','INFP','2025-07-04 14:30:01','2025-07-04 14:30:32','withdrawn','reading,technology','2025-07-04 05:33:09','심현석'),(3,'sst2525','$2a$10$TZArtraBdlw.09n8R8qFWeIWQ.5hp2o0FHcKc9Bv/CEP2t42VIYNW','현수','sst23@naver.com','F','ENFJ','2025-07-07 17:46:01',NULL,'active','reading,travel,technology',NULL,'심현수'),(4,'sst1999','$2a$10$qdJf0ghROstgtAA9HLct8ej2z42LRbQfkB9QupH/SCGSYepQxIiai','현석심','asdasd@naver.com','M','ESTJ','2025-07-08 10:45:07',NULL,'active','reading,gaming,fashion',NULL,'현석심'),(5,'sst1995','$2a$10$lkF5zX5Y3LcyuP/.XnnwAuR9V5ShsPwl9lFfv2LDzI/7Wku6bRE6q','현석아','dfddf@naver.com','M','ENTP','2025-07-08 10:56:35',NULL,'active','movie,gaming,coding',NULL,'현석심이'),(6,'shs1999','$2a$10$xvUr4bxGUze2XpDLulsx3OlxcLOe8KOlDYcqGVjKFkhc1uZ7fl/V.','현석이','sstt@naver.com','M','ESFJ','2025-07-08 11:04:06','2025-07-09 16:28:22','withdrawn','reading,travel,science','2025-07-09 07:28:35','현석아'),(7,'sst2050','$2a$10$lyyStqCCGlosgewljJGgS.r.ws9swV8YmorkKQmXQavXnud8BI0zW','현수스','sst70500@naver.com','M','ENTJ','2025-07-08 11:06:29',NULL,'active','movie,gaming,coding',NULL,'현수심'),(8,'yasuo','$2a$10$f0EUW9TerwI.ugyH3jeqAeb21vHlbUxnaH8ZmnF6HsO70MI8Y2CB.',' yasuo','yasuo@naver.com','M','ENTJ','2025-07-08 11:08:42',NULL,'active','gaming,coding,fashion',NULL,'야스오'),(9,'yone','$2a$10$ly9Jg.K0OL6Hy9YUXX4m3OCHYrW0c0Imh4NicMpxEOQcEw6o1CBO2','요네','yone@naver.com','M','ENTJ','2025-07-08 11:12:47','2025-07-08 14:19:00','withdrawn','gaming','2025-07-08 05:19:13','요네스'),(10,'timo','$2a$10$Q0PX8bQmftY45PFjyTNk7.0P50zB1UmxTT4ZC0OuDZ6W7.JUtqV5S','티모','timo@naver.com','M','ENFJ','2025-07-08 11:26:29','2025-07-08 12:41:34','active','reading',NULL,'티모'),(11,'sss','$2a$10$0n/52FGfPkotU1Aot56/C.FakooU7Q4j5OcXbcsnXG4a19xfqUhmy','sss','ssssss@naver.com','F','ISFJ','2025-07-08 16:04:10',NULL,'active','cooking,fashion',NULL,'sss');
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
INSERT INTO `wishlists` VALUES (1,30,'2025-07-09 07:20:00'),(1,31,'2025-07-09 07:20:01'),(1,32,'2025-07-09 07:20:02'),(1,46,'2025-07-09 08:29:17'),(1,49,'2025-07-09 08:29:18'),(1,60,'2025-07-09 08:29:03'),(1,65,'2025-07-09 08:29:05');
/*!40000 ALTER TABLE `wishlists` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-07-09 17:34:40
