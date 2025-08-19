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
 * Servlet implementation class UpdateCompServlet
 */
@WebServlet("/updateComp")
public class UpdateCompServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateCompServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		int memoId = Integer.parseInt(request.getParameter("memoId"));
		String memoTitle = request.getParameter("memoTitle");
		String memoContent = request.getParameter("memoContent");
		String memoWriter = request.getParameter("memoWriter");
		
		MemoService memoService = new MemoService();
		Memo m = new Memo();
		m.setMemoId(memoId);
		m.setMemoTitle(memoTitle);
		m.setMemoContent(memoContent);
		m.setMemoWriter(memoWriter);
		
		int result = memoService.updateMemo(m);
		if(result >0) {
//			RequestDispatcher view = request.getRequestDispatcher("/memoList");
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
