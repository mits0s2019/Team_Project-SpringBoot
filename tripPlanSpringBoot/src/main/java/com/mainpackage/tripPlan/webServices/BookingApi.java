package com.mainpackage.tripPlan.webServices;

import com.mainpackage.tripPlan.utilities.CreateJson;
import com.mashape.unirest.http.HttpResponse;
import com.mashape.unirest.http.Unirest;
import com.mashape.unirest.http.exceptions.UnirestException;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.ParseException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import java.util.*;

@Component
public class BookingApi {

    @Autowired
    CreateJson cJ;

    /////insert city////get dest_id
    public HttpResponse<String> locations(String city) throws UnirestException, ParseException {
        
        HttpResponse<String> response = Unirest.get("https://apidojo-booking-v1.p.rapidapi.com/locations/auto-complete?languagecode=en-us&text=" + city)
                .header("x-rapidapi-host", "apidojo-booking-v1.p.rapidapi.com")
                .header("x-rapidapi-key", "2f7c656e8emsh52fa210fd1c2272p1016dbjsn00574276a26e")
                .asString();

        return response;
    }

    public void propertiesList(String dest_id) throws UnirestException {
        HttpResponse<String> response = Unirest.get("https://apidojo-booking-v1.p.rapidapi.com/properties/list?price_filter_currencycode=USD&travel_purpose=leisure&categories_filter=price%3A%3A9-40%2Cfree_cancellation%3A%3A1%2Cclass%3A%3A1%2Cclass%3A%3A0%2Cclass%3A%3A2&search_id=none&order_by=popularity&children_qty=2&languagecode=en-us&children_age=5%2C7&search_type=city&offset=30&dest_ids=-814876&guest_qty=1&arrival_date=2019-11-13&departure_date=2019-11-15&room_qty=1")
                .header("x-rapidapi-host", "apidojo-booking-v1.p.rapidapi.com")
                .header("x-rapidapi-key", "2f7c656e8emsh52fa210fd1c2272p1016dbjsn00574276a26e")
                .asString();
    }
}