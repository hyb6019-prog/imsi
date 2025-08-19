package kr.co.iei.memo.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.co.iei.memo.service.MemoService;
import kr.co.iei.memo.vo.Memo;

/**
 * Servlet implementation class MemoWriteService
 */
@WebServlet("/memoWrite")
public class MemoWriteService extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MemoWriteService() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		Memo m = new Memo();
		m.setMemoTitle(request.getParameter("memoTitle"));
		m.setMemoWriter(request.getParameter("memoWriter"));
		m.setMemoContent(request.getParameter("memoContent"));
		
		MemoService memoService = new MemoService();
		int result = memoService.insertMemo(m);
		
//		ArrayList<Memo> memoList = memoService.selectAllMemo();  // 전체 메모 목록 조회
//	    request.setAttribute("allMemo", memoList);               // JSP에서 사용할 수 있게 저장
		
		if(result > 0) {
			ArrayList<Memo> memoList = memoService.selectAllMemo();  
			request.setAttribute("allMemo", memoList);
//			request.setAttribute("oneMemo", m);
//			RequestDispatcher view = request.getRequestDispatcher("/WEB-INF/jsp/memoList.jsp");
//			view.forward(request, response);
			response.sendRedirect("/memoList");
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
