package com.techelevator.model;

public class PathwayResponse {
    private int id;
    private String title;
    private String description;
    private String key;
    private String link;

    public PathwayResponse() { }
    public PathwayResponse(int id, String title, String description, String key, String link){
        this.id = id;
        this.title = title;
        this.description = description;
        this.key = key;
        this.link = link;
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

    public String getLink() {
        return title;
    }

    public void setLink(String link) {
        this.link = link;
    }
}
