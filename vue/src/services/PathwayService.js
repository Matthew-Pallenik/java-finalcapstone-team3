import axios from "axios";
import { HttpProxy } from "vite";

const http = axios.create({
  baseURL:  "http://localhost:9000"
});

export default {
    //sends the keys over and then gets a response that matches the key word
    addUserInput(key){
        return http.get(`/responses/${key}`)
    },
}