library(httr)
library(xml2)
library(jsonlite)

fitbit_endpoint <- oauth_endpoint(
  request = "https://api.fitbit.com/oauth2/token",
  authorize = "https://www.fitbit.com/oauth2/authorize",
  access = "https://api.fitbit.com/oauth2/token")
  
myapp <- oauth_app(
  appname = "data_access",
  key = key, #my consumer key
  secret = token) #my secret token

# 2. Get OAuth token
scope <- c("activity")  # See dev.fitbit.com/docs/oauth2/#scope
fitbit_token <- oauth2.0_token(fitbit_endpoint, myapp,
                               scope = scope, use_basic_auth = TRUE)
# 3. Make API requests
resp <- GET(url = "https://api.fitbit.com/1/user/-/activities/steps/date/today/1m.json", 
            config(token = fitbit_token))
content(resp)