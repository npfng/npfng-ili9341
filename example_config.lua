local gpio = {[0]=3,[1]=10,[2]=4,[3]=9,[4]=1,[5]=2,[10]=12,[12]=6,[13]=7,[14]=5,[15]=8,[16]=0}

return {
    SKIP_WIFI_CONNECT = true,
    -- WIFI_SSID = '<ssid>',
    -- WIFI_KEY = '<key>',

    PLUGINS = {
        'ili9341'
    },

    PIN_RGB_LED = 1,
    PIN_DHT = 6,
}
