import times
import "./core"
import "../pixelapkg/api/graph"
import "../pixelapkg/api/pixel"


proc post*(
    id: IDString,
    date: DateString = "",
    quantity: QuantityString,
  ): int =
  ## Post pixel record
  var params: PixelRequest
  if date == "":
    let reqDateFormat = initTimeFormat("yyyyMMdd")
    let curDate = times.format(now().local(), reqDateFormat)
    params = newPixelRequest(id, curDate, quantity)
  else:
    params = newPixelRequest(id, date, quantity)
  let apiClient = initApiClient()
  let resp = apiClient.postPixel(params)
  if resp:
    echo "Added new post"
  else:
    echo "Failure"
  result = 0
