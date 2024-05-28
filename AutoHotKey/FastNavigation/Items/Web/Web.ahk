class _CurlBaseMenuItem extends NavigationItem {
    __New(letter, description)
    {
        super.__New(letter, description)
    }

    Get(url) {
        whr := ComObject("WinHttp.WinHttpRequest.5.1")
        whr.Open("GET", url, true)
        whr.Send()
        ; Using 'true' above and the call below allows the script to remain responsive.
        whr.WaitForResponse()
        return whr.ResponseText
    }
}

class ExchangeRatesHelpMenu extends HelpMenu {
    __New() {
        super.__New("Exchange Rates")
    }

    Add(label, value) {
        this.Items.Push(Map("label", label, "value", value))
    }

    RenderItem(item) {
        this.Gui.SetFont("w800")
        this.Gui.Add("Text", "X10", item["label"])
        this.Gui.SetFont("w1")
        this.Gui.Add("Text", "X+10", item["value"])
    }
}

class GetExchangeRatesMenuItem extends _CurlBaseMenuItem {
    __New(letter) {
        super.__New(letter, "Exchange Rates")
    }

    ActivateItem() {
        rates := super.Get("http://api.nbp.pl/api/exchangerates/tables/A?format=json")
        obj := Jxon_Load(&rates)

        usd := getFirst(obj[1]["rates"], (v) => v["code"] = "USD")
        eur := getFirst(obj[1]["rates"], (v) => v["code"] = "EUR")

        myGui := ExchangeRatesHelpMenu()
        myGui.Add("USD -> PLN ", Round(usd["mid"], 2))
        myGui.Add("EUR -> PLN ", Round(eur["mid"], 2))
        myGui.Show()
    }
}