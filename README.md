<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Smart Fire Alarm System</title>
</head>
<body>

<!-- Demo Video -->
<div>
  <h1>Demo Video</h1>
  <a href="https://youtu.be/U9qUD1utQFw">Demo Video</a>
  <br>
  <br>
 
</div>

<!-- Project Overview -->
<div>
  <h1>Smart Fire Alarm System</h1>
  <p>Welcome to the Smart Fire Alarm System, a Flutter-based project designed to enhance fire safety. This system utilizes Google's Flutter framework for a cross-platform experience. It integrates with Twilio's API to send SMS alerts, includes a mapping functionality to locate nearby fire stations, and calculates distances for efficient emergency response.</p>
</div>

<!-- Getting Started -->
<div>
  <h2>Getting Started</h2>
  <h3>Prerequisites</h3>
  <ul>
    <li>Make sure you have Flutter installed. If not, follow the <a href="https://flutter.dev/docs/get-started/install">official installation guide</a>.</li>
    <li>Clone the repository:<br>
      <code>git clone https://github.com/mihretgold/smart-fire-alarm.git</code></li>
    <li>Navigate to the project directory:<br>
      <code>cd smart-fire-alarm</code></li>
  </ul>
  <h3>Installation</h3>
  <p>Run the following command to fetch the project dependencies:</p>
  <pre><code>flutter pub get</code></pre>
</div>

<!-- Running the App -->
<div>
  <h2>Running the App</h2>
  <ul>
    <li>Connect your mobile device or emulator.</li>
    <li>Execute the following command to launch the app:<br>
      <code>flutter run</code></li>
  </ul>
</div>

<!-- Features -->
<div>
  <h2>Features</h2>
  <h3>SMS Alert System</h3>
  <p>Utilizes the Twilio package API to send SMS alerts. Sends location details and a customized message to emergency contacts or fire stations.</p>

  <h3>Map Functionality</h3>
  <p>Uses the Flutter Map package to integrate mapping capabilities. Displays local fire stations in Addis Ababa as markers on the map. Retrieves user location using the Geolocator package.</p>

  <h3>Distance Calculation</h3>
  <p>Calculates the distance between the user's location and each fire station. Sorts fire stations based on proximity to the user.</p>

  <h3>Polylines</h3>
  <p>Draws polylines between the user's location and each fire station on the map.</p>

  <h3>Emergency Calling</h3>
  <p>Integrates the URL Launcher package to enable emergency calls to contacts or the nearest fire station.</p>
</div>

<!-- Contribution Guidelines -->
<div>
  <h2>Contribution Guidelines</h2>
  <p>We welcome contributions! Feel free to submit issues, feature requests, or pull requests.</p>
</div>

<!-- License -->
<div>
  <h2>License</h2>
  <p>This project is licensed under the <a href="LICENSE">MIT License</a>.</p>
</div>

</body>
</html>
