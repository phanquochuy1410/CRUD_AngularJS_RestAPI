window.NhanVienController = function ($scope, $http, $routeParams, $location) {

    $scope.listNV = [];
    $scope.listCV = [];

    $scope.x = {

    };

    $http.get(api + "/showChucVu").then(function (response) {
        $scope.listCV = response.data;
    });

    $scope.totalPages = 0;
    $scope.listPageNo = [];
    $scope.pageNo = 0;

    $scope.loadData = function () {
        $http.get(api + "/show").then(
            function (response) {
                $scope.listNV = [];
                $scope.listNV = response.data.content;
                for (var i = 0; i < response.data.totalPages; i++) {
                    $scope.listPageNo.push(i);
                }
                $scope.totalPages = response.data.totalPages;
                $scope.listNV = response.data.content;
            });
    }
    $scope.loadData();

    //Add
    $scope.add = function (event) {
        event.preventDefault();
        $scope.x.id = null;
        $http.post(api + "/add", $scope.x).then(
            function (response) {
                alert("Thêm thành công !");
                $location.path(api + "/show");
            },
            function (err) {
                alert("Thêm thất bại !");
            }
        );
    };

    //Detai
    $scope.idSua = "";
    $scope.detail = function (event, id) {
        event.preventDefault();
        $http.get(api + "/detail/" + id).then(
            function (response) {
                $scope.x = response.data;
                $scope.x.idChucVu = response.data.idChucVu.id;
                $scope.idSua = id;
            }
        )
    }

    //Delete
    $scope.delete = function (event, id) {
        event.preventDefault();
        $http.delete(api + "/delete/" + id).then(
            function (response) {
                alert("Xóa thành công !");
                $location.path(api + "/show")
            },
            function (response) {
                alert("Xóa thất bại !");
            }
        );
    };


    //update
    $scope.update = function (event) {
        event.preventDefault();
        console.log($scope.idSua);
        $http.put(api + "/update/" + $scope.idSua, $scope.x).then(
            function (response) {
                alert("Sửa thành công !");
                $location.path(api + "/show");
            },
            function (response) {
                alert("Sửa thất bại !");
            }
        );
    };

    //Search
    $scope.maSearch = "";
    // $scope.tenSearch = "";
    $scope.search = function (event) {
        event.preventDefault();
        $http.get(api + "/search?ma").then(
            function (response) {
                $scope.listNV = response.data;
                console.log("Thành công !" , response);
            },
            function (err) {
                console.log("Thất bại !" , err);
            }
        );
    };

    //Phân trang

    $scope.prevPage = function () {
        $scope.pageNo = 0;
        $scope.loadData();
    };

    $scope.prevPages = function () {
        if ($scope.pageNo < 0) {
            return alert("Page không được < 1");
        }
        $scope.pageNo--;
        $scope.loadData();
    };
    $scope.nextPages = function () {
        if ($scope.pageNo + 1 >= $scope.totalPages) {
            return alert("Page không được > " + $scope.totalPages);
        }
        $scope.pageNo++;
        $scope.loadData();
    };
    $scope.nextPage = function () {
        $scope.pageNo = $scope.totalPages;
        $scope.loadData();
    };

}

