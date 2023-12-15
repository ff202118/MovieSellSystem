/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package bean;

import java.io.Serializable;

/**
 *
 * @author LENOVO
 */
public class Movie {
    private int id = 0;
    private String name = null;
    private String author = null;
    private String press = null;
    private double sellPrice = 0; // 现价
    private double purchasePrice = 0; // 原价
    private int stock = 0;  // 余票

    public Movie() {
        this.name = null;
        this.author = null;
        this.press = null;
        this.sellPrice = 0;
        this.purchasePrice = 0;
        this.stock = 0;
    }


    public Movie(String name, String author, String press, double sellPrice, int stock) {
        this.name = name;
        this.author = author;
        this.press = press;
        this.sellPrice = sellPrice;
        this.stock = stock;
    }
    
    public Movie(String a, String b, String c, double d, double e, int f){
        this.name = a;
        this.author = b;
        this.press = c;
        this.sellPrice = d;
        this.purchasePrice = e;
        this.stock = f;
    }
    
    public Movie(int g, String a, String b, String c, double d, double e, int f){
        this.id = g;
        this.name = a;
        this.author = b;
        this.press = c;
        this.sellPrice = d;
        this.purchasePrice = e;
        this.stock = f;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }
    
    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getAuthor() {
        return author;
    }

    public void setAuthor(String author) {
        this.author = author;
    }

    public String getPress() {
        return press;
    }

    public void setPress(String press) {
        this.press = press;
    }

    public double getSellPrice() {
        return sellPrice;
    }

    public void setSellPrice(double sellPrice) {
        this.sellPrice = sellPrice;
    }

    public double getPurchasePrice() {
        return purchasePrice;
    }

    public void setPurchasePrice(double purchasePrice) {
        this.purchasePrice = purchasePrice;
    }

    public int getStock() {
        return stock;
    }

    public void setStock(int stock) {
        this.stock = stock;
    }
    
}
