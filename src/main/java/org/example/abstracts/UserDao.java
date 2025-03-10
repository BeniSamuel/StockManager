package org.example.abstracts;

import org.example.models.User;
import java.util.List;

public interface UserDao {
    boolean registerUser(User user);
    User loginUser(String email, String password);
    boolean deleteUser(int id);
    List<User> getAllUsers();
}
