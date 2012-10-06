Remoto
======

Remote control for browsers

Description
-----------

Remoto controls browsers that accept javascript via TCP, like Firefox
with the [Remote Control][rc] add-on.

It brings up a webserver on port `5450` (you can change it), and binds
it to `0.0.0.0`. You can then access it with any mobile device, like
an iPod, and use it to remote control a browser in the host computer.

A few assumptions: Remoto takes for granted that the browser will know
what to do with the `prev()` and `next()` javascript functions. It is
the way [Filmo][filmo] works, and you can adapt any other presentation
tool to make sense of these two functions.

[rc]: https://addons.mozilla.org/en-US/firefox/addon/remote-control/
[filmo]: http://files.soveran.com/filmo

## Usage

```
$ remoto [-p port] [-b browser-port]
```

The default value for port is `5450`, and the default value for
browser-port is `32000`, which happens to be the default in the
[Remote Control] Firefox add-on.

## Installation

As usual, you can install it using rubygems.

```
$ gem install remoto
```
