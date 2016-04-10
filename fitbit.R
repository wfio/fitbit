library(httr)
library(xml2)

fitbit_endpoint <- oauth_endpoint(
  request = "https://api.fitbit.com/oauth2/token",
  authorize = "http://localhost:1410/",
  access = "https://api.fitbit.com/oauth2/token")
myapp <- oauth_app(
  appname = "data_access",
  key = key, 
  secret = token)

# 2. Get OAuth token
scope <- c("activity")  # See dev.fitbit.com/docs/oauth2/#scope
fitbit_token <- oauth2.0_token(fitbit_endpoint, myapp,
                               scope = scope, use_basic_auth = TRUE,
                               user_params = fitbit_endpoint)

# 3. Make API requests
resp <- GET(url = "https://api.fitbit.com/1/user/-/activities/activity/date/2016-01-01/2016-04-09.json", 
            config(token = fitbit_token))
content(resp)