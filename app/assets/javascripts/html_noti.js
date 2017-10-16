function notifyMe() {
    // Let's check if the browser supports notifications
    if (!("Notification" in window)) {
      alert("This browser does not support desktop notification");
    }
  
    // Let's check whether notification permissions have already been granted
    else if (Notification.permission === "granted") {
      // If it's okay let's create a notification
      var msg={
          body: " 예약 요청인:한수민" +
                " 날짜:2017.10.10\n" +
                " 시간:7:00~21:00 \n" +
                " 인원:2           \n "+
                " 기타요청사항: 마이크 있나요? "
      }
      var notification = new Notification("예약 요청이 들어왔습니다",msg);
    }
  
    // Otherwise, we need to ask the user for permission
    else if (Notification.permission !== 'denied') {
      Notification.requestPermission(function (permission) {
        // If the user accepts, let's create a notification
        if (permission === "granted") {
          var notification = new Notification("Hi there!");
        }
      });
    }
  
    // At last, if the user has denied notifications, and you 
    // want to be respectful there is no need to bother them any more.
  }Notification.requestPermission().then(function(result) {
    console.log(result,"hihi");
  });
  function spawnNotification(theBody,theIcon,theTitle) {
    var options = {
        body: theBody,
        icon: theIcon
    }
    console.log(theBody,theIcon,theTitle);
    var n = new Notification(theTitle,options);
  }