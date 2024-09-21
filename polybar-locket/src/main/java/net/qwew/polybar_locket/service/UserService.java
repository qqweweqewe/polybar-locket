package net.qwew.polybar_locket.service;

import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Service;
import org.springframework.web.server.ResponseStatusException;

import net.qwew.polybar_locket.entity.User;
import net.qwew.polybar_locket.repository.UserRepository;

@Service
public class UserService {
    @Autowired
    private UserRepository userRepository;

    public String getMsgById(Long id) {
        Optional<User> user = userRepository.findById(id);
        if (user.isPresent()) {
            return user.get().getMsg();
        }
        else {
            return "User not found";
        }
    }  
    
    public User saveUser(User user) {
        return userRepository.save(user);
    }

    public User updateMsg(Long userId, String password, String newMsg) {
        User user = userRepository.findById(userId).get();
        
        if (!user.getPassword().equals(password)) {
            throw new ResponseStatusException(HttpStatus.UNAUTHORIZED, "Incorrect password");
        }
        
        user.setMsg(newMsg);
        return userRepository.save(user);
    }
}
