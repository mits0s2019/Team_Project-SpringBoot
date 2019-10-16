package com.mainpackage.tripPlan.controllers;

import com.mainpackage.tripPlan.daos.GenericJpaDao;
import com.mainpackage.tripPlan.model.User;
import com.mainpackage.tripPlan.repositories.AdminRepo;
import com.mainpackage.tripPlan.repositories.UserRepo;
import com.mainpackage.tripPlan.services.FileService;
import com.mainpackage.tripPlan.services.UserService;
import com.mainpackage.tripPlan.utilities.Check;
import com.mainpackage.tripPlan.utilities.Encryption;
import java.io.IOException;
import java.sql.Blob;
import java.sql.SQLException;
import javax.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

@Controller
@RequestMapping(value = "user/")
public class UserController {

    @Autowired
    UserService userService;
    @Autowired
    FileService fileService;
    @Autowired
    GenericJpaDao<User> userDao;
    @Autowired
    Encryption encrypt;
    @Autowired
    UserRepo userRepo;
    @Autowired
    AdminRepo adminRepo;
    @Autowired
    Check check;

    @GetMapping(value = "logIn")
    public String logIn(ModelMap m) {
        return "logIn";
    }

    @PostMapping(value = "postLogIn")
    public String postlogIn(ModelMap m, @RequestParam(name = "username") String username, @RequestParam(name = "password") String password) {

        String role = userService.postLogIn(username, password);
        m.addAttribute("role", role);

        return "result";
    }

    @GetMapping(value = "register")
    public String form(ModelMap m) {
        User user = new User();
        m.addAttribute("user", user);
        return "register";
    }

    @PostMapping(value = "postRegister")
    public String post(@Valid @ModelAttribute("user") User user, @RequestParam("photo") MultipartFile file, BindingResult br, ModelMap m) throws IOException, SQLException {

        if (br.hasErrors()) {
            return "redirect:/user/register";
        }

        if (check.isNotNull(userRepo.findByUsername(user.getUsername()))) {
            String failed = "This username is already in use";
            m.addAttribute("failed", failed);
            return "redirect:/user/register";
        }

        fileService.setUserPhoto(file, user);
        userService.insert(user);
        return "redirect:/";
    }

}