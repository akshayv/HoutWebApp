<html>
  <head>
    <title> Hout WebApp</title>
     <script src="js/jquery1.10.js"></script>
      <link href="css/bootstrap-responsive.min.css" rel="stylesheet">
      <link href="css/bootstrap.min.css" rel="stylesheet">
      <style>
          body {
              padding-top: 40px;
              padding-bottom: 40px;
              background-color: #f5f5f5;
          }

          .form-signin {
              max-width: 300px;
              padding: 19px 29px 29px;
              margin: 0 auto 20px;
              background-color: #fff;
              border: 1px solid #e5e5e5;
              -webkit-border-radius: 5px;
              -moz-border-radius: 5px;
              border-radius: 5px;
              -webkit-box-shadow: 0 1px 2px rgba(0,0,0,.05);
              -moz-box-shadow: 0 1px 2px rgba(0,0,0,.05);
              box-shadow: 0 1px 2px rgba(0,0,0,.05);
          }
          .form-signin .form-signin-heading,
          .form-signin  {
              margin-bottom: 10px;
          }
          .form-signin input[type="text"],
          .form-signin input[type="password"] {
              font-size: 16px;
              height: auto;
              margin-bottom: 15px;
              padding: 7px 9px;

          }
      </style>
      <script language="JavaScript">
         function createMeetupOnServer() {
             var description = $('#desc').val();
             var suggLocation = $('#location').val();
             var suggTime = $('#time').val();
             var suggestions = $('#check_sugg').is(':checked');
             var twitter = $('#check_twitter').is(':checked');
             var fb = $('#check_fb').is(':checked');
             var url = 'Communication?methodName=create_meetup&description='+description+'&suggestedLocation='+
                     suggLocation+'&suggestedDate='+suggTime+'&isSuggestionsAllowed='+suggestions
                     +'&isFacebookSharing='+fb+'&isTwitterSharing='+twitter+'&inviteeIds=2';
             $.getJSON(url, function(){
                alert('Meetup Created!');
             });
         }
     </script>
  </head>
  <body>
  <div class="container">

      <div class="form-signin">
          <img src="img/hout.png" class="img-rounded" style="display:block;margin: 0 auto;height:100px;">
          <h2 class="form-signin-heading">Hout</h2>
          <input type="text" class="input-block-level" placeholder="Descripton" id="desc">
          <input type="text" class="input-block-level" placeholder="Suggested Location" id="location">
          <input type="text" class="input-block-level" placeholder="Suggested Time"  id="time">
          <div style='position: relative;left:20%;'>
              <input type="checkbox" id="check_sugg" checked> Suggestions</input>
              <br>
              <input type="checkbox" id="check_fb"> Facebook Sharing</input>
              <br>
              <input type="checkbox" id="check_twitter"> Twitter Sharing</input>
              <br>
          </div>
          <br>
          <button class="btn btn-large btn-primary" type="submit" style="display:block;margin: 0 auto;" onclick="createMeetupOnServer()">Create Meetup</button>
          <br>
          <button class="btn btn-small btn-primary" type="submit" style="display:block;margin: 0 auto;" onclick="window.location='meetups.html'">Show Meetups</button>
      </div>

  </div>
  </body>
</html>