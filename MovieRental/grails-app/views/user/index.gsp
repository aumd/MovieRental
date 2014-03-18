<html lang="en">
<head>
	<meta name="layout" content="login"/>
	<meta charset="utf-8">
	<title>Movie Rental</title>
	
	<!-- Le styles -->
	
	<link href="css/prettify.css" rel="stylesheet">
	<link href="css/font-awesome.css" rel="stylesheet">
	<link href="css/site.css" rel="stylesheet">
	
    <style type="text/css">
      body {
		background-image: url("../images/img/tile.jpg");
        padding-top: 60px;
        padding-bottom: 40px;
      }
    </style>
	
    <link href="css/video-default.css" rel="stylesheet">
		
    <style>
            body{padding-top: 10px}
    </style>
	
</head>

<body>
	
	 <div class="container">
	 
      <div id="this-carousel-id" class="carousel slide">
        <div class="carousel-inner">
          <div class="item active">
            <a href="http://www.imdb.com/title/tt2015381/?ref_=nv_sr_1">  <img src="images/guardians.jpg" alt="Antennae Galaxies" />
            </a>
            <div class="carousel-caption">
              <p>Guardians of the Galaxy</p>
              <p><a href="http://www.imdb.com/title/tt2015381/?ref_=nv_sr_1">imdb &raquo;</a></p>
            </div>
          </div>
          <div class="item">
            <a href="http://www.imdb.com/title/tt1843866/?ref_=nv_sr_1">
              <img src="images/captain.jpg" alt="Carina Caterpillar" />
            </a>
            <div class="carousel-caption">
              <p>Captain America: Winter Soldier</p>
              <p><a href="http://www.imdb.com/title/tt1843866/?ref_=nv_sr_1">imdb &raquo;</a></p>
            </div>
          </div>
          <div class="item">
            <a href="http://www.imdb.com/title/tt1872181/?ref_=nv_sr_1">
              <img src="images/spidey.jpg" alt="Light Echo" />
            </a>
            <div class="carousel-caption">
              <p>Spiderman 2</p>
              <p><a href="http://www.imdb.com/title/tt1872181/?ref_=nv_sr_1">imdb &raquo;</a></p>
            </div>
          </div>
        </div><!-- .carousel-inner -->
        <!--  next and previous controls here
              href values must reference the id for this carousel -->
          <a class="carousel-control left" href="#this-carousel-id" data-slide="prev">&lsaquo;</a>
          <a class="carousel-control right" href="#this-carousel-id" data-slide="next">&rsaquo;</a>
      </div><!-- .carousel -->
      <!-- end carousel -->
	  
			
			
            <div class="row">
                <div class="span7">
                    <h3>In-Demand Movies</h3>
                    <div class="row">
                        <code class="pull-left span6">
                        </code>
                    </div>
                    <h3>Recommended Movies</h3>
                    <div class="row">
                        <code class="pull-left span6">
                        </code>
                    </div>
                </div>
                <div class="span5">
                    <h1>Latest Trailers</h1>
					<h4><a href="http://www.imdb.com/title/tt1843866/?ref_=nv_sr_1">Captain America: Winter Soldier</a></h4>
                    <div class="videoUiWrapper thumbnail">
                        <video width="370" height="214"  id="demo1">
                            <source src="http://brightcove.vo.llnwd.net/d21/unsecured/media/184253309/201402/527/184253309_3241832064001_CaptainAmerica2-GiftNRH-DICA3111H-Online-NoSlate-H264.mp4?videoId=3241820739001&lineUpId=&pubId=184253309&playerId=2835605405001&affiliateId=" type="video/ogg"> 
                            <source src="http://brightcove.vo.llnwd.net/d21/unsecured/media/184253309/201402/527/184253309_3241832064001_CaptainAmerica2-GiftNRH-DICA3111H-Online-NoSlate-H264.mp4?videoId=3241820739001&lineUpId=&pubId=184253309&playerId=2835605405001&affiliateId=" type="video/mp4">
                            Your browser does not support the video tag.
                        </video>
                    </div>
				</div>
		</div>
     </div>

	
<!-- for Modal -->
	<g:if test="${flash.message }">
		<%--<div class="message">
			${flash.message}
		</div>--%>
	</g:if>
	<g:if test="${session.user }">
		<br/>
		Login as : ${session.user } | <g:link action="logout">Logout</g:link>
	</g:if>
	<g:else>
		<div class="container">
		 <div id="example" class="modal hide fade in" style="display: none; ">
        	<div class="modal-header">
            	<a class="close icon-remove" data-dismiss="modal"></a>
				<h3>Please Login</h3>
            </div>
            <div class="modal-body">
            	<g:form controller="user" action="login">
					<center>
					<input type="text" name="user_name" value="${user_name}" placeholder="Username"/><br/>
					<input type="password" name="password" value="${password}" placeholder="Password"/><br/>
					<input type="submit" class="btn btn-primary btn-default" value="Login"/>
					</center>
				</g:form>		        
            </div>
            <div class="modal-footer">
              	<%--<a href="#" class="btn btn-success">Confirm</a>--%>
            	<a href="#" class="btn" data-dismiss="modal">Close</a>
            </div>
         </div>
		</div>
			<center><a data-toggle="modal" href="#example" class="btn btn-success btn-large">Login</a></center>

		<%--<g:form controller="user" action="login" style="padding-left:450px">
		<h1>Please sign-in</h1>
		<div id="main" style="width:100px">
		<script type="text/javascript" src="js/contact-form.js"></script>
		<div class="forms">
			<input type="text" name="user_name" value="${user_name}" placeholder="Username"/>
			<input type="password" name="password" value="${password}" placeholder="Password"/>
			<input type="submit" class="btn btn-primary btn-default" value="Login"/>
		</div>
		</div>
		</g:form>--%>
	</g:else>
<!-- MODAL ends here-->

   <!-- Le javascript
    ================================================== -->
    <!-- Grab Google CDN's jQuery, with a protocol relative URL; fall back to local if necessary -->
    <script src="//ajax.googleapis.com/ajax/libs/jquery/1.7.2/jquery.min.js"></script>
    <script>window.jQuery || document.write('<script src="js/jquery-1.7.2.min.js"><\/script>')</script>
    <!-- Bootstrap jQuery plugins compiled and minified -->
    <script src="js/bootstrap.min.js"></script>
    <script>
      $(document).ready(function(){
        $('.carousel').carousel({
          interval: 4000
        });
      });
    </script>
	
	 <script type="text/javascript" src="js/jquery-1.8.1.min.js"></script>
     <script type="text/javascript" src="js/jquery.video-ui.js"></script>
     <script type="text/javascript" >
            $('#demo1').videoUI();
     </script>
</body>
</html>