package SQLSource;

public class UserDTO {

	private String pw, pw2, name, birth, id, gender, quest, answer;
	
	public UserDTO(String id, String pw, String pw2, String name, String gender, String birth, String quest, String answer) {
		this.id = id;
		this.pw = pw;
		this.pw2 = pw2;
		this.name = name;
		this.birth = birth;
		this.quest = quest;
		this.answer = answer;
				
		
		if(gender.equals("³²ÀÚ")){
			this.gender = "M";
		}
		else{
			this.gender = "F";
		}
	}//constructor

	public boolean isUserInfoSubmitCompletly(){
		if(id.equals("") || pw.equals("") || pw2.equals("") || name.equals("") || gender.equals("") || birth.equals("") || quest.equals("") || answer.equals("")){
			return false;
		}
		return true;
	}
	
	public boolean isPasswordMatched(){
		if(!pw.equals(pw2)){
			return false;
		}
		return true;
	}
	
	public String getPw() {
		return pw;
	}

	public void setPw(String pw) {
		this.pw = pw;
	}
	
	public String getPw2() {
		return pw2;
	}

	public void setPw2(String pw2) {
		this.pw2 = pw2;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getBirth() {
		return birth;
	}

	public void setBirth(String birth) {
		this.birth = birth;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public String getQuest() {
		return quest;
	}

	public void setQuest(String quest) {
		this.quest = quest;
	}

	public String getAnswer() {
		return answer;
	}

	public void setAnswer(String answer) {
		this.answer = answer;
	}

	
	
	
}
