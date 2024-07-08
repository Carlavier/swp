/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */

package model;

public class OrderDetail {
    private int detailId, quantity, orderId, productId;
    private double price;

    public OrderDetail(int detailId, int quantity, int orderId, int productId, double price) {
        this.detailId = detailId;
        this.quantity = quantity;
        this.orderId = orderId;
        this.productId = productId;
        this.price = price;
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

    public int getProductId() {
        return productId;
    }

    public double getPrice() {
        return price;
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

    public void setProductId(int productId) {
        this.productId = productId;
    }

    public void setPrice(double price) {
        this.price = price;
    }
    
    
}
