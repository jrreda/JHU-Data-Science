#install.packages("jsonlite")
library(jsonlite)
#install.packages("httpuv")
library(httpuv)
#install.packages("httr")
library(httr)

## 1. Find OAuth settings for github:
  # Can be github, linkedin etc depending on application
oauth_endpoints("github")

# 2. To make your own application, register at
#    https://github.com/settings/developers. Use any URL for the homepage URL
#    (http://github.com is fine) and  http://localhost:1410 as the callback url
#
#    Replace your key and secret below.
myapp <- oauth_app("github",
  key = "49d8f9a8c0bd831c8b8d",
  secret = "c3c3b4320e6675d0f5b6082366ef8ef79713bd52"
)

## 3. Get OAuth credentials
github_token <- oauth2.0_token(oauth_endpoints("github"), myapp)

## 4. Use API
gtoken <- config(token = github_token)
req <- GET("https://api.github.com/users/jtleek/repos", gtoken)

# Take action on http error
stop_for_status(req)

# Extract content from a request
json1 = content(req)

# Convert to a data.frame
gitDF = jsonlite::fromJSON(toJSON(json1))

### Use this data to find the time that the datasharing repo was created. What time was it created?
gitDF[gitDF$name == "datasharing", "created_at"]
  # Answer:
  # [1] "2013-11-07T13:25:07Z"