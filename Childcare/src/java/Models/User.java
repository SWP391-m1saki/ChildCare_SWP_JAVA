package Models;


import java.time.LocalDate;

/**
 *
 * @author Misaki
 */
public class User {
    private int id;
    private String email, password, name;
    private Boolean gender;
    private LocalDate dob;
    private int roleId;
    private String phoneNumber, address, avatar;
    private int status;

    public User() {
    }

    public User(int id, String email, String password, String name, Boolean gender, LocalDate dob, int roleId, String phoneNumber, String address, String avatar, int status) {
        this.id = id;
        this.email = email;
        this.password = password;
        this.name = name;
        this.gender = gender;
        this.dob = dob;
        this.roleId = roleId;
        this.phoneNumber = phoneNumber;
        this.address = address;
        this.avatar = avatar;
        this.status = status;
    }

   public User(String email, String password, String name, Boolean gender, LocalDate dob, int roleId, String phoneNumber, String address, String avatar, int status) {
        this.email = email;
        this.password = password;
        this.name = name;
        this.gender = gender;
        this.dob = dob;
        this.roleId = roleId;
        this.phoneNumber = phoneNumber;
        this.address = address;
        this.avatar = avatar;
        this.status = status;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }


    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPhoneNumber() {
        return phoneNumber;
    }

    public void setPhoneNumber(String phoneNumber) {
        this.phoneNumber = phoneNumber;
    }

    public int getRoleId() {
        return roleId;
    }

    public void setRoleId(int roleId) {
        this.roleId = roleId;
    }

    public LocalDate getDob() {
        return dob;
    }

    public void setDob(LocalDate dob) {
        this.dob = dob;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getAvatar() {
        return avatar;
    }

    public void setAvatar(String avatar) {
        this.avatar = avatar;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }
    
    public Boolean isGender(){
        return gender;
    }
    
    public void setGender(Boolean gender){
        this.gender = gender;
    }

    @Override
    public String toString() {
        return "User{" + "id=" + id + ", email=" + email + ", password=" + password + ", name=" + name + ", gender=" + gender + ", dob=" + dob + ", roleId=" + roleId + ", phoneNumber=" + phoneNumber + ", address=" + address + ", avatar=" + avatar + ", status=" + status + '}';
    }
    
    
}
 