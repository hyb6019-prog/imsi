package kr.co.iei.board.model.service;

import java.sql.Connection;
import java.util.List; // List 사용 권장
import common.JDBCTemplate;
import kr.co.iei.board.model.dao.BoardDao;
import kr.co.iei.board.model.vo.Board;

public class BoardService {

    private final BoardDao boardDao;

    public BoardService() {
        this.boardDao = new BoardDao();
    }

    public List<Board> selectBoardWriter(String boardWriter) {
        Connection conn = null;
        try {
            conn = JDBCTemplate.getConnection();
            // DAO 메서드가 List<Board>를 반환한다고 가정
            return boardDao.selectBoardWriter(conn, boardWriter);
        } catch (RuntimeException e) {
            // DAO에서 RuntimeException으로 감싸 던지는 경우를 처리
            // (프로젝트 규칙에 맞게 로그/전환)
            throw e;
        } finally {
            JDBCTemplate.close(conn); // 예외가 나도 항상 닫힘
        }
    }
}