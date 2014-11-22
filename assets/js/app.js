(function(angular, $) {
	angular.module('kineticChallenge', ['gas'])
	.controller('StationListCtrl', ['$scope', 'stationList', function($scope, stationList) {
		// $scope.zip = '66207';
		$scope.stations = stationList.stations;
		$scope.refresh = stationList.refresh;
		$scope.refresh($scope.zip);
	}]);

	$('input[ng-model=zip]').keyup(function(event){
	    if(event.keyCode === 13){
	        $('button[type=submit]').click();
	    }
	});
})(window.angular, window.jQuery);
