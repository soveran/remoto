require "socket"
require "cuba"

class Remoto < Cuba
  OPTIONS = Hash.new
  OPTIONS[:port] = 5450
  OPTIONS[:brow] = 32000

  PAGE = <<-EOS
  <!DOCTYPE html>
  <html lang="en">
  <head>
    <meta charset="UTF-8" />
    <style>
      body {
        font-family: sans-serif;
        background: yellow;
        margin: 0;
        padding: 0;
      }

      a {
        display: block;
        color: #f00;
        text-decoration: none;
      }
    </style>

    <title>Remoto</title>
  </head>
    <body>
      <a id="next" href="/next">Next</span></a>
      <a id="prev" href="/prev">Prev</span></a>
    </body>
    <script type="text/javascript">
      n = document.getElementById("next");
      n.style.fontSize = window.innerHeight * 0.8 + "px";

      p = document.getElementById("prev");
      p.style.fontSize = window.innerHeight * 0.2 + "px";
    </script>
  </html>
  EOS

  module Slides
    def self.browser
      TCPSocket.new("localhost", OPTIONS[:brow])
    end

    def self.show(page)
      browser.tap do |socket|
        socket.write("#{page}()")
        socket.close
      end
    end
  end

  define do
    res.write PAGE

    on "(prev|next)" do |page|
      Slides.show(page)
    end
  end
end
