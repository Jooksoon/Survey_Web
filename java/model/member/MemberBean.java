package model.member;
 
// �������� ������ ����ϴ� Ŭ���� - DTO
public class MemberBean 
{
    private String id;            // ���̵�
    private String password;     // ��й�ȣ
    private String name;        // �̸�
    private String gender;        // ����
    private String birth;       //�������
    private String mail1;        // �̸��� - @ �պκ�
    private String mail2;        // �̸��� - @ �޺κ�
    private String phone;        // ��ȭ
    private String address;        // �ּ�
    
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