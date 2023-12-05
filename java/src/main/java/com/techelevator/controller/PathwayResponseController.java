package com.techelevator.controller;

import com.techelevator.dao.PathwayResponseDao;
import com.techelevator.model.PathwayResponse;
import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.server.ResponseStatusException;

import java.util.List;

@RestController
public class PathwayResponseController {
    private PathwayResponseDao pathwayResponseDao;

    // Constructor to inject PathwayResponseDao dependency
    public PathwayResponseController(PathwayResponseDao pathwayResponseDao){
        this.pathwayResponseDao = pathwayResponseDao;
    }


    // Endpoint to get a PathwayResponse by its unique identifier (id)
    @RequestMapping(path = "/pathwayResponses/{id}", method = RequestMethod.GET)
    public PathwayResponse getResponseById(int id) {
        PathwayResponse pathwayResponse = pathwayResponseDao.getResponseById(id);
        if (pathwayResponse == null) {
            throw new ResponseStatusException(HttpStatus.NOT_FOUND, "Response not found.");
        } else {
            return pathwayResponse;
        }
    }


    // Endpoint to get a PathwayResponse by its key
    @RequestMapping(path = "/pathwayResponses/{key}", method = RequestMethod.GET)
    public PathwayResponse getResponseByKey(String key) {
        PathwayResponse pathwayResponse = pathwayResponseDao.getResponseByKey(key);
        if (pathwayResponse == null) {
            throw new ResponseStatusException(HttpStatus.NOT_FOUND, "Response not found.");
        } else {
            return pathwayResponse;
        }
    }


    // Endpoint to get a list of PathwayResponses by their key
    @RequestMapping(path = "/{key}/responses", method = RequestMethod.GET)
    public List<PathwayResponse> getResponsesByKey(String key) {
        List<PathwayResponse> pathwayResponses = pathwayResponseDao.getResponsesByKey(key);
        if (pathwayResponses == null) {
            throw new ResponseStatusException(HttpStatus.NOT_FOUND, "Response(s) not found.");
        } else {
            return pathwayResponses;
        }
    }


    // Endpoint to get a PathwayResponse by its description
    @RequestMapping(path = "/pathwayResponses/{description}", method = RequestMethod.GET)
    public PathwayResponse getResponseByDesc(String key) {
        PathwayResponse pathwayResponse = pathwayResponseDao.getResponseByDesc(key);
        if (pathwayResponse == null) {
            throw new ResponseStatusException(HttpStatus.NOT_FOUND, "Response not found.");
        } else {
            return pathwayResponse;
        }
    }


    // Endpoint to get a list of PathwayResponses by their description
    @RequestMapping(path = "/{desc}/responses", method = RequestMethod.GET)
    public List<PathwayResponse> getResponsesByDesc(String key) {
        List<PathwayResponse> pathwayResponses = pathwayResponseDao.getResponsesByDesc(key);
        if (pathwayResponses == null) {
            throw new ResponseStatusException(HttpStatus.NOT_FOUND, "Response(s) not found.");
        } else {
            return pathwayResponses;
        }
    }

}
