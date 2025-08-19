package kr.co.iei.memo.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.co.iei.memo.service.MemoService;
import kr.co.iei.memo.vo.Memo;


/**
 * Servlet implementation class GetMemoIdServlet
 */
@WebServlet("/getMemoId")
public class GetMemoIdServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public GetMemoIdServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		int memoId = Integer.parseInt(request.getParameter("memoId")); 
		
		MemoService memoService = new MemoService();
		Memo m = memoService.selectMemoId(memoId);
		RequestDispatcher view = request.getRequestDispatcher("/WEB-INF/jsp/getMemoId.jsp");
		request.setAttribute("oneMemo", m);
		view.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
