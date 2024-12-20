package vn.edu.hcmuaf.fit.project_fruit.dao.model;

import java.io.Serializable;

public class Product implements Serializable {
    private int id;
    private String name;
    private String img;
    private double price;
    private String rating;
    private String status;
    private String describe;
    private String promotion;
    private int quantity;
    private String origin;
    private String entry_date;
    private String shelf_life;

    public Product( int id,String name, String img, double price, String status, String rating, String describe, String promotion, int quantity, String origin,String entry_date, String shelf_life ) {
        this.name = name;
        this.id = id;
        this.img = img;
        this.price = price;
        this.status = status;
        this.rating = rating;
        this.describe = describe;
        this.promotion = promotion;
        this.quantity = quantity;
        this.origin = origin;
        this.entry_date = entry_date;
        this.shelf_life = shelf_life;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getImg() {
        return img;
    }

    public void setImg(String img) {
        this.img = img;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public String getRating() {
        return rating;
    }

    public void setRating(String rating) {
        this.rating = rating;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getDescribe() {
        return describe;
    }

    public void setDescribe(String describe) {
        this.describe = describe;
    }

    public String getPromotion() {
        return promotion;
    }

    public void setPromotion(String promotion) {
        this.promotion = promotion;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public String getOrigin() {
        return origin;
    }

    public void setOrigin(String origin) {
        this.origin = origin;
    }
    public String getShelf_life() {
            return shelf_life;
    }

    public void setShelf_life(String shelf_life) {
            this.shelf_life = shelf_life;
    }

    public String getEntry_date() {
        return entry_date;
    }

    public void setEntry_date(String entry_date) {
        this.entry_date = entry_date;
    }
}


