let clickedBtn = null;
let tripId;


//Handle photos
var multipleUploadForm = document.querySelector('#multipleUploadForm');
var multipleFileUploadInput = document.querySelector('#multipleFileUploadInput');

function uploadMultiplePhotos(files) {
    var formData = new FormData();
    for (var index = 0; index < files.length; index++) {
        formData.append("photos", files[index]);
        formData.append("tripId", tripId);
    }

    var xhr = new XMLHttpRequest();
    xhr.open("POST", "http://localhost:8080/tripPlan/uploadMultiplePhotos");

    xhr.onload = function () {
        if (xhr.status === 200) {
            console.log("success");
        } else {
            console.log("fail");
        }
    }
    xhr.send(formData);
}

multipleUploadForm.addEventListener('submit', function (event) {
    var files = multipleFileUploadInput.files;
    if (files.length === 0) {
        multipleFileUploadError.innerHTML = "Please select at least one file";
        multipleFileUploadError.style.display = "block";
    }
    uploadMultiplePhotos(files);
    $('#photosModal').modal('hide');
    event.preventDefault();
}, true);


//Angular
const App = angular.module("App", ['ngSanitize']);
App.controller("MainCtrl", function ($scope, $http, $timeout) {

    const username = document.getElementById("username").innerText.trim();
    tripId = document.getElementById("tripId").innerText.trim();
    const dateArray = [];//dates
    const dummyDates = [];
    const flightDateArray = [];
    const flightDates = [];
    const notesArray = []; //array of notes
    const budgetArray = [];
    const daysThatHaveBudget = [];
    const indexes = [];
    $scope.currency = "euro";   // Set default select option value
    $scope.currencies = {
        euro: '&euro;',
        dollar: '&dollar;',
        yen: '&yen;',
        pound: '&pound;'
    }

    const URL = "http://localhost:8080/tripPlan/tripPage/" + username + "/" + tripId;
    ///ean den exei accommodation ,petaei error...
    $http.get(URL)
        .then((response) => {
            const data = response.data;
            const accommodation = data.accommodation[0];
            const transportation = data.transportation;

            $scope.accommodation = accommodation;
            $scope.transportation = transportation;
            const notes = data.notes;
            $scope.location = data.location;
            const dailyBudget = data.dailyBudget;
            console.log(dailyBudget);


            const checkin = new Date(accommodation.checkin);
            const checkout = new Date(accommodation.checkout);
            const dates = getDates(checkin, checkout);


            //////////////////////////////
            dates.forEach(function (date) {
                let formatedDate = formatDate(date.getFullYear() + "-" + (date.getMonth() + 1) + "-" + date.getDate());
                dummyDates.push(date.getDate() + "/" + (date.getMonth() + 1));
                dateArray.push(formatedDate);
            });
            //////////////////////////
            transportation.forEach(function (item, index) {
                let date = new Date(transportation[index].departure.substring(0, 10));
                flightDates.push(formatDate(date));
            });
            flightDates.forEach(function (date) {
                flightDateArray.push(date);
            });
            ////////////////////////////
            notes.forEach(function (item, index) {
                notesArray.push(item);//array of notes                 
            });
            ////////////////

            dateArray.forEach(() => {
                budgetArray.push(0);
            });

            dailyBudget.forEach((dbudget) => {
                daysThatHaveBudget.push(dbudget.date);
            });

            dateArray.forEach((date, index) => {
                if (daysThatHaveBudget.includes(date)) {
                    indexes.push(index)
                }
            });

            dateArray.forEach((date, index) => {
                if (daysThatHaveBudget.includes(date)) {
                    indexes.push(index)
                }
            })

            dailyBudget.forEach((db, index) => {
                db.index = indexes[index]
            })

            dailyBudget.forEach((db, index) => {
                budgetArray[db.index] = db.dayBudget

            })

            console.log($scope.dates);

            console.log(budgetArray);

        }).catch((error) => {
            console.log(error);
        });

    $scope.budgetArray = budgetArray;

    $scope.dummyDates = dummyDates;
    $scope.dates = dateArray;

    $scope.printBudget = function (index) {
        document.getElementById(`dayBudget${index}`).innerText = budgetArray[index];
    };

    $scope.calculateTotalBudget = function () {
        let temp = 0;
        budgetArray.forEach((db) => {

            temp += parseInt(db);
        })

        document.getElementById("totalBudget").innerText = temp;

    }


    $scope.show = function (date) {

        return flightDateArray.includes(date);
    };


    $scope.currencyShow = function (index) {
        return (document.getElementById(`dayBudget${index}`).innerText.trim().length > 0);
    };


    $scope.addPost = function () {

        const title = $("#postModal #postTitle").val().trim();
        const body = $("#postModal #postBody").val().trim();

        let object = { title: title, body: body, tripId: tripId };
        let jsonObject = JSON.stringify(object);
        console.log(jsonObject);
        const URL = "http://localhost:8080/tripPlan/post/create";
        var req = {
            method: 'POST',
            url: URL,
            headers: {
                'Content-Type': 'application/json'
            },
            data: jsonObject
        };
        $http(req).then(function (response) {
            console.log("success");
        }).catch(() => {
            console.log("error");
        });
    };


    $scope.addNote = function (date, index) {
        console.log(date, index);

        const title = $(`#notesModal${date} #noteTitle${date}`).val().trim();
        const body = $(`#notesModal${date} #noteBody${date}`).val().trim();

        let object = { title: title, body: body, tripId: tripId, date: date };
        let jsonObject = JSON.stringify(object);
        const URL = "http://localhost:8080/tripPlan/tripPage/saveNote";
        var req = {
            method: 'POST',
            url: URL,
            headers: {
                'Content-Type': 'application/json'
            },
            data: jsonObject
        };
        $http(req).then(function (response) {
            console.log("success");
        }).catch(() => {
            console.log("error");
        });
    };


    $scope.addBudget = function (date, index) {

        console.log(budgetArray);

        const budget = $(`#budgetModal${index} #budget${index}`).val().trim();
        budgetArray[index] = budget;
        console.log(budgetArray);

        $scope.printBudget(index);
        $scope.calculateTotalBudget();


        let object = { dayBudget: budget, tripId: tripId, date: date };
        let jsonObject = JSON.stringify(object);
        console.log(jsonObject);
        const URL = "http://localhost:8080/tripPlan/tripPage/saveBudget";
        var req = {
            method: 'POST',
            url: URL,
            headers: {
                'Content-Type': 'application/json'
            },
            data: jsonObject
        };
        $http(req).then(function (response) {
            console.log("successfull saveBudget");
        }).catch(() => {
            console.log("error");
        });
    };


    $scope.showNote = function (index, date) {

        let URL = `http://localhost:8080/tripPlan/tripPage/getNotes/${tripId}/${date}`;
        $http.get(URL)
            .then((response) => {
                if (typeof response.data[0].date !== 'undefined') {
                    let date = response.data[0].date;
                }
                console.log(response.data);
                if (typeof date !== 'undefined' && typeof response.data[0].title !== 'undefined') {
                    $(`#notesModal${date} #noteTitle${date}`).val(response.data[0].title);
                }
                if (typeof date !== 'undefined' && typeof response.data[0].body !== 'undefined') {
                    $(`#notesModal${date} #noteBody${date}`).val(response.data[0].body);
                }
            }).catch(() => {
                console.log("No data");
            });
    };


    // $scope.showNotes = function (date) {
    //     notesArray.forEach(function (note, index) {
    //         if (note.date === date) {
    //             return true;
    //         }
    //     });
    // };


});



var getDates = function (startDate, endDate) {
    var dates = [],
        currentDate = startDate,
        addDays = function (days) {
            var date = new Date(this.valueOf());
            date.setDate(date.getDate() + days);
            return date;
        };
    while (currentDate <= endDate) {
        dates.push(currentDate);
        currentDate = addDays.call(currentDate, 1);
    }
    return dates;
};
function formatDate(date) {
    var d = new Date(date),
        month = '' + (d.getMonth() + 1),
        day = '' + d.getDate(),
        year = d.getFullYear();

    if (month.length < 2)
        month = '0' + month;
    if (day.length < 2)
        day = '0' + day;

    return [year, month, day].join('-');
}