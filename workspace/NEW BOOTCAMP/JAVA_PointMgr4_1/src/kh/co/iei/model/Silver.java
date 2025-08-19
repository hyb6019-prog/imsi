package kh.co.iei.model;

public class Silver extends Grade {

	public Silver() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Silver(String grade, String name, int point) {
		super(grade, name, point);
		// TODO Auto-generated constructor stub
	}
	
	@Override
	public double getBonusPoint() {
		return getPoint()*0.03;
	}
}
