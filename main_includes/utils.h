#ifndef UTILS_H
#define UTILS_H

#include <string>
#include <functional>
#include <condition_variable>
#include <mutex>

class Utils {

    friend size_t write_callback_translate(char *ptr, size_t size, size_t nmemb, void *userdata);

private:
    std::function<void(const char *)> callback;
    std::condition_variable condition_variable;
    std::mutex lock_mutex;
    bool translated;

public:
    static std::string getParam(const char *name, char *argv[], int argc);

    void translate(const std::string &text, const std::string &lang_from, const std::string &lang_to, const std::function<void(const char *)> result);

    Utils() = default;
    ~Utils() = default;
};

#endif // UTILS_H
