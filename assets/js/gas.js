angular.module('gas', [])
.factory('stationList', ['$http', function($http) {
	var stations = [];

	var getGeoUrl = function(zip) {
		return 'http://maps.googleapis.com/maps/api/geocode/json?address=' + zip;
	};
	
	var getStationsUrl = function(lat, lng) {
		var dist = 3;
		var type = 'reg';
		var sort = 'price';
		var API_KEY = 'rfej9napna';

		return 'http://devapi.mygasfeed.com//stations/radius/' +
			lat + '/' + lng + '/' + dist + '/' + type + '/' + sort + '/' + API_KEY +
			'.json';
	};

	var refresh = function(zip) {
		if (!zip) {return;}
		$('.overlay').fadeIn();
		$('ul').fadeOut(function() {
			stations.length = 0;
		});
		
		return $http.get(getGeoUrl(zip)).success(function(data) {
			var lat = data.results[0].geometry.location.lat;
			var lng = data.results[0].geometry.location.lng;
			return $http.get(getStationsUrl(lat, lng)).success(function(data) {
				angular.forEach(data.stations, function(station) {
			    	stations.push(station);
				});
				$('.overlay').fadeOut();
				$('ul').fadeIn();
			});
		});
	};

	return {
		stations: stations,
		refresh: refresh
	}
}]);