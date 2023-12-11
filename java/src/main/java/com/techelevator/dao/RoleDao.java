package com.techelevator.dao;


import com.techelevator.model.Role;
import java.util.List;

public interface RoleDao {

    Role getRoleById(int id);
    List<Role> getRolesByKey(String key);
}
