library(httr2)
library(jsonlite)

search_term = 'rabbit'
num_results = 10

req <- request("https://newsapi.org/v2/everything") |>
  req_url_query(
    q = search_term,
    from = Sys.Date() - 1,
    pageSize = num_results,
    apiKey = Sys.getenv("NEWS_API_KEY")
  )

resp <- req_perform(req)
json_resp = resp_body_json(resp)

write_json(json_resp,'data/year-month-day.json',pretty=T)
