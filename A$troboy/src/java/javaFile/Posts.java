/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package javaFile;

/**
 *
 * @author A$troboy
 */
public class Posts {
    private int id;
    private String username;
    private String time;
    private int id_ofthread;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getTime() {
        return time;
    }

    public void setTime(String time) {
        this.time = time;
    }

    public int getId_ofthread() {
        return id_ofthread;
    }

    public void setId_ofthread(int id_ofthread) {
        this.id_ofthread = id_ofthread;
    }
}
