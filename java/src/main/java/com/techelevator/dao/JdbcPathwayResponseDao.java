package com.techelevator.dao;

import com.techelevator.exception.DaoException;
import com.techelevator.model.PathwayResponse;
import com.techelevator.model.User;
import org.springframework.jdbc.CannotGetJdbcConnectionException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.support.rowset.SqlRowSet;

import java.nio.file.Path;
import java.util.ArrayList;
import java.util.List;
import java.util.Objects;

public class JdbcPathwayResponseDao implements PathwayResponseDao {

    private final JdbcTemplate jdbcTemplate;

    public JdbcPathwayResponseDao(JdbcTemplate jdbcTemplate) {
        this.jdbcTemplate = jdbcTemplate;
    }
    @Override
    public PathwayResponse getResponseById(int id) {
        PathwayResponse pathwayResponse = null;
        String sql = "SELECT * FROM pathway WHERE entry_id = ?";
        try {
            SqlRowSet results = jdbcTemplate.queryForRowSet(sql, id);
            if (results.next()) {
                pathwayResponse = mapRowToPathwayResponse(results);
            }
        } catch (CannotGetJdbcConnectionException e) {
            throw new DaoException("Unable to connect to server or database", e);
        }
        return pathwayResponse;
    }


    @Override
    public PathwayResponse getResponseByKey(String key) {
        PathwayResponse pathwayResponse = null;
        key = "%" + key + "%";
        String sql = "SELECT * FROM pathway WHERE keywords ILIKE ?";
        try {
            SqlRowSet results = jdbcTemplate.queryForRowSet(sql, key);
            if (results.next()) {
                pathwayResponse = mapRowToPathwayResponse(results);
            }
        } catch (CannotGetJdbcConnectionException e) {
            throw new DaoException("Unable to connect to server or database", e);
        }
        return pathwayResponse;
    }

    @Override
    public List<PathwayResponse> getResponsesByKey(String key) {
        List<PathwayResponse> pathwayResponses = new ArrayList<>();
        key = "%" + key + "%";
        String sql = "SELECT * FROM pathway WHERE keywords ILIKE ?";
        try {
            SqlRowSet results = jdbcTemplate.queryForRowSet(sql);
            while (results.next()) {
                PathwayResponse pathwayResponse = mapRowToPathwayResponse(results);
                pathwayResponses.add(pathwayResponse);
            }
        } catch (CannotGetJdbcConnectionException e) {
            throw new DaoException("Unable to connect to server or database", e);
        }
        return pathwayResponses;
    }

    @Override
    public PathwayResponse getResponseByDesc(String key) {
        PathwayResponse pathwayResponse = null;
        key = "%" + key + "%";
        String sql = "SELECT * FROM pathway WHERE description ILIKE ?";
        try {
            SqlRowSet results = jdbcTemplate.queryForRowSet(sql, key);
            if (results.next()) {
                pathwayResponse = mapRowToPathwayResponse(results);
            }
        } catch (CannotGetJdbcConnectionException e) {
            throw new DaoException("Unable to connect to server or database", e);
        }
        return pathwayResponse;
    }

    @Override
    public List<PathwayResponse> getResponsesByDesc(String key) {
        List<PathwayResponse> pathwayResponses = new ArrayList<>();
        key = "%" + key + "%";
        String sql = "SELECT * FROM pathway WHERE description ILIKE ?";
        try {
            SqlRowSet results = jdbcTemplate.queryForRowSet(sql);
            while (results.next()) {
                PathwayResponse pathwayResponse = mapRowToPathwayResponse(results);
                pathwayResponses.add(pathwayResponse);
            }
        } catch (CannotGetJdbcConnectionException e) {
            throw new DaoException("Unable to connect to server or database", e);
        }
        return pathwayResponses;
    }

    private PathwayResponse mapRowToPathwayResponse(SqlRowSet rs) {
        PathwayResponse pathwayResponse = new PathwayResponse();
        pathwayResponse.setId(rs.getInt("entry_id"));
        pathwayResponse.setTitle(rs.getString("title"));
        pathwayResponse.setDescription(rs.getString("description"));
        pathwayResponse.setKey(rs.getString("keywords"));
        pathwayResponse.setLink(rs.getString("link"));
        return pathwayResponse;
    }
}