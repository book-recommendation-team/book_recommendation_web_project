package servlet;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dto.Review;

//ReviewTestServlet.java
@WebServlet("/reviewList")
public class ReviewListServlet extends HttpServlet {
 protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
     List<Review> reviewList = new ArrayList<>();

     reviewList.add(new Review(1, "자살일기", "쿠로다니무", request.getContextPath() + "/img/자살일기.jpg", "이제는 너에게 전부가 되므로...",4));
     reviewList.add(new Review(2, "구의 증명", "최진영", request.getContextPath() + "/img/구의증명.jpg", "사랑이란 단순한 감정 그 이상의...",5));
     reviewList.add(new Review(3, "새의 선물", "은희경", request.getContextPath() + "/img/새의선물.jpg", "전혀 예상하지 못한 감정...",5));
     reviewList.add(new Review(4, "급류", "정대건", request.getContextPath() + "/img/급류.jpg", "한 번쯤 강렬한 사랑을 해보고 싶던 적이..",4));
     reviewList.add(new Review(5, "자기앞의 생", "에밀 아자르", request.getContextPath() + "/img/자기앞의생.jpg", "언제 읽어도 가슴이 찡해지는 열네 살..",5));
     reviewList.add(new Review(6, "파과", "구병모", request.getContextPath() + "/img/파과.jpg", "조각에 대한 류의 마음은 뭐였을까..",3));
     reviewList.add(new Review(7, "작별하지 않는다", "한강", request.getContextPath() + "/img/작별하지않는다.jpg", "역사적 트라우마를 정면으로 마주하고..",5));
     reviewList.add(new Review(8, "여덟 단어", "박웅현", request.getContextPath() + "/img/여덟단어.jpg", "삶을 먼저 살아본 사람이 스포해주는..",5));
     reviewList.add(new Review(9, "스토너", "존 윌리엄스", request.getContextPath() + "/img/스토너.jpg", "이 소설에 대해선 할 말이 너무 많아 제대로..",5));
     reviewList.add(new Review(10, "사랑과 결함", "예소연", request.getContextPath() + "/img/사랑과결함.jpg", "들키고 싶지 않던 무언가를 들킨 것 같은..",4));

     request.setAttribute("reviewList", reviewList);
     request.getRequestDispatcher("/reviewList.jsp").forward(request, response);
 }
}
