package org.example.services;

import org.example.abstracts.ProductDao;
import org.example.dao.ProductDaoImpl;
import org.example.models.Product;
import java.util.List;

public class ProductService {
    private final ProductDao productDAO;

    public ProductService() {
        this.productDAO = new ProductDaoImpl();
    }

    public boolean addProduct(Product product) {
        return productDAO.addProduct(product);
    }

    public boolean updateProduct(Product product) {
        return productDAO.updateProduct(product);
    }

    public boolean deleteProduct(int id) {
        return productDAO.deleteProduct(id);
    }

    public Product getProductById(int id) {
        return productDAO.getProductById(id);
    }

    public List<Product> getAllProducts() {
        return productDAO.getAllProducts();
    }
}
