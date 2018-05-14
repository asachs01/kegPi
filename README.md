# Where's My Beer
## Building a Better Kegerator with a Raspberry Pi & Sensu

Greetings, fellow traveler! This repo is for my TXLF '18 talk. Here's what you'll find here:

* [Slides](wheresmybeer.pdf)
* [List of physical materials used to make the kegerator](MATERIALS.md)
* [Script to install Sensu on a Raspberry Pi](install.sh)
* [Check scripts for monitoring all the things](scripts)
* [Walkthrough of how to put everything together](WALKTHROUGH.md)

There are a couple of prerequesites though:
1. You'll need to have an existing Graphite or Influx instance to receive the metric data (if you want that)
2. You'll also need to have a Sensu Server/API and Uchiwa deployment

I'd recommend starting off with reading through the install script. From there, check out the checks (see what I did there), and then read the walkthrough to see how everything gets put together.
