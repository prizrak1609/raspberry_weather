#include <iostream>

#include "curl/curl.h"
#include "parson.h"

size_t write_callback(char *ptr, size_t size, size_t nmemb, void *userdata) {
    JSON_Value *json = json_parse_string(ptr);

    JSON_Object *root_object = json_value_get_object(json);
    JSON_Object *coord_obj = json_object_get_object(root_object, "coord");
    JSON_Array *weather_arr = json_object_get_array(root_object, "weather");
    JSON_Object *wind_obj = json_object_get_object(root_object, "wind");

    const char *name = json_object_get_string(root_object, "name");

    const double wind_speed = json_object_get_number(wind_obj, "speed");

    JSON_Object *weather_obj = json_array_get_object(weather_arr, 0);
    const char *weather_main = json_object_get_string(weather_obj, "main");
    const char *weather_description = json_object_get_string(weather_obj, "description");

    const double coord_lat = json_object_get_number(coord_obj, "lat");
    const double coord_lon = json_object_get_number(coord_obj, "lon");

    std::cout << name << " (lat:" << coord_lat << ", lon:" << coord_lon << ")" << std::endl;
    std::cout << weather_main << ": " << weather_description << std::endl;
    std::cout << "Wind speed: " << wind_speed << " m/s" << std::endl;

    return nmemb;
}

int main(int argc, char* argv[]) {
    std::string request_url = "http://api.openweathermap.org/data/2.5/weather?q=";
    if (argc > 1) {
        request_url += argv[1];
    } else {
        request_url += "Lviv";
    }
    request_url += "&APPID=b944ebba123deeb1af548d804245dac4";

    CURL *curl = curl_easy_init();

    if(curl) {
        curl_easy_setopt(curl, CURLOPT_URL, request_url.c_str());
        curl_easy_setopt(curl, CURLOPT_VERBOSE, 0L);
        curl_easy_setopt(curl, CURLOPT_FOLLOWLOCATION, 1L);
        curl_easy_setopt(curl, CURLOPT_WRITEFUNCTION, write_callback);

        CURLcode res = curl_easy_perform(curl);

        if(res != CURLE_OK) {
            fprintf(stderr, "curl_easy_perform() failed: %s\n", curl_easy_strerror(res));
        }

        curl_easy_cleanup(curl);
    }
    return 0;
}
