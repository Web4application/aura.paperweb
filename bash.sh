npm install
npm run build
npm run export

flask run --port 5000 - Main Flask app
flask run --port 5001 - Secondary Flask app
dotnet run --urls="http://localhost:5000" - Main .NET app
dotnet run --urls="http://localhost:5001" - Secondary .NET app
Configure environment-specific ports
