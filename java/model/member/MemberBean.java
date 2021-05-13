package model.member;
 
// 데이터의 전달을 담당하는 클래스 - DTO
public class MemberBean 
{
    private String id;            // 아이디
    private String password;     // 비밀번호
    private String name;        // 이름
    private String gender;        // 성별
    private String birth;       //생년월일
    private String mail1;        // 이메일 - @ 앞부분
    private String mail2;        // 이메일 - @ 뒷부분
    private String phone;        // 전화
    private String address;        // 주소
    
    public String getId() {return id;}
    public void setId(String id) {this.id = id;}
    
    public String getPassword() {return password;}
    public void setPassword(String password) {this.password = password;}

    public String getName() {return name;}
    public void setName(String name) {this.name = name;}
    
    public String getGender() {return gender;}
    public void setGender(String gender) {this.gender = gender;}
    
    public String getBirth() {return birth;}
    public void setBirth(String birth) {this.birth = birth;}
    
    public String getMail1() {return mail1;}
    public void setMail1(String mail1) {this.mail1 = mail1;}
    public String getMail2() {return mail2;}
    public void setMail2(String mail2) {this.mail2 = mail2;}
    
    public String getPhone() {return phone;}
    public void setPhone(String phone) {this.phone = phone;}
    
    public String getAddress() {return address;}
    public void setAddress(String address) {this.address = address;}

}