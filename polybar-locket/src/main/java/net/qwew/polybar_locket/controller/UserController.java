package net.qwew.polybar_locket.controller;

import org.springframework.web.bind.annotation.RestController;

import net.qwew.polybar_locket.entity.UpdateMsgDTO;
import net.qwew.polybar_locket.entity.User;
import net.qwew.polybar_locket.service.UserService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;

@RestController
@RequestMapping("/api/v1/user")
public class UserController {
    
    @Autowired
    private UserService userService;

    @PostMapping
    public Long create(@RequestBody User user) {
        return userService.saveUser(user).getId();
    }
    
    @GetMapping("/{id}")
    public String getMsgById(@PathVariable Long id) {
        return userService.getMsgById(id);
    }

    @GetMapping("/test")
    public String test() {
        return "test";
    }

    @PutMapping("/{id}/msg")
    public User updateMsg(@PathVariable Long id, @RequestBody UpdateMsgDTO updateMsgDTO) {
        return userService.updateMsg(id, updateMsgDTO.getPassword(), updateMsgDTO.getMsg());
    }

    @DeleteMapping("/{id}")
    public String deleteUser(@PathVariable Long id) {
        userService.deleteUserById(id);
        return "DELETE " + id;
    }
}
