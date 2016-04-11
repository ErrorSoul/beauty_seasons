angular.module "app"
  .controller "MyController", [
    "$scope",
    ($scope) ->
      $scope.tabEqual = (tab) ->
        $scope.tab = tab

      $scope.isTab = (tab) ->
        $scope.tab is tab


  ]
