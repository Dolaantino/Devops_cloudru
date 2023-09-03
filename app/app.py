from http.server import BaseHTTPRequestHandler
from http.server import HTTPServer
import os

class HttpGetHandler(BaseHTTPRequestHandler):
    """Обработчик с реализованным методом do_GET."""

    def do_GET(self):
       # self.wfile.write('<html><head><meta charset="utf-8">'.encode())
       # self.wfile.write('<title>Простой HTTP-сервер.</title></head>'.encode())
        if self.path == '/author':
            stream = os.popen('echo $AUTHOR')
            output = stream.read()
            self.send_response(200)
            self.send_header("Content-type", "text/html")
            self.end_headers()
            self.wfile.write(f'<html><body>{output}</body></html>'.encode())
        elif self.path == '/hostname':
            stream = os.popen('hostname')
            output = stream.read()
            self.send_response(200)
            self.send_header("Content-type", "text/html")
            self.end_headers()
            self.wfile.write(f'<html><body>{output}</body></html>'.encode())
        elif self.path == '/id':
            stream = os.popen('echo $UUID')
            output = stream.read()
            self.send_response(200)
            self.send_header("Content-type", "text/html")
            self.end_headers()
            self.wfile.write(f'<html><body>{output}</body></html>'.encode())
        elif self.path == '/':
            self.send_response(200)
            self.send_header("Content-type", "text/html")
            self.end_headers()
            self.wfile.write('<html><body>endpoints:<br/>/author<br/>/hostname<br/>/id</body></html>'.encode())
            

def run(server_class=HTTPServer, handler_class=BaseHTTPRequestHandler):
  server_address = ('', 8000)
  httpd = server_class(server_address, handler_class)
  try:
      httpd.serve_forever()
  except KeyboardInterrupt:
      httpd.server_close()

reguestHandler = HttpGetHandler
run(handler_class=reguestHandler)

