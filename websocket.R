# load packages

require(curl)

#ticker
t_con <- curl('https://api.bitfinex.com/v2/ticker/tLTCUSD')

#book
b_con <- curl('https://api.bitfinex.com/v2/book/tLTCUSD/P0')

pool <- new_pool()

cb <- function(req){cat("done:", req$url, ": HTTP:", req$status, "\n")}

curl_fetch_multi('https://api.bitfinex.com/v2/ticker/tLTCUSD', done = cb, pool = pool)
curl_fetch_multi('https://api.bitfinex.com/v2/book/tLTCUSD/P0', done = cb, pool = pool)

out <- multi_run(pool = pool) 
