(function(angular, $) {
	'use strict';
	angular.module('app', ['gas'])
	.controller('StationListCtrl', ['$scope', 'stationList', function($scope, stationList) {
		$scope.stations = stationList.stations;

		$scope.refresh = function(zip) {
			if (!zip) {return;}
			$('.overlay').fadeIn();
			$('ul').fadeOut(function() {
				stationList.stations.length = 0;
			});
			stationList.refresh(zip, function() {
				$('.overlay').fadeOut();
				$('ul').fadeIn();
			});
		};
	}]);
})(window.angular, window.jQuery);
