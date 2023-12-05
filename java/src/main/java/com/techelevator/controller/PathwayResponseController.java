package com.techelevator.controller;

import com.techelevator.dao.PathwayResponseDao;
import com.techelevator.model.PathwayResponse;
import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.server.ResponseStatusException;

import java.util.List;

@RestController
@CrossOrigin
public class PathwayResponseController {
    private PathwayResponseDao pathwayResponseDao;

    // Constructor to inject PathwayResponseDao dependency
    public PathwayResponseController(PathwayResponseDao pathwayResponseDao){
        this.pathwayResponseDao = pathwayResponseDao;
    }


    // Endpoint to get a PathwayResponse by its unique identifier (id)
    @RequestMapping(path = "/pathwayResponses/id/{id}", method = RequestMethod.GET)
    public PathwayResponse getResponseById(@PathVariable("id") int id) {
        PathwayResponse pathwayResponse = pathwayResponseDao.getResponseById(id);
        if (pathwayResponse == null) {
            throw new ResponseStatusException(HttpStatus.NOT_FOUND, "Response not found.");
        } else {
            return pathwayResponse;
        }
    }


    // Endpoint to get a PathwayResponse by its key
    @RequestMapping(path = "/pathwayResponses/keys/{key}", method = RequestMethod.GET)
    public PathwayResponse getResponseByKey(@PathVariable("key") String key) {
        PathwayResponse pathwayResponse = pathwayResponseDao.getResponseByKey(key);
        if (pathwayResponse == null) {
            throw new ResponseStatusException(HttpStatus.NOT_FOUND, "Response not found.");
        } else {
            return pathwayResponse;
        }
    }


    // Endpoint to get a list of PathwayResponses by their key
    @RequestMapping(path = "/responses/{key}", method = RequestMethod.GET)
    public List<PathwayResponse> getResponsesByKey(@PathVariable("key") String key) {
        List<PathwayResponse> pathwayResponses = pathwayResponseDao.getResponsesByKey(key);
        if (pathwayResponses == null) {
            throw new ResponseStatusException(HttpStatus.NOT_FOUND, "Response(s) not found.");
        } else {
            return pathwayResponses;
        }
    }


    // Endpoint to get a PathwayResponse by its description
    @RequestMapping(path = "/pathwayResponses/description/{desc}", method = RequestMethod.GET)
    public PathwayResponse getResponseByDesc(@PathVariable("desc") String key) {
        PathwayResponse pathwayResponse = pathwayResponseDao.getResponseByDesc(key);
        if (pathwayResponse == null) {
            throw new ResponseStatusException(HttpStatus.NOT_FOUND, "Response not found.");
        } else {
            return pathwayResponse;
        }
    }


    // Endpoint to get a list of PathwayResponses by their description
    @RequestMapping(path = "/description/{desc}/responses", method = RequestMethod.GET)
    public List<PathwayResponse> getResponsesByDesc(@PathVariable("desc") String key) {
        List<PathwayResponse> pathwayResponses = pathwayResponseDao.getResponsesByDesc(key);
        if (pathwayResponses == null) {
            throw new ResponseStatusException(HttpStatus.NOT_FOUND, "Response(s) not found.");
        } else {
            return pathwayResponses;
        }
    }

}
