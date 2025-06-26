# 📚 책 추천 웹사이트 프로젝트

## 🚀 프로젝트 소개
이 프로젝트는 사용자에게 개인화된 책 추천을 제공하고, 독서 경험을 공유할 수 있는 커뮤니티 기능을 제공하는 웹사이트입니다. 회원가입, 로그인, 마이페이지 관리, AI/셀럽 추천, 사용자 플레이리스트, 리뷰 작성 등 다양한 기능을 통해 사용자가 자신에게 맞는 책을 쉽게 찾고, 다른 독자들과 소통할 수 있도록 지원합니다.

본 프로젝트는 총 9일의 초고속 스프린트로 진행되며, 핵심 기능 구현 및 배포를 목표로 합니다.

## ✨ 주요 기능
* **회원 시스템:**
    * **회원가입:** 아이디, 비밀번호, 닉네임, 이메일, MBTI, 취미/관심사 등 상세 정보 입력 및 유효성 검사.
    * **로그인:** 일반 로그인 및 카카오/네이버/구글 SNS 연동 로그인.
    * **계정 관리:** 아이디/비밀번호 찾기, 회원정보 수정, 비밀번호 변경, 회원 탈퇴.
* **책 추천:**
    * **AI 추천:** 사용자 관심사, MBTI, 독서 이력 등을 기반으로 한 맞춤 책 추천 (초기 버전은 해시태그 기반).
    * **셀럽 추천:** 특정 분야 전문가나 유명인의 추천 도서 리스트 제공 및 상세 정보.
    * **플레이리스트:** 사용자가 직접 책을 묶어 만든 테마별 목록 관리.
* **책 탐색 및 정보:**
    * 네이버 책 검색 API 연동을 통한 방대한 책 정보 제공.
    * 책 상세 정보 페이지.
* **커뮤니티:**
    * **리뷰:** 책에 대한 별점 및 상세 리뷰 작성, 목록 조회, 수정, 삭제 기능.
    * **찜 목록:** 관심 있는 책이나 리뷰를 찜하여 관리.
* **사용자 인터페이스:**
    * 직관적인 메인 페이지, 내비게이션, 푸터.
    * 반응형 웹 디자인 (핵심 페이지 우선).

## 🛠️ 기술 스택
* **프론트엔드:**
    * JSP (JavaServer Pages)
    * HTML5, CSS3
    * JavaScript
* **백엔드:**
    * Java (Servlet)
    * JDBC
* **데이터베이스:**
    * MySQL 8.0+
* **서버:**
    * Apache Tomcat 9.x
* **버전 관리:**
    * Git, GitHub
* **외부 API:**
    * 네이버 도서 검색 API
    * (선택) 카카오, 네이버, 구글 소셜 로그인 API

## 💻 설치 및 실행 방법

### 1. 개발 환경 준비
* **JDK (Java Development Kit):** OpenJDK 11+ 권장
* **Apache Tomcat:** Tomcat 9.x 버전 다운로드 및 설치
* **MySQL Server:** MySQL 8.0+ 다운로드 및 설치
* **MySQL Workbench 또는 SQL 클라이언트:** (DB 관리 툴)
* **IDE:** Eclipse (EE 버전) 또는 IntelliJ IDEA Ultimate (웹 개발 기능 포함)
* **Git:** 설치 및 설정

### 2. 데이터베이스 설정
1.  **MySQL 서버 실행**
2.  **데이터베이스 스키마 생성:**
    MySQL 클라이언트(Workbench 등)에 접속하여 `book_recommendation_db` 스키마를 생성합니다.
    ```sql
    CREATE SCHEMA IF NOT EXISTS book_recommendation_db
    DEFAULT CHARACTER SET utf8mb4
    COLLATE utf8mb4_unicode_ci;
    ```
3.  **테이블 생성:**
    프로젝트 Git 저장소의 `db/` 폴더 내에 있는 `schema.sql` (또는 `create_tables.sql`) 파일을 실행하여 모든 테이블을 생성합니다.
    ```bash
    -- Git clone 후 프로젝트 폴더로 이동
    cd your-project-name
    -- MySQL 클라이언트를 통해 스크립트 실행 (예시)
    mysql -u root -p book_recommendation_db < db/schema.sql
    ```
    *(`your_root_password` 대신 MySQL root 계정 비밀번호 입력)*

### 3. 프로젝트 설정
1.  **Git Clone:** GitHub에서 프로젝트 저장소를 로컬로 클론합니다.
    ```bash
    git clone [https://github.com/YourGitHubUsername/book-recommendation-website.git](https://github.com/YourGitHubUsername/book-recommendation-website.git)
    cd book-recommendation-website
    ```
2.  **IDE에서 프로젝트 임포트:**
    * **Eclipse:** `File` > `Import` > `Web` > `Existing Dynamic Web Project` 선택 후 프로젝트 폴더 선택.
    * **IntelliJ IDEA:** `File` > `Open` 선택 후 프로젝트 폴더 선택. (Maven/Gradle 프로젝트라면 자동으로 인식)
3.  **JDBC 드라이버 설정:**
    MySQL Connector/J (JDBC 드라이버) `.jar` 파일을 다운로드하여 프로젝트의 `WEB-INF/lib` 폴더에 추가합니다. (IDE에서 빌드 경로에 자동으로 추가될 수 있음)
4.  **데이터베이스 연결 정보 설정:**
    프로젝트 코드 내에서 MySQL 연결 정보를 설정하는 부분(예: `DBConnection` 클래스, `context.xml` 등)을 찾아 로컬 DB 정보에 맞게 수정합니다.
    * DB URL: `jdbc:mysql://localhost:3306/book_recommendation_db?serverTimezone=UTC&characterEncoding=UTF-8`
    * DB User: `root` (또는 설정한 사용자명)
    * DB Password: `your_root_password` (또는 설정한 비밀번호)
5.  **Tomcat 서버 설정:**
    IDE에서 Tomcat 서버를 설정하고, 이 프로젝트를 서버에 배포하도록 구성합니다.

### 4. 애플리케이션 실행
1.  IDE에서 설정한 Tomcat 서버를 시작합니다.
2.  웹 브라우저를 열고 `http://localhost:8080/your_project_context_path` (프로젝트 설정에 따라 다름, 보통 `/book-recommendation-website` 또는 `/`) 로 접속합니다.

## 📅 프로젝트 스케줄 (9일 초고속 스프린트)
본 프로젝트는 아래와 같이 압축된 9일간의 스케줄로 진행됩니다. 각 팀원은 매일 할당된 역할에 따라 핵심 기능을 집중적으로 개발합니다.

* **1일차:** 프로젝트 킥오프, 환경 설정, DB/FE 기본 구조 설계
* **2일차:** 핵심 백엔드 (회원 인증), FE 기본 페이지 UI
* **3일차:** 백엔드 인증 심화, FE 통합 시작
* **4일차:** 백엔드 핵심 기능 (회원정보/리뷰), 메인 페이지 UI
* **5일차:** AI/검색 백엔드, 플레이리스트/추천 UI
* **6일차:** 모든 기능 백엔드/프론트엔드 통합
* **7일차:** 전체 통합 테스트 및 초기 QA, 버그 로깅
* **8일차:** 버그 수정, 리팩토링, 배포 준비
* **9일차:** 최종 QA 및 배포, 프로젝트 회고

(더 상세한 일일 To-Do 리스트는 내부 문서 또는 프로젝트 위키를 참조하세요.)

## 👥 팀원
| 역할 | 이름 | 담당 주요 기능 |
| :--- | :--- | :------------- |
| **팀장** 프론트엔드 리드 | 노소윤 | 메인 페이지, 공통 UI (헤더/푸터/내비), UI/UX 가이드, FE 배포 |
| 백엔드/DB/API | 심현석 | 회원 시스템, 책/리뷰 API, DB 설계/구축, 네이버 API 연동, 서버 배포 |
| 마이페이지/플레이리스트 | 채웅일 | 마이페이지 (정보수정/탈퇴/찜), 플레이리스트 |
| 리뷰/셀럽 추천 | 황다예 | 리뷰 시스템 (작성/조회), 셀럽 추천 기능 |

## 📄 라이선스
이 프로젝트는 [라이선스 유형, 예: MIT License]에 따라 공개됩니다. (원하는 라이선스 명시)

---
