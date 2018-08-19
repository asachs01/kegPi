# Kegerator Walkthrough

Greetings! Here I'll walk you through the process I went through in creating my kegerator.

## The Kegerator Build

For this, you'll need the [parts listed][1] under the "Kegerator" heading on the "MATERIALS" doc.

My build is largely based on a build done by Jake McWhirter on his ["Missionary Brewer"][2] blog. I'll let you read over that to do the basic build. It's not terribly complicated, and can reasonably be done in an hour or two.

I will note that if you decide to purchase the refrigerator that I used, you will need a multi-tool to cut down some of the plastic molding on the side, as well as take the door rack off. It's not needed, but having one certainly makes the job easier.

I'll also note that I used HVAC tape and aluminum foil to cover the areas that I cut out. You can see pictures of what I did [here][3]

## The Raspi Build

This is where things can get a bit tricky, and I'll do my best to document exactly what I did, as there's many ways you can wire things up. You'll need the [components listed][4] under the "Raspi Components" heading on the "MATERIALS" doc.

### Setting Up the Raspi

Just getting the Raspi and screen mounted into your Smarticase enclosure should be relatively easy. There are several screws that you'll need to remove in order to mount the Pi and screen and the Smarticase includes instructions for this.

If you've not ever set up a Raspi and need a pointer as to where to start with getting the software installed, I recommend the [Raspberry Pi Foundation's][5] documentation on how to do this.

Once you've set up the Pi, you'll need to install Sensu. For instructions on how to do this, please see my [blog post here][6]. There's also the [install script][7] that you can run via:

`curl https://raw.githubusercontent.com/asachs01/kegPi/master/install.sh | bash`

This script will install Ruby, the Sensu rubygem, and provide minimal client configuration for your Sensu client on the Raspberry Pi.

Once you've got Sensu running, you'll have to introduce some checks. In particular, the checks for monitoring the kegerator come from my [sensu-plugins-rpi-sensors][8] repo. To get the checks installed, do the following (assumes you're logged into your Pi and are root:

```shell
cd /etc/sensu/plugins
git clone https://github.com/asachs01/sensu-plugins-rpi-sensors
```

From there, see the [README][9] on the plugins repo for examples on how to use the plugins.

I use the following definition for the `sensu-client` definition:

```json
{
 "client": {
   "environment": "raspi",
   "subscriptions": [
     "kegpi"   ]
  }
}

```

### Example Wiring Diagram

![Kegpi wiring][11]

#### Contact Sensor

For the contact sensor, I have it wired to the following GPIO ports:

* Pin 22
* GND

I use the following check definition to check the check sensor:

```json
{
  "checks":{
    "check-contact-sensor": {
      "command": "/etc/sensu/plugins/sensu-plugins-rpi-sensors/bin/check-contact-sensor.rb -p 22",
      "interval": 10,
      "subscribers": [
        "kegpi"
      ]
    }
  }
}
```

The check above has the `-p` option, which specifies the pin number. You don't have to use this specific pin, but you can.

#### Temp Sensor

For the temp sensor, I have it wired to the following GPIO ports:

* Pin 4 (BCM number, otherwise known as pin #7)
* GND
* 3v power (also connected to a 4.7k Ω resistor)

I use the following check definition to check the temp sensor:

```json
{
  "checks":{
    "check-temp-sensor": {
      "command": "/etc/sensu/plugins/sensu-plugins-rpi-sensors/bin/check-temp-sensor.rb -F -w 45 -c 60",
      "interval": 15,
      "subscribers": [
        "kegpi"
      ]
    }
  }
}
```

One note for the temperature sensor, there is an option in the code to specify which numbering system you want to use (either BCM or Board). This is provided by the `rpi_gpio` Rubygem, which is based on the RPi.GPIO Python Library. See the [RPi.GPIO wiki][10] for the distinction here.

#### Weight Scale

UPCOMING! STAY TUNED!

### Putting It All Together

Once you've added the checks and wired everything to your Pi, restart the Sensu server process using `sysctl restart sensu-server` to have the checks set up. One note here, you'll still need to have a _seperate_ instance running the Sensu server process and dashboard for the checks to work.

<!-- LINKS -->
[1]: https://github.com/asachs01/txlf18/blob/master/MATERIALS.md#kegerator
[2]: https://missionarybrewer.wordpress.com/how-to-build-your-own-kegerator/
[3]: http://aaron.sachs.blog/moving-to-kegging/
[4]: https://github.com/asachs01/txlf18/blob/master/MATERIALS.md#raspi-components
[5]: https://www.raspberrypi.org/documentation/installation/installing-images/
[6]: http://aaron.sachs.blog/monitoring-raspberry-pis-with-sensu/
[7]: install.sh
[8]: https://github.com/asachs01/sensu-plugins-rpi-sensors
[9]: https://github.com/asachs01/sensu-plugins-rpi-sensors/blob/master/README.md
[10]: https://sourceforge.net/p/raspberry-gpio-python/wiki/BasicUsage/
[11]: images/kegpiWiring.png
