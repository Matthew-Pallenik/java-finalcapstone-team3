package com.techelevator.dao;

import com.techelevator.model.PathwayResponse;

import java.util.List;

public interface PathwayResponseDao {
    PathwayResponse getResponseById(int id);
    PathwayResponse getResponseByKey(String key);
    List<PathwayResponse> getResponsesByKey(String key);
    PathwayResponse getResponseByDesc(String key);
    List<PathwayResponse> getResponsesByDesc(String key);
}
