package kr.co.iei.memo.vo;

public class Memo {
	
	private int memoId;
	private String memoTitle;
	private String memoContent;
	private String memoWriter;
	private String writeDate;
	public Memo() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Memo(int memoId, String memoTitle, String memoContent, String memoWriter, String writeDate) {
		super();
		this.memoId = memoId;
		this.memoTitle = memoTitle;
		this.memoContent = memoContent;
		this.memoWriter = memoWriter;
		this.writeDate = writeDate;
	}
	public int getMemoId() {
		return memoId;
	}
	public void setMemoId(int memoId) {
		this.memoId = memoId;
	}
	public String getMemoTitle() {
		return memoTitle;
	}
	public void setMemoTitle(String memoTitle) {
		this.memoTitle = memoTitle;
	}
	public String getMemoContent() {
		return memoContent;
	}
	public void setMemoContent(String memoContent) {
		this.memoContent = memoContent;
	}
	public String getMemoWriter() {
		return memoWriter;
	}
	public void setMemoWriter(String memoWriter) {
		this.memoWriter = memoWriter;
	}
	public String getWriteDate() {
		return writeDate;
	}
	public void setWriteDate(String writeDate) {
		this.writeDate = writeDate;
	}
	@Override
	public String toString() {
		return "Memo [memoId=" + memoId + ", memoTitle=" + memoTitle + ", memoContent=" + memoContent + ", memoWriter="
				+ memoWriter + ", writeDate=" + writeDate + "]";
	}
	
}
