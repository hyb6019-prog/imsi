package jdbc_memo_model.vo;

import java.sql.Date;

public class Memo {
	private int memoId;
	private String memoWriter;
	private String memoContent;
	private Date writeDate; 
	public Memo() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Memo(int memoId, String memoWriter, String memoContent, Date writeDate) {
		super();
		this.memoId = memoId;
		this.memoWriter = memoWriter;
		this.memoContent = memoContent;
		this.writeDate = writeDate;
	}
	public int getMemoId() {
		return memoId;
	}
	public void setMemoId(int memoId) {
		this.memoId = memoId;
	}
	public String getMemoWriter() {
		return memoWriter;
	}
	public void setMemoWriter(String memoWriter) {
		this.memoWriter = memoWriter;
	}
	public Date getWriteDate() {
		return writeDate;
	}
	public void setWriteDate(Date writeDate) {
		this.writeDate = writeDate;
	}
	public String getMemoContent() {
		return memoContent;
	}
	public void setMemoContent(String memoContent) {
		this.memoContent = memoContent;
	}
	@Override
	public String toString() {
		return "Memo [memoId=" + memoId + ", memoWriter=" + memoWriter + ", memoContent="
				+ memoContent + ", writeDate=\" + writeDate + \"]";
	}
	
}
