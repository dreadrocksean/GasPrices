<html ng-app="kineticChallenge">
<head>
	<link rel="stylesheet" type="text/css" href="/assets/css/app.css">

  <script src="//ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
  <script src="//ajax.googleapis.com/ajax/libs/angularjs/1.3.3/angular.min.js"></script>
  <script src="/assets/js/app.js"></script>
  <script src="/assets/js/gas.js"></script>
</head>
<body ng-controller="StationListCtrl">
	<div class="container">
		<header>Gas Stations by Zip (3 mi radius)</header>
		<input type="text" placeholder="Enter Zip" ng-model="zip">
	  <button type="submit" ng-click="refresh(zip)">Update List</button>
	  <ul>
			<li ng-repeat="station in stations">
			  <span>Station: {{station.station}}</span>
			  <span class="address">- {{station.address}}</span>
			  <span>- ${{station.reg_price}}</span>
			</li>
	  </ul>
	</div>
	<div class="overlay"><div class="spinner"></div></div>
</body>
</html>