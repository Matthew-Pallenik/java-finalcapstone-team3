package com.techelevator.model;

public class Role {
    private int id;
    private String title;
    private String description;
    private String key;

    public Role() {}

    public Role(int id, String title, String description, String key){
        this.id = id;
        this.title = title;
        this.description = description;
        this.key = key;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }
    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getKey() {
        return key;
    }
    public void setKey(String key) {
        this.key = key;
    }

}
