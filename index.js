const http = require('http');
const os = require('os');

const server = http.createServer((req, res) => {
  res.writeHead(200, { 'Content-Type': 'text/plain' });
  const ipAddress = req.connection.remoteAddress;
  const hostname = os.hostname();
  const version = process.env.VERSION || '1.0.0'; // Wersja aplikacji, domyślnie 1.0.0, można nadpisać podczas budowania obrazu Docker
  res.end(`IP Address: ${ipAddress}\nHostname: ${hostname}\nVersion: ${version}\n`);
});

const PORT = process.env.PORT || 8888; // Port, na którym serwer będzie nasłuchiwać, domyślnie 3000
server.listen(PORT, () => {
  console.log(`Server running on port ${PORT}`);
});
