/**
 * Created by fall on 2015/12/9.
 */
var godownNotPerfect = angular.module('godownNotPerfect', []);

godownNotPerfect.controller('godownNotPerfectCtrl', function ($scope, $http) {
    //$http({
    //    method: 'POST',
    //    url: 'http://test.bigniu.cn:8122//',
    //    data: {'activity_id': $scope.activity_id},
    //    headers: {'Content-Type': 'application/x-www-form-urlencoded'}
    //});
    $scope.coser = {
        name:"系渡人",
        head_url:"../cosplay/godown_not_perfect/23.png"
    };
});

