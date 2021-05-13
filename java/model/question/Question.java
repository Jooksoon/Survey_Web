package model.question;

public class Question {
	private String title;
	private String type;
	private int multi_res;
	private int necessary;
	private int shuffle;
	
	public Question(String title, String type, int multi_res, int necessary, int shuffle) {
		this.title = title;
		this.type = type;
		this.multi_res = multi_res;
		this.necessary = necessary;
		this.shuffle = shuffle;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public int getMulti_res() {
		return multi_res;
	}
	public void setMulti_res(int multi_res) {
		this.multi_res = multi_res;
	}
	public int getNecessary() {
		return necessary;
	}
	public void setNecessary(int necessary) {
		this.necessary = necessary;
	}
	public int getShuffle() {
		return shuffle;
	}
	public void setShuffle(int shuffle) {
		this.shuffle = shuffle;
	}
	
	
}