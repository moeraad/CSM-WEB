<!DOCTYPE html>
<html>
    <head>
        <title>CSM homepage</title>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link href="https://fortawesome.github.io/Font-Awesome/assets/font-awesome/css/font-awesome.css" rel="stylesheet">

        <link rel="stylesheet" href="{{asset("css/bootstrap/css/bootstrap.min.css")}}">
        <link rel="stylesheet" href="{{asset("css/bootstrap/css/bootstrap-theme.min.css")}}">
        <link rel="stylesheet" href="{{asset("css/bootstrap-rtl\dist\css\bootstrap-rtl.css")}}">
        <link rel="stylesheet" href="{{asset("css/custom-bootstrap.css")}}">

        <script src="{{asset("js/jquery-3.2.1.min.js")}}"></script>
        <script src="{{asset("css/bootstrap/js/bootstrap.min.js")}}"></script>
        <script src="{{asset("js/custom-js.js")}}"></script>
    </head>
    <body>
        <nav class="navbar navbar-default">
            <div class="container-fluid">
                <ul class="nav navbar-nav navbar-right flip">
                    @if (Auth::guest())
                    <li><a href="{{ url('/login') }}">{{__("messages.login")}}</a></li>
                    @else
                        <li class="dropdown">
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">
                                {{ Auth::user()->name }}
                            </a>

                            <ul class="dropdown-menu" role="menu">
                                <li>
                                    <a href="{{ url('/logout') }}"
                                        onclick="event.preventDefault();
                                                 document.getElementById('logout-form').submit();">
                                        {{__("messages.logout")}}
                                    </a>

                                    <form id="logout-form" action="{{ url('/logout') }}" method="POST" style="display: none;">
                                        {{ csrf_field() }}
                                    </form>
                                </li>
                            </ul>
                        </li>
                    @endif
                </ul>
                <div class="navbar-header">
                    <a class="navbar-brand" href="#">
                        <img alt="Brand" src="{{asset("img/favicon.ico")}}" height="20">
                    </a>
                </div>
            </div>
        </nav>


        <div class="page-header">
            <div class="container">
                <h1>Example page header <small>Subtext for header</small></h1>
            </div>
        </div>

        <nav class="navbar navbar-default custom-nav">
            <div class="container-fluid">
                <!-- Brand and toggle get grouped for better mobile display -->
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
                        <span class="sr-only">Toggle navigation</span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>
                </div>

                <!-- Collect the nav links, forms, and other content for toggling -->
                <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                    {{menu("main","partials/nav")}}
                </div><!-- /.navbar-collapse -->
            </div><!-- /.container-fluid -->
        </nav>

        <div class="margin-bottom-15">
            <img src="{{asset("img/banner.jpg")}}" width="100%"/>
        </div>

        <div class="white-background">
            <div class="container">
                @yield('content')
            </div>
        </div>

    </div>

    <footer>
        <div class="footer" id="footer">
            <div class="container">
                <div class="row">
                    {{menu("main","partials/footer_nav")}}
                </div>
                <!--/.row-->
            </div>
            <!--/.container-->
        </div>
        <!--/.footer-->

        <div class="footer-bottom">
            <div class="container">
                <p class="flip pull-left">
                    <i class="fa fa-copyright" aria-hidden="true"></i>
                {{__("messages.copyrights")}}
                </p>
                <div class="flip pull-right">
                </div>
            </div>
        </div>
        <!--/.footer-bottom-->
    </footer>

</body>
</html>
