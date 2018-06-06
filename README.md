# Where's My Beer
## Building a Better Kegerator with a Raspberry Pi & Sensu

Greetings, fellow traveler! This repo is for my TXLF '18 talk. Here's what you'll find here:

* [Slides](https://docs.google.com/presentation/d/1cR6ohRdbzjeQ4bSnECpIHlZrFEvcA2HRwfucQa_Eg88/edit?usp=sharing)
* [List of physical materials used to make the kegerator](MATERIALS.md)
* [Script to install Sensu on a Raspberry Pi](install.sh)
* [Check scripts for monitoring all the things](https://github.com/asachs01/sensu-plugins-rpi-sensors)
* [How to Build a Kegerator](http://aaron.sachs.blog/moving-to-kegging/)
* [How to Set Up Sensu on a Raspberry Pi](https://aaron.sachs.blog/monitoring-my-kegerator-with-sensu/)
* [How to Monitor a Kegerator with Sensu](https://aaron.sachs.blog/monitoring-raspberry-pis-with-sensu/)
* [Walkthrough of how to put everything together](WALKTHROUGH.md)

There are a couple of prerequesites though:
1. You'll need to have an existing Graphite or Influx instance to receive the metric data (if you want that)
2. You'll also need to have a Sensu Server/API and Uchiwa deployment

To get that pre-existing instance set up, head to [Sensu's training repo](https://github.com/sensu/training-vagrant). You can find the box you need under the [Intro to Sensu](https://github.com/sensu/training-vagrant/workshops/intro-to-sensu) directory.

I'd recommend starting off with reading through the install script. From there, check out the checks (see what I did there), and then read the walkthrough to see how everything gets put together.
