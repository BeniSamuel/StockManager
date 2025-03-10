package org.example.abstracts;

import org.example.models.Product;
import java.util.List;

public interface ProductDao {
    boolean addProduct(Product product);
    boolean updateProduct(Product product);
    boolean deleteProduct(int id);
    Product getProductById(int id);
    List<Product> getAllProducts();
}
