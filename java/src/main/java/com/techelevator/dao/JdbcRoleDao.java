package com.techelevator.dao;

import com.techelevator.exception.DaoException;
import com.techelevator.model.Response;
import com.techelevator.model.Role;
import org.springframework.jdbc.CannotGetJdbcConnectionException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.support.rowset.SqlRowSet;
import org.springframework.stereotype.Component;

import java.util.ArrayList;
import java.util.List;

@Component
public class JdbcRoleDao implements RoleDao {

    private final JdbcTemplate jdbcTemplate;


    // Constructor to initialize JdbcTemplate
    public JdbcRoleDao(JdbcTemplate jdbcTemplate) {
        this.jdbcTemplate = jdbcTemplate;
    }


    @Override
    public Role getRoleById(int id) {
        Role role = null;
        String sql = "SELECT role_id, title, description, keywords FROM roles WHERE role_id = ?;";
        try {
            SqlRowSet results = jdbcTemplate.queryForRowSet(sql, id);
            if (results.next()) {
                role = mapRowToRole(results);
            }
        } catch (CannotGetJdbcConnectionException e) {
            throw new DaoException("Unable to connect to server or database", e);
        }
        return role;
    }

    @Override
    public List<Role> getRolesByKey(String key) {
        List<Role> roles = new ArrayList<>();
        String sql = "SELECT * FROM roles " +
                "WHERE keywords ILIKE '%' || ? || ' |%' " +
                "OR keywords ILIKE ? || ' |%' " +
                "OR keywords ILIKE '%' || ? " +
                "OR keywords ILIKE ?;";
        try {
            SqlRowSet results = jdbcTemplate.queryForRowSet(sql, key, key, key, key);
            while (results.next()) {
                Role role = mapRowToRole(results);
                roles.add(role);
            }
        } catch (CannotGetJdbcConnectionException e) {
            throw new DaoException("Unable to connect to server or database", e);
        }
        return roles;
    }

    private Role mapRowToRole(SqlRowSet rs) {
        Role role = new Role();
        role.setId(rs.getInt("role_id"));
        role.setTitle(rs.getString("title"));
        role.setDescription(rs.getString("description"));
        role.setKey(rs.getString("keywords"));
        return role;
    }
    }


