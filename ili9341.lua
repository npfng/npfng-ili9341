local config = require('config')

-- setup SPI and connect display
local function init_spi_display()
    -- Hardware SPI CLK  = GPIO14
    -- Hardware SPI MOSI = GPIO13
    -- Hardware SPI MISO = GPIO12 (not used)
    -- CS, D/C, and RES can be assigned freely to available GPIOs
    local cs  = 8 -- GPIO15, pull-down 10k to GND
    local dc  = 4 -- GPIO2
    local res = 0 -- GPIO16

    spi.setup(1, spi.MASTER, spi.CPOL_LOW, spi.CPHA_LOW, spi.DATABITS_8, 8)
    disp = ucg.ili9341_18x240x320_hw_spi(cs, dc, res)
end

local function update()
    disp:setRotate90()

    disp:setColor(0, 0, 0, 0)
    disp:setColor(1, 0, 0, 0)
    disp:setColor(2, 0, 0, 0)
    disp:setColor(3, 0, 0, 0) 
    disp:drawGradientBox(0, 0, disp:getWidth(), disp:getHeight())

    disp:setFont(ucg.font_ncenB24_tr)
    disp:setColor(255, 255, 255)
    disp:setColor(1, 255, 0,0)

    status,temp,humi,temp_decimial,humi_decimial = dht.readxx(config.PIN_DHT)

    disp:setPrintPos(50, 50)
    if( status == dht.OK ) then
        disp:print(temp.." C")
        disp:setPrintPos(50, 100)
        disp:print(humi.." %")
    else
        disp:setColor(255, 0, 0)
        disp:print("Read failed")
    end

    tmr.alarm(2, 20000, 0, update)
end

local function start()
    init_spi_display()
    disp:begin(ucg.FONT_MODE_TRANSPARENT)
    disp:clearScreen()
    update()
end


return {start = start}
