/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;

/**
 *
 * @author vitinhthuyhoang2222
 */
public class Conversationdetail {
    private int ID;
    private UserAccount ua;
    private Conversation conv;
    private String NickName;

    public Conversationdetail(int ID, UserAccount ua, Conversation conv, String NickName) {
        this.ID = ID;
        this.ua = ua;
        this.conv = conv;
        this.NickName = NickName;
    }

    public Conversationdetail() {
    }

    public int getID() {
        return ID;
    }

    public void setID(int ID) {
        this.ID = ID;
    }

    public UserAccount getUa() {
        return ua;
    }

    public void setUa(UserAccount ua) {
        this.ua = ua;
    }

    public Conversation getConv() {
        return conv;
    }

    public void setConv(Conversation conv) {
        this.conv = conv;
    }

    

    public String getNickName() {
        return NickName;
    }

    public void setNickName(String NickName) {
        this.NickName = NickName;
    }
    
}
