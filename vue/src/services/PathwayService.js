import axios from "axios";


const http = axios.create({
  baseURL:  "http://localhost:9000"
});

export default {
    //sends the keys over and then gets a response that matches the key word
    addUserInput(key){
        return http.get(`/pathwayResponses/${key}`)
    },

    //send id over and then gets a response that matches the id
    getResultById(id){
      return http.get(`/pathwayResponses/id/${id}`)
    },
}