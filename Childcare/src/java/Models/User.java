package Models;

import java.time.LocalDate;

/**
 *
 * @author Misaki
 */
public class User {

    private int id;
    private String gmail;
    private String password;
    private String phoneNumber;
    private int roleId;
    private LocalDate dob;
    private String name, address, avatar;
    private int status;
    private boolean gender;

    public User() {
    }

    public User(int id, String gmail, String password, String phoneNumber, int roleId, LocalDate dob, String name, String address, String avatar, int status, boolean gender) {
        this.id = id;
        this.gmail = gmail;
        this.password = password;
        this.phoneNumber = phoneNumber;
        this.roleId = roleId;
        this.dob = dob;
        this.name = name;
        this.address = address;
        this.avatar = avatar;
        this.status = status;
        this.gender = gender;
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

    public String getGmail() {
        return gmail;
    }

    public void setGmail(String gmail) {
        this.gmail = gmail;
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

    public boolean isGender() {
        return gender;
    }

    public void setGender(boolean gender) {
        this.gender = gender;
    }
}
