package com.techelevator.controller;
import com.techelevator.dao.RoleDao;
import com.techelevator.model.Role;
import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.server.ResponseStatusException;

import java.util.List;

@RestController
@CrossOrigin
public class RoleController {
    private RoleDao roleDao;

    // Constructor to inject RoleDao dependency
    public RoleController(RoleDao roleDao) {
        this.roleDao = roleDao;
    }

    // Endpoint to get a role by its unique identifier (id)
    @RequestMapping(path = "/role/id/{id}", method = RequestMethod.GET)
    public Role getRoleById(@PathVariable("id") int id) {
        Role role = roleDao.getRoleById(id);
        if (role == null) {
            throw new ResponseStatusException(HttpStatus.NOT_FOUND, "Response not found.");
        } else {
            return role;
        }
    }


    // Endpoint to get a list of PathwayResponses by their key
    @RequestMapping(path = "/role/{key}", method = RequestMethod.GET)
    public List<Role> getRolesByKey(@PathVariable("key") String key) {
        List<Role> role = roleDao.getRolesByKey(key);
        if (role == null) {
            throw new ResponseStatusException(HttpStatus.NOT_FOUND, "Response(s) not found.");
        } else {
            return role;
        }
    }
}
