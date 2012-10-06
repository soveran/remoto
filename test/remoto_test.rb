require "cutest"

require_relative "../lib/remoto"

def expect(port, str)
  server = TCPServer.new('localhost', port)

  s = server.accept

  msg = s.read

  assert_equal msg, str

  s.write("{}")
  s.close
end

def check(port, str)
  t = Thread.new { expect(port, "#{str}()") }

  env = { "PATH_INFO" => "/#{str}", "SCRIPT_NAME" => "/" }

  Remoto::OPTIONS[:brow] = port

  _, _, resp = Remoto.call(env)

  body = resp.join

  assert body[/Remoto/]
  assert body[/Next/]

  t.join
end

test "commands" do
  check 32001, "prev"
  check 32002, "next"
end
