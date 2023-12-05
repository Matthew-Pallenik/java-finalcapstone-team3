package com.techelevator.model;

public class PathwayResponse {

    // Private fields to store pathway information
    private int id;
    private String title;
    private String description;
    private String key;
    private String link;

    //Default constructor
    public PathwayResponse() { }

    //Parameterized constructor to initialize the pathway with values
    public PathwayResponse(int id, String title, String description, String key, String link){
        this.id = id;
        this.title = title;
        this.description = description;
        this.key = key;
        this.link = link;
    }

    //Getters and Setters
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

    public String getLink() {
        return title;
    }

    public void setLink(String link) {
        this.link = link;
    }
}
