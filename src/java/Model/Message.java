/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;

/**
 *
 * @author PC
 */
public class Message {

    private int messageID;
    private String messageContent;
    private String Image;
    private Conversationdetail convd;
    private int UserID;

    public Message() {
    }

    public Message(int messageID, String messageContent, String Image, Conversationdetail convd) {
        this.messageID = messageID;
        this.messageContent = messageContent;
        this.Image = Image;
        this.convd = convd;
        
    }

    public Message(int messageID, String messageContent) {
        this.messageID = messageID;
        this.messageContent = messageContent;
    }

    

    public String getImage() {
        return Image;
    }

    public void setImage(String Image) {
        this.Image = Image;
    }

    public Conversationdetail getConvd() {
        return convd;
    }

    public void setConvd(Conversationdetail convd) {
        this.convd = convd;
    }

    

    public int getMessageID() {
        return messageID;
    }

    public void setMessageID(int messageID) {
        this.messageID = messageID;
    }

    public String getMessageContent() {
        return messageContent;
    }

    public void setMessageContent(String messageContent) {
        this.messageContent = messageContent;
    }

    public int getUserID() {
        return UserID;
    }

    public void setUserID(int UserID) {
        this.UserID = UserID;
    }

}
