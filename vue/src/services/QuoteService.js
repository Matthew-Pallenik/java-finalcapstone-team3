import axios from "axios";
const apiKey = '/31X7SygUx8QW18+aimEMw==2wvlEbciXssaVX3Y';
const apiUrl = 'https://api.api-ninjas.com/v1';
const http = axios.create({
  baseURL: apiUrl,
  headers: {
    'X-Api-Key': apiKey,
    'Content-Type': 'application/json',
  },
});
export default{
    getRandomQuote(){
        return http.get('/quotes?category=failure')
    }
}