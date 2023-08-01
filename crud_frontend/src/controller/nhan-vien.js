window.NhanVienController = function ($scope, $http, $routeParams, $location) {
  $scope.listNV = [];
  $scope.listCH = [];

  $scope.totalPages = 0;
  $scope.listPageNo = [];
  $scope.x = {
    id: "",
    ma: "",
    ten: "",
    gioiTinh: true,
    sdt: "",
    diaChi: "Nam Định",
    idCH: "8f35ee64-8a8b-4b26-9bf0-180a5324080d",
  };
  $http.get(api + "/cuahangs").then(function (response) {
    $scope.listCH = response.data;
  });

  $scope.pageNo = 0;
  $scope.maSearch = "";
  $scope.sdtSearch = "";
  $scope.diaChiSearch = "";
  // $scope.loadData = function () {
  //   $scope.searchNV = function (event) {
  //     event.preventDefault();
  //     $http
  //       .get(
  //         api  + "/show"
  //           // "/show?pageNo=" +
  //           // $scope.pageNo +
  //           // "&maSearch=" +
  //           // $scope.maSearch +
  //           // "&sdtSearch=" +
  //           // $scope.sdtSearch +
  //           // "&diaChiSearch=" +
  //           // $scope.diaChiSearch
  //       )
  //       .then(function (response) {
  //         console.log("a[i");
  //         console.log(
  //           api + "/show"
  //             // "/show?pageNo=" +
  //             // $scope.pageNo +
  //             // "&maSearch=" +
  //             // $scope.maSearch +
  //             // "&sdtSearch=" +
  //             // $scope.sdtSearch +
  //             // "&diaChiSearch=" +
  //             // $scope.diaChiSearch
  //         );
  //         console.log(response.data);
  //         $scope.listNV = [];
  //         $scope.listNV = response.data.content;
  //         for (var i = 0; i < response.data.totalPages; i++) {
  //           $scope.listPageNo.push(i);
  //         }
  //         $scope.totalPages = response.data.totalPages;
  //         $scope.listNV = response.data.content;
  //       });
  //   };
  //   $scope.searchNV(event);
  // };

  $scope.currentPage = 1;  
  $scope.itemsPerPage = 2; 

  $scope.loadData = function () {
    $http.get(api + "/show").then(
      function (response) {
        $scope.listNV = response.data;
        console.log("Success", res);
      },
      function (err) {
        console.log("Error", err);
      }
    )
  };

  // $scope.totalPages = function () {
  //   return Math.ceil($scope.data.length / $scope.itemsPerPage);
  // };
  // $scope.setPage = function (page) {
  //   $scope.currentPage = page;
  // };


  $scope.loadData();

  // add
  $scope.add = function (event) {
    event.preventDefault();
    $scope.x.id = null;
    $http.post(api + "/add", $scope.x).then(
      function (response) {
        alert("them thanh cong");
        $location.path(api + "/show");
      },
      function (response) {
        alert("that bai");
        console.log(response);
      }
    );
  };

  $scope.idSua = "";
  $scope.detail = function (event, id) {
    event.preventDefault();
    $http.get(api + "/detail/" + id).then(function (response) {
      $scope.x = response.data;
      $scope.x.idCH = response.data.cuaHang.id;
      $scope.idSua = id;
    });
  };

  $scope.update = function (event) {
    event.preventDefault();
    console.log($scope.idSua);
    $http
      .put(api + "/update/" + $scope.idSua, $scope.x)
      .then(function (response) {
        alert("Update thanh cong");
        console.log(response);
        $location.path(api + "/show");
      });
  };

  $scope.remove = function (event, id) {
    event.preventDefault();
    $http.delete(api + "/delete/" + id).then(
      function (response) {
        alert("Xoa thanh cong");
        $location.path(api + "/show");
      },
      function (response) {
        alert("xoa that bai");
      }
    );
  };

  // phan trang
  $scope.prevPage = function () {
    if ($scope.pageNo < 0) {
      return alert("Page không được < 1");
    }
    $scope.pageNo--;
    $scope.loadData();
  };
  $scope.nextPage = function () {
    if ($scope.pageNo + 1 >= $scope.totalPages) {
      return alert("Page không được > " + $scope.totalPages);
    }
    $scope.pageNo++;
    $scope.loadData();
  };
  $scope.customPage = function (index) {
    $scope.pageNo = index;
    $scope.loadData();
  };
};
