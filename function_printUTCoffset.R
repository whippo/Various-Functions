##### FUNCTION

# Calculates UTC offset from system time and prints

current_utc_offset <- function () {
  library(lubridate)
  library(tidyr)
  time_frame <- data.frame(
    now_timestamp = as.character(Sys.time()),
    utc_timestamp = as.character(as_datetime(Sys.time(), tz = "UTC")))
  time_frame$hours = with(time_frame, difftime(now_timestamp, utc_timestamp, units = "hours"))
  time_frame$hours <- as.character(as.numeric(time_frame$hours*100))
  time_frame$hours <- if (nchar(time_frame$hours) == 4) {
    gsub("-", "-0", time_frame$hours)
  }
  current <- unite(time_frame, print_time, c("now_timestamp", "hours"), sep = "")
  return(current$print_time)
}
