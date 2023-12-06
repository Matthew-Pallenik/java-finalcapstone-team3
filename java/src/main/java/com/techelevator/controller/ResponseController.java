package com.techelevator.controller;


import com.techelevator.dao.ResponseDao;
import com.techelevator.model.Response;
import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.server.ResponseStatusException;

import java.util.List;

@RestController
@CrossOrigin
public class ResponseController {
    private ResponseDao responseDao;

    // Constructor to inject PathwayResponseDao dependency
    public ResponseController(ResponseDao responseDao){
        this.responseDao = responseDao;
    }


    // Endpoint to get a PathwayResponse by its unique identifier (id)
    @RequestMapping(path = "/pathwayResponses/id/{id}", method = RequestMethod.GET)
    public Response getResponseByIdPathway(@PathVariable("id") int id) {
        Response response = responseDao.getResponseByIdPathway(id);
        if (response == null) {
            throw new ResponseStatusException(HttpStatus.NOT_FOUND, "Response not found.");
        } else {
            return response;
        }
    }


    // Endpoint to get a PathwayResponse by its key
    @RequestMapping(path = "/pathwayResponses/keys/{key}", method = RequestMethod.GET)
    public Response getResponseByKeyPathway(@PathVariable("key") String key) {
        Response response = responseDao.getResponseByKeyPathway(key);
        if (response == null) {
            throw new ResponseStatusException(HttpStatus.NOT_FOUND, "Response not found.");
        } else {
            return response;
        }
    }


    // Endpoint to get a list of PathwayResponses by their key
    @RequestMapping(path = "/pathwayResponses/{key}", method = RequestMethod.GET)
    public List<Response> getResponsesByKeyPathway(@PathVariable("key") String key) {
        List<Response> respons = responseDao.getResponsesByKeyPathway(key);
        if (respons == null) {
            throw new ResponseStatusException(HttpStatus.NOT_FOUND, "Response(s) not found.");
        } else {
            return respons;
        }
    }



    // Endpoint to get a list of PathwayResponses by their description
    @RequestMapping(path = "/description/{desc}/pathwayResponses", method = RequestMethod.GET)
    public List<Response> getResponsesByDescPathway(@PathVariable("desc") String key) {
        List<Response> respons = responseDao.getResponsesByDescPathway(key);
        if (respons == null) {
            throw new ResponseStatusException(HttpStatus.NOT_FOUND, "Response(s) not found.");
        } else {
            return respons;
        }
    }

    // Endpoint to get a CurriculumResponse by its unique identifier (id)
    @RequestMapping(path = "/curriculumResponses/id/{id}", method = RequestMethod.GET)
    public Response getResponseByIdCurriculum(@PathVariable("id") int id) {
        Response response = responseDao.getResponseByIdCurriculum(id);
        if (response == null) {
            throw new ResponseStatusException(HttpStatus.NOT_FOUND, "Response not found.");
        } else {
            return response;
        }
    }

    // Endpoint to get a CurriculumResponse by its key
    @RequestMapping(path = "/curriculumResponses/keys/{key}", method = RequestMethod.GET)
    public Response getResponseByKeyCurriculum(@PathVariable("key") String key) {
        Response response = responseDao.getResponseByKeyCurriculum(key);
        if (response == null) {
            throw new ResponseStatusException(HttpStatus.NOT_FOUND, "Response not found.");
        } else {
            return response;
        }
    }

    // Endpoint to get a list of CurriculumResponses by their key
    @RequestMapping(path = "/curriculumResponses/{key}", method = RequestMethod.GET)
    public List<Response> getResponsesByKeyCurriculum(@PathVariable("key") String key) {
        List<Response> respons = responseDao.getResponsesByKeyCurriculum(key);
        if (respons == null) {
            throw new ResponseStatusException(HttpStatus.NOT_FOUND, "Response(s) not found.");
        } else {
            return respons;
        }
    }



    // Endpoint to get a list of CurriculumResponses by their description
    @RequestMapping(path = "/description/{desc}/curriculumResponses", method = RequestMethod.GET)
    public List<Response> getResponsesByDescCurriculum(@PathVariable("desc") String key) {
        List<Response> respons = responseDao.getResponsesByDescCurriculum(key);
        if (respons == null) {
            throw new ResponseStatusException(HttpStatus.NOT_FOUND, "Response(s) not found.");
        } else {
            return respons;
        }
    }

}
