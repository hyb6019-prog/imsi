package kr.co.iei.board.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List; // List 사용 권장
import kr.co.iei.board.model.vo.Board;

public class BoardDao {

    public List<Board> selectBoardWriter(Connection conn, String boardWriter) {
        String sql =
            "SELECT board_no, board_title, board_content, board_writer, read_count " +
            "FROM board " +
            "WHERE board_writer = ? " +
            "ORDER BY board_no DESC"; // 최신 글 먼저 보고 싶을 때

        List<Board> boardList = new ArrayList<>();

        // try-with-resources: pstmt, rset 자동 close
        try (PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setString(1, boardWriter);

            try (ResultSet rset = pstmt.executeQuery()) {
                while (rset.next()) {
                    Board b = new Board();
                    b.setBoardNo(rset.getInt("board_no"));
                    b.setBoardTitle(rset.getString("board_title"));
                    b.setBoardContent(rset.getString("board_content"));
                    b.setBoardWriter(rset.getString("board_writer"));
                    b.setReadCount(rset.getInt("read_count"));
                    boardList.add(b);
                }
            }
        } catch (SQLException e) {
            // 로깅 후 상위로 올리거나, 프로젝트 규칙에 맞게 처리
            throw new RuntimeException("selectBoardWriter 조회 중 오류", e);
        }

        return boardList;
    }
}