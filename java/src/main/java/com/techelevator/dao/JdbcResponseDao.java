package com.techelevator.dao;

import com.techelevator.exception.DaoException;
import com.techelevator.model.Response;
import org.springframework.jdbc.CannotGetJdbcConnectionException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.support.rowset.SqlRowSet;
import org.springframework.stereotype.Component;

import java.util.ArrayList;
import java.util.List;

@Component
public class JdbcResponseDao implements ResponseDao {

    private final JdbcTemplate jdbcTemplate;


    // Constructor to initialize JdbcTemplate
    public JdbcResponseDao(JdbcTemplate jdbcTemplate) {
        this.jdbcTemplate = jdbcTemplate;
    }


    // Retrieve a PathwayResponse by its unique identifier (id)
    @Override
    public Response getResponseByIdPathway(int id) {
        Response response = null;
        String sql = "SELECT entry_id, title, description, keywords, link FROM pathway WHERE entry_id = ?;";
        try {
            SqlRowSet results = jdbcTemplate.queryForRowSet(sql, id);
            if (results.next()) {
                response = mapRowToResponse(results);
            }
        } catch (CannotGetJdbcConnectionException e) {
            throw new DaoException("Unable to connect to server or database", e);
        }
        return response;
    }


    // Retrieve a PathwayResponse by its key
    @Override
    public Response getResponseByKeyPathway(String key) {
        Response response = null;
        key = "%" + key + "%";
        String sql = "SELECT entry_id, title, description, keywords, link FROM pathway WHERE keywords ILIKE ?;";
        try {
            SqlRowSet results = jdbcTemplate.queryForRowSet(sql, key);
            if (results.next()) {
                response = mapRowToResponse(results);
            }
        } catch (CannotGetJdbcConnectionException e) {
            throw new DaoException("Unable to connect to server or database", e);
        }
        return response;
    }


    // Retrieve a list of PathwayResponses by their key
    @Override
    public List<Response> getResponsesByKeyPathway(String key) {
        List<Response> respons = new ArrayList<>();
        key = "%" + key + "%";
        String sql = "SELECT entry_id, title, description, keywords, link FROM pathway WHERE keywords ILIKE ?;";
        try {
            SqlRowSet results = jdbcTemplate.queryForRowSet(sql, key);
            while (results.next()) {
                Response response = mapRowToResponse(results);
                respons.add(response);
            }
        } catch (CannotGetJdbcConnectionException e) {
            throw new DaoException("Unable to connect to server or database", e);
        }
        return respons;
    }

    // Retrieve a list of PathwayResponses by their description
    @Override
    public List<Response> getResponsesByDescPathway(String key) {
        List<Response> respons = new ArrayList<>();
        key = "%" + key + "%";
        String sql = "SELECT entry_id, title, description, keywords, link FROM pathway WHERE description ILIKE ?;";
        try {
            SqlRowSet results = jdbcTemplate.queryForRowSet(sql, key);
            while (results.next()) {
                Response response = mapRowToResponse(results);
                respons.add(response);
            }
        } catch (CannotGetJdbcConnectionException e) {
            throw new DaoException("Unable to connect to server or database", e);
        }
        return respons;
    }

    // Retrieve a CurriculumResponse by its unique identifier (id)
    @Override
    public Response getResponseByIdCurriculum(int id) {
        Response response = null;
        String sql = "SELECT entry_id, title, description, keywords, link FROM curriculum WHERE entry_id = ?;";
        try {
            SqlRowSet results = jdbcTemplate.queryForRowSet(sql, id);
            if (results.next()) {
                response = mapRowToResponse(results);
            }
        } catch (CannotGetJdbcConnectionException e) {
            throw new DaoException("Unable to connect to server or database", e);
        }
        return response;
    }

    // Retrieve a CurriculumResponse by its key
    @Override
    public Response getResponseByKeyCurriculum(String key) {
        Response response = null;
        key = "%" + key + "%";
        String sql = "SELECT entry_id, title, description, keywords, link FROM curriculum WHERE keywords ILIKE ?;";
        try {
            SqlRowSet results = jdbcTemplate.queryForRowSet(sql, key);
            if (results.next()) {
                response = mapRowToResponse(results);
            }
        } catch (CannotGetJdbcConnectionException e) {
            throw new DaoException("Unable to connect to server or database", e);
        }
        return response;
    }

    // Retrieve a list of CurriculumResponses by their key
    @Override
    public List<Response> getResponsesByKeyCurriculum(String key) {
        List<Response> respons = new ArrayList<>();
        key = "%" + key + "%";
        String sql = "SELECT entry_id, title, description, keywords, link FROM curriculum WHERE keywords ILIKE ?;";
        try {
            SqlRowSet results = jdbcTemplate.queryForRowSet(sql, key);
            while (results.next()) {
                Response response = mapRowToResponse(results);
                respons.add(response);
            }
        } catch (CannotGetJdbcConnectionException e) {
            throw new DaoException("Unable to connect to server or database", e);
        }
        return respons;
    }

    // Retrieve a list of CurriculumResponses by their description
    @Override
    public List<Response> getResponsesByDescCurriculum(String key) {
        List<Response> respons = new ArrayList<>();
        key = "%" + key + "%";
        String sql = "SELECT entry_id, title, description, keywords, link FROM curriculum WHERE description ILIKE ?;";
        try {
            SqlRowSet results = jdbcTemplate.queryForRowSet(sql, key);
            while (results.next()) {
                Response response = mapRowToResponse(results);
                respons.add(response);
            }
        } catch (CannotGetJdbcConnectionException e) {
            throw new DaoException("Unable to connect to server or database", e);
        }
        return respons;
    }
    // Helper method to map a database row to a PathwayResponse object
    private Response mapRowToResponse(SqlRowSet rs) {
        Response response = new Response();
        response.setId(rs.getInt("entry_id"));
        response.setTitle(rs.getString("title"));
        response.setDescription(rs.getString("description"));
        response.setKey(rs.getString("keywords"));
        response.setLink(rs.getString("link"));
        return response;
    }
}
