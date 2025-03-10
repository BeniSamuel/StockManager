package org.example.services;

import org.example.abstracts.UserDao;
import org.example.dao.UserDaoImpl;
import org.example.models.User;

public class UserService {
    private final UserDao userDAO;

    public UserService() {
        this.userDAO = new UserDaoImpl();
    }

    public boolean registerUser(User user) {
        return userDAO.registerUser(user);
    }

    public User loginUser(String email, String password) {
        return userDAO.loginUser(email, password);
    }

//    public boolean userExists(String email) {
//        return userDAO.userExists(email);
//    }
}
