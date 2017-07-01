<!DOCTYPE html>

<html>

<head>
    <title>Lector de expresiones</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">

    <!-- Latest compiled and minified CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">

    <!-- Latest compiled and minified JavaScript -->
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>

    <style type="text/css">
        *,body {
          color:white;
        }
    
        body {
          margin: 0px;
          /*font-family: "Helvetica Neue", Helvetica, Arial, sans-serif;*/
          font-size: 20px;
          	  background:
    		radial-gradient(hsl(0, 100%, 27%) 4%, hsl(0, 100%, 18%) 9%, hsla(0, 100%, 20%, 0) 9%) 0 0,
    		radial-gradient(hsl(0, 100%, 27%) 4%, hsl(0, 100%, 18%) 8%, hsla(0, 100%, 20%, 0) 10%) 50px 50px,
    		radial-gradient(hsla(0, 100%, 30%, 0.8) 20%, hsla(0, 100%, 20%, 0)) 50px 0,
    		radial-gradient(hsla(0, 100%, 30%, 0.8) 20%, hsla(0, 100%, 20%, 0)) 0 50px,
    		radial-gradient(hsla(0, 100%, 20%, 1) 35%, hsla(0, 100%, 20%, 0) 60%) 50px 0,
    		radial-gradient(hsla(0, 100%, 20%, 1) 35%, hsla(0, 100%, 20%, 0) 60%) 100px 50px,
    		radial-gradient(hsla(0, 100%, 15%, 0.7), hsla(0, 100%, 20%, 0)) 0 0,
    		radial-gradient(hsla(0, 100%, 15%, 0.7), hsla(0, 100%, 20%, 0)) 50px 50px,
    		linear-gradient(45deg, hsla(0, 100%, 20%, 0) 49%, hsla(0, 100%, 0%, 1) 50%, hsla(0, 100%, 20%, 0) 70%) 0 0,
    		linear-gradient(-45deg, hsla(0, 100%, 20%, 0) 49%, hsla(0, 100%, 0%, 1) 50%, hsla(0, 100%, 20%, 0) 70%) 0 0;
    		background-color: #300; 
    		background-size: 100px 100px;
        }
    	
    	.css-input { 
    	 margin: 0px auto;
    	 width:55% ;border-width:4px; font-size:21px; padding:10px; background-color:#f5f5f5; border-radius:0px; border-style:solid; border-color:#3b353b;  } 
    			 .css-input:focus { outline:none; } 
    
    	.expresion{
    		border-radius: 10px 10px 10px 10px;
    		-moz-border-radius: 10px 10px 10px 10px;
    		-webkit-border-radius: 10px 10px 10px 10px;
    		border: 2px solid #000000;
    		
    		-webkit-box-shadow: 10px 10px 5px 0px rgba(0,0,0,0.75);
    -moz-box-shadow: 10px 10px 5px 0px rgba(0,0,0,0.75);
    box-shadow: 10px 10px 5px 0px rgba(0,0,0,0.75);
    
    
    
    background-color: rgba(255, 255, 255, 0.6);
    
    margin-bottom: 15px;
    	}
    </style>
</head>

<body>

    <div class="row">
        <div align="center">
            <h1 class="logo col-md-4 col-md-offset-4" style="color:white">Lector de expresiones</h1>
        </div>
    </div>
    <br>
    <div class="row">
        <div class="details col-md-4 col-md-offset-4" align="center">
            Detalles de la expresión {{ .entrada }}
        </div>
    </div>
    <br> {{range $index, $val := .caracteres }}
    <div class="expresion col-md-6 col-md-offset-3">
        <div class="col-md-5">
            <div style="color: black">
                <h3>Carácter: {{ $val | caracter}}</h3>
            </div>
        </div>
        <div class="col-md-7">
            <div style="color: black">
                <h3>Nombre: {{ $val | nombre}}</h3>
            </div>
        </div>

    </div>
    <br> {{end}}
    <div class="row">
        <div class="error col-md-4 col-md-offset-4" align="center">
            {{ .error }}
        </div>
    </div>
    <div class="row">
        <div class="result col-md-4 col-md-offset-4" align="center">
            <h4 style="color:white;">Resultado de la evaluación de esta expresión: {{ printf "%.2f" .resultado }}</h4>
        </div>
    </div>
    <div class="row">
        <div class="error col-md-4 col-md-offset-4" align="center">
            <a style="color:gray;" href="/">Insertar otra expresión</a>
        </div>
    </div>

</body>

</html>