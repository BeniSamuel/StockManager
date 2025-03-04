package org.example.models;

public class Product {
    private int productId = 0;
    private String productName;
    private Double productPrice;

    public Product ( String productName, Double productPrice ) {
        this.productId += 1;
        this.productName = productName;
        this.productPrice = productPrice;
    }

    public int getProductId() {
        return productId;
    }

    public Double getProductPrice() {
        return productPrice;
    }

    public String getProductName() {
        return productName;
    }

    public void setProductId(int productId) {
        this.productId = productId;
    }

    public void setProductName(String productName) {
        this.productName = productName;
    }

    public void setProductPrice(Double productPrice) {
        this.productPrice = productPrice;
    }

}
