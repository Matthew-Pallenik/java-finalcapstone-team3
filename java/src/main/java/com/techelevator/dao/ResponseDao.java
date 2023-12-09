package com.techelevator.dao;

import com.techelevator.model.Response;

import java.util.List;


// Interface for Data Access Object (DAO) to interact with PathwayResponse entities
public interface ResponseDao {

    // Retrieve a PathwayResponse by its unique identifier (id)
    Response getResponseByIdPathway(int id);

    // Retrieve a PathwayResponse by its key
    Response getResponseByKeyPathway(String key);

    // Retrieve a list of PathwayResponses by their key
    List<Response> getResponsesByKeyPathway(String key);

    // Retrieve a list of PathwayResponses by their description
    List<Response> getResponsesByDescPathway(String key);

    // Retrieve a CurriculumResponse by its unique identifier (id)
    Response getResponseByIdCurriculum(int id);

    // Retrieve a CurriculumResponse by its key
    Response getResponseByKeyCurriculum(String key);

    // Retrieve a list of CurriculumResponses by their key
    List<Response> getResponsesByKeyCurriculum(String key);

    // Retrieve a list of CurriculumResponses by their description
    List<Response> getResponsesByDescCurriculum(String key);
}
