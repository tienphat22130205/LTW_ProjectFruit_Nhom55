package vn.edu.hcmuaf.fit.project_fruit.service;

import vn.edu.hcmuaf.fit.project_fruit.dao.UserDao;
import vn.edu.hcmuaf.fit.project_fruit.dao.model.User;

public class UserService {
    private final UserDao userDao = new UserDao();

    public User validateUser(String email, String password) {
        return userDao.getUserByEmailAndPassword(email, password);
    }
}
