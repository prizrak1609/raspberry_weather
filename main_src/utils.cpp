#include <iostream>
#include <cstring>
#include <algorithm>
#include <string>

#include "parson.h"
#include "curl/curl.h"
#include "utils.h"

// static
std::string Utils::getParam(const char *name, char *argv[], int argc) {
    for(int i = 0; i < argc; i++) {
        if(std::strcmp(name, argv[i]) == 0) {
            return argv[i + 1];
        }
    }
    return {};
}

size_t write_callback_translate(char *ptr, size_t size, size_t nmemb, void *userdata) {
    JSON_Value *json = json_parse_string(ptr);
    JSON_Array *root_array = json_value_get_array(json);
    JSON_Array *first_array = json_array_get_array(root_array, 0);
    first_array = json_array_get_array(first_array, 0);
    const char *translated = json_array_get_string(first_array, 0);

    Utils *utils = (Utils*)userdata;
    utils->condition_variable.notify_all();
    utils->callback(translated);

    return nmemb;
}

void Utils::translate(const std::string &text, const std::string &lang_from, const std::string &lang_to, const std::function<void(const char *)> result) {
    std::unique_lock<std::mutex> lock { lock_mutex };

    callback = result;

    CURL *curl = curl_easy_init();

    std::string request_url = "http://translate.googleapis.com/translate_a/single?client=gtx&sl=";
    request_url += lang_from;
    request_url += "&tl=";
    request_url += lang_to;
    request_url += "&dt=t&q=";
    request_url += curl_easy_escape(curl, text.c_str(), 0);

    if(curl) {
        curl_easy_setopt(curl, CURLOPT_URL, request_url.c_str());
        curl_easy_setopt(curl, CURLOPT_VERBOSE, 0L);
        curl_easy_setopt(curl, CURLOPT_FOLLOWLOCATION, 1L);
        curl_easy_setopt(curl, CURLOPT_WRITEFUNCTION, write_callback_translate);
        curl_easy_setopt(curl, CURLOPT_WRITEDATA, this);

        CURLcode res = curl_easy_perform(curl);

        if(res != CURLE_OK) {
            std::cerr << "curl_easy_perform() failed: " << curl_easy_strerror(res) << std::endl;
        }

        condition_variable.wait(lock);

        curl_easy_cleanup(curl);
    }
}
