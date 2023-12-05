package com.techelevator.dao;

import com.techelevator.model.PathwayResponse;

import java.util.List;


// Interface for Data Access Object (DAO) to interact with PathwayResponse entities
public interface PathwayResponseDao {

    // Retrieve a PathwayResponse by its unique identifier (id)
    PathwayResponse getResponseById(int id);

    // Retrieve a PathwayResponse by its key
    PathwayResponse getResponseByKey(String key);

    // Retrieve a list of PathwayResponses by their key
    List<PathwayResponse> getResponsesByKey(String key);

    // Retrieve a PathwayResponse by its description
    PathwayResponse getResponseByDesc(String key);

    // Retrieve a list of PathwayResponses by their description
    List<PathwayResponse> getResponsesByDesc(String key);
}
