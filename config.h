#define PATH(name)                      "/home/emil/.wm/dwmblocks/blocks/"name
#define CMDOUTLENGTH                    100
#define DELIMITERENDCHAR                16
#define INTERVALs                       1
#define INTERVALn                       0

static const char delimiter[] = { ' ', '|', ' ', DELIMITERENDCHAR };

#include "block.h"


static Block blocks[] = {
/*      pathu                         pathc                               interval        signal */
        { PATH("weather/weather.sh"), PATH("weather/weather_handler.sh"), 1800,          10},
        { PATH("todo/todo.sh"),       PATH("todo/todo_handler.sh"),       0,              9},
//        { PATH("traffic/traffic.sh"), PATH("traffic/traffic_handler.sh"), 2,              8},
        { PATH("update/update.sh"),   PATH("update/update_handler.sh"),   600,            7},
        { PATH("uptime/uptime.sh"),   PATH("uptime/uptime_handler.sh"),   60,             6},
        { PATH("ram/ram.sh"),         PATH("ram/ram_handler.sh"),         8,              5},
        { PATH("cpu/cpu.sh"),         PATH("cpu/cpu_handler.sh"),         4,              4},
        { PATH("disk/disk.sh"),       PATH("disk/disk_handler.sh"),       600,            3}, 
        { PATH("date/date.sh"),       PATH("date/date_handler.sh"),       0,              2},
        { PATH("time/time.sh"),       PATH("time/time_handler.sh"),       1,              1},
        { NULL }
};

