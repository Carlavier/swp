/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */

package model;

public class OrderDetail {
    private int detailId, quantity, orderId;
    private double price;
    private Product product;

    public OrderDetail(int detailId, int quantity, int orderId, double price, Product product) {
        this.detailId = detailId;
        this.quantity = quantity;
        this.orderId = orderId;
        this.price = price;
        this.product = product;
    }

    public int getDetailId() {
        return detailId;
    }

    public int getQuantity() {
        return quantity;
    }

    public int getOrderId() {
        return orderId;
    }

    public double getPrice() {
        return price;
    }

    public Product getProduct() {
        return product;
    }

    public void setDetailId(int detailId) {
        this.detailId = detailId;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public void setOrderId(int orderId) {
        this.orderId = orderId;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public void setProduct(Product product) {
        this.product = product;
    }

    
}
