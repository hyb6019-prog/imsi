package kr.co.iei.memo.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.co.iei.memo.service.MemoService;
import kr.co.iei.memo.vo.Memo;

/**
 * Servlet implementation class SerchWriteFrmServlet
 */
@WebServlet("/searchWriter")
public class SerchWriteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SerchWriteServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		String memoWriter = request.getParameter("memoWriter");
		
		MemoService memoService = new MemoService();
		ArrayList<Memo> memo = memoService.selectMemoWriter(memoWriter);
		
		request.setAttribute("allMemo", memo);
		RequestDispatcher view = request.getRequestDispatcher("/WEB-INF/jsp/memoList.jsp");
		view.forward(request, response);
		
//		response.sendRedirect("/memoList");
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
