## Learning Project for SacRuby September 19 2019

In this learning project, we're taking on the imaginary role of a web developer
who just landed the below assignment during a "startup-jam" weekend. We have
limited time to prove out part of our idea, and are going to try complete as
many tasks/requirements on the list as we can.

For SacRuby, of course, this is a learning opportunity. We're going to explore
creating a simple web application, using Ruby and one or more add-on tools to
quickly accomplish our goal. While normally you'd select what-ever you want,
there will be some requirements tonight given as constraints.

The project can be done as part of the group, individually, or in what-ever
teams you like. I encourage you to at least pair up and collaborate. There are
a number of Ruby veterans in attendance. Ask for help!

## Project

Welcome to SacRubyStartupJam! You all have joined a team of local entrepreneurs
who are developing a new Internet of Things (IoT) device that can be used in
Sacramento's growing brewery scene to remotely monitor the process of
fermentation.

The device is a small, wireless sensor that can sit inside of a take and send
periodic data points in the form of a JSON array that has the configured
name/label the user provides, a time stamp in epoch time in seconds, status (OK if ok, an error message if not,  a temperature (in C), and a specific gravity. It
would look something like ["ferm1", 123456789, "OK",  20, 1.040]. The first version of the device
sends these messages once a minute to a configured endpoint (URL).

Your job is to do the following:

1. Build a simple web app that will be hosted on our "intranet" (behind
   a firewall, so security is less of a concern in version 1).
1. The Web app should have a static "home page" that displays a logo and
   welcome message. It should have a menu that navigates to an "about" page and
   a "data" page.
1. The "about" page contains our pretend "license agreement" (we're open
   source), and a little blurb about our pretend (or real!) team. The page has
   navigation back to the other pages.
1. The "data" page has a table with the last 10 data points, with the most
   recent data point at the top. This page should indicate if any errors were
   received and display them if so. The page should also share navigation
   capabilities like the others.
1. There is an API that receives the above data as JSON via an http POST. This
   API is over HTTP (not secure), and doesn't require authentication. The API
   receives the payload described above.

Optional requirements:

1. The data page has a chart showing the last N data points. There are separate
   graphs for each kind of data (temp, SG), showing the data value on the
   vertical access and the time on the horizontal.
1. The table (and graphs) can show more than 10 data points. The number of data
   points can be specified by a query parameter on the page (e.g. ?limit=100)
1. There is an API to get the data points.
1. There is persistent storage of the data points.
1. Add support for a simple authentication mechanism for the API. POSTs should
   be protected by a provisioned API "key" of some kind.
1. You create a new protocol that can add kinds of data, and they are
   identified by key/value pairs. You are able to support both versions of the
   protocol for the sensor. The format might be {"name": "ferm1", "timestamp":
   123456789, "status": "OK", "temp": 10.3, "sg": 1.009, "volume": 200}.


## Testing

The enclosed Ruby script "sensor_v1.rb" can be used to test the first version
of the protocol. It will simulate the sensor of the project and send 20 data
points one at a time. It will send them immediately (not simulate time).
You should feel free to copy the test program if you attempt the optional V2
protocol. You may want to add other test modes (like delay or configurable
number of data points, other errors).
