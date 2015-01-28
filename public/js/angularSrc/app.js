var app = angular.module('decisions', ['directives']);

app.controller('LoginCtrl', function($scope) {
  $scope.modalShown = false;
  $scope.toggleModal = function() {
    $scope.modalShown = !$scope.modalShown;
  };
});
