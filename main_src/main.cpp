#include <iostream>
#include <string.h>

#include "curl.h"
#include "parson.h"
#include "utils.h"

static std::string lang_from;
static std::string lang_to;

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

    std::string translated_name = name;
    std::string translated_weather_main = weather_main;
    std::string translated_weather_description = weather_description;

    if (! lang_to.empty() && ! lang_from.empty()) {
        Utils utils;

        utils.translate(name, lang_from, lang_to, [&translated_name] (const char *translated) {
            translated_name = translated;
        });

        utils.translate(weather_main, lang_from, lang_to, [&translated_weather_main] (const char *translated) {
            translated_weather_main = translated;
        });

        utils.translate(weather_description, lang_from, lang_to, [&translated_weather_description] (const char *translated) {
            translated_weather_description = translated;
        });
    }

    std::cout << translated_name.c_str() << " (lat:" << coord_lat << ", lon:" << coord_lon << ")" << std::endl;
    std::cout << translated_weather_main.c_str() << ": " << translated_weather_description.c_str() << std::endl;
    std::cout << "Wind speed: " << wind_speed << " m/s" << std::endl;

    return nmemb;
}

int main(int argc, char* argv[]) {
    std::string request_url = "http://api.openweathermap.org/data/2.5/weather?q=";
    std::string city = Utils::getParam("-c", argv, argc);
    if (city.empty()) {
        request_url += "Lviv";
    } else {
        request_url += city;
    }
    request_url += "&APPID=b944ebba123deeb1af548d804245dac4";

    lang_to = Utils::getParam("-t", argv, argc);
    lang_from = Utils::getParam("-f", argv, argc);

    CURL *curl = curl_easy_init();

    if(curl) {
        curl_easy_setopt(curl, CURLOPT_URL, request_url.c_str());
        curl_easy_setopt(curl, CURLOPT_VERBOSE, 0L);
        curl_easy_setopt(curl, CURLOPT_FOLLOWLOCATION, 1L);
        curl_easy_setopt(curl, CURLOPT_WRITEFUNCTION, write_callback);

        CURLcode res = curl_easy_perform(curl);

        if(res != CURLE_OK) {
            std::cerr << "curl_easy_perform() failed: " << curl_easy_strerror(res) << std::endl;
        }

        curl_easy_cleanup(curl);
    }
    return 0;
}
