
# Hardware

The following is a list of all the components that are present in the KegPi right now:

## Kegerator

* [Whirlpool 4.3 cu ft mini fridge](https://www.target.com/p/whirlpool-174-4-3cu-ft-mini-refrigerator-stainless-steel-bc-127b/-/A-17304428) - $159.00
* [Chrome plated dual faucet tower](http://www.beveragefactory.com/draftbeer/towers/doublefaucet/D4743DT___6843.shtml) - $116.00
* [Draft Brewer Flex Keg System](https://www.midwestsupplies.com/draft-brewer-flex-keg-system) - $375.99
* [Aluminum CO2 Tank - 5 lb](http://www.austinhomebrew.com/Aluminum-CO2-Tank--5-lb_p_4693.html) - $65.00
* [Surface Mount Drip Tray](http://www.beveragefactory.com/draftbeer/driptray/cutout/kegco-surface-mount-drip-tray-seco1610.html) - $82.30

## Raspi Components

* [Raspberry Pi 3](https://www.amazon.com/Raspberry-Model-A1-2GHz-64-bit-quad-core/dp/B01CD5VC92/ref=sr_1_3?s=pc&ie=UTF8&qid=1500307132&sr=1-3&keywords=raspberry+pi+3) - $34.99
* [Smarticase for Raspberry Pi 3](https://smarticase.com/collections/all/products/smartipi-touch) - $27.99
* [Smarticase Back Cover (large)](https://smarticase.com/collections/all/products/smartipi-touch-back-cover) - $10.00
* [Touchscreen for Raspberry Pi](https://www.adafruit.com/product/2718) - $79.95
* [Magnetic Contact Sensor](https://www.adafruit.com/product/375) - $3.95
* [Waterproof DS18B20 Digital temperature sensor](https://www.adafruit.com/product/381) - $9.95
* 2 x [Openscale Board](https://www.sparkfun.com/products/13261)
* 8 x [50kg load sensors](https://www.sparkfun.com/products/10245) - $9.95

### Software
I'll be making some updates here in the future, but I've been in the process of writing some [Sensu](https://sensu.io) plugins that will do the monitoring and exporting of metric data. Since Sensu saves me from reinventing the wheel, this is what I'll use for monitoring. 

You can find the WIP sensors repo here: [sensu-plugins-rpi-sensors](https://github.com/asachs01/sensu-plugins-rpi-sensors). Please note that these are works in progress, and at some point, will be folded into the Sensu Plugins ecosystem.

There will also be a dashboard that's more directed at the kegerator metrics, but that's a ways out. 
