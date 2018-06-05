
### Hardware
The following is a list of all the components that are present in the KegPi right now:
* [Whirlpool 4.3 cu ft mini fridge](https://www.amazon.com/Whirlpool-Stainless-Compact-Refrigerator-Fridge/dp/B00XQLQXMY)
* [Chrome plated dual faucet tower](http://www.beveragefactory.com/draftbeer/towers/doublefaucet/D4743DT___6843.shtml)
* [Draft Brewer Flex Keg System](https://www.midwestsupplies.com/draft-brewer-flex-keg-system)
* [Aluminum CO2 Tank - 5 lb](http://www.austinhomebrew.com/Aluminum-CO2-Tank--5-lb_p_4693.html)
* [Surface Mount Drip Tray](http://www.beveragefactory.com/draftbeer/driptray/cutout/kegco-surface-mount-drip-tray-seco1610.html)
* [Raspberry Pi 3](https://www.amazon.com/Raspberry-Model-A1-2GHz-64-bit-quad-core/dp/B01CD5VC92/ref=sr_1_3?s=pc&ie=UTF8&qid=1500307132&sr=1-3&keywords=raspberry+pi+3)
* [Smarticase for Raspberry Pi 3](https://smarticase.com/collections/all/products/smartipi-touch)
* [Smarticase Back Cover (large)](https://smarticase.com/collections/all/products/smartipi-touch-back-cover)
* [Touchscreen for Raspberry Pi](https://www.adafruit.com/product/2718)
* [Liquid Flow Meters (2x)](https://www.adafruit.com/product/2718)
* [Magnetic Contact Sensor](https://www.adafruit.com/product/375)
* [Waterproof DS18B20 Digital temperature sensor](https://www.adafruit.com/product/381)

### Software
I'll be making some updates here in the future, but I've been in the process of writing some [Sensu](https://sensu.io) plugins that will do the monitoring and exporting of metric data. Since Sensu saves me from reinventing the wheel, this is what I'll use for monitoring. 

You can find the WIP sensors repo here: [sensu-plugins-rpi-sensors][https://github.com/asachs01/sensu-plugins-rpi-sensors]. Please note that these are works in progress, and at some point, will be folded into the Sensu Plugins ecosystem.

There will also be a dashboard that's more directed at the kegerator metrics, but that's a ways out. 
