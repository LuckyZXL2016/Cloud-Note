<%@ page import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%String basePath = request.getContextPath(); %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <title>Stilearn Admin Bootstrap</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta name="description" content="">
        <meta name="author" content="stilearning">

        <meta http-equiv="x-pjax-version" content="v173">

        <!-- Place favicon.ico and apple-touch-icon.png in the root directory -->
        <!-- fav and touch icons -->
        <link rel="apple-touch-icon-precomposed" sizes="144x144" href="<%=basePath%>/ico/favico-144-precomposed.png">
        <link rel="apple-touch-icon-precomposed" sizes="114x114" href="<%=basePath%>/ico/favico-114-precomposed.png">
        <link rel="apple-touch-icon-precomposed" sizes="72x72" href="<%=basePath%>/ico/favico-72-precomposed.png">
        <link rel="apple-touch-icon-precomposed" href="<%=basePath%>/ico/favico-57-precomposed.png">
        <link rel="shortcut icon" href="<%=basePath%>/ico/favico.png">
        <link rel="shortcut icon" href="<%=basePath%>/ico/favico.ico">

        <link rel="stylesheet" href="<%=basePath%>/styles/9281c719.vendor.css"/>
        
        <link rel="stylesheet" href="<%=basePath%>/styles/3fc417cd.main.css"/>
        
        <!-- Le HTML5 shim, for IE6-8 support of HTML5 elements -->
        <!--[if lt IE 9]>
          <script src="//cdnjs.cloudflare.com/ajax/libs/html5shiv/3.7/html5shiv.min.js"></script>
        <![endif]-->
    </head>

    <body class="animated fadeIn">
    	<input id="hidden_now_rowkey" type="hidden">
    	<input id="hidden_now_notebook" type="hidden">
    	
    	<input id="hidden_now_noterowkey" type="hidden">
    	<input id="hidden_now_note" type="hidden">
        <!-- section header -->
        <header class="header">
            <!-- header brand -->
            <div class="header-brand">
                <!-- <h2><a data-pjax=".content-body" href="index.php"><span class="text-primary">Sti</span>learn</a></h2> -->
                <a data-pjax=".content-body" href="index.php">
                    <img class="brand-logo" src="<%=basePath%>/images/dummy/8986f28e.stilearn-logo.png" alt="Stilearn Admin Sample Logo">
                </a>
            </div><!-- header brand -->
            
            <!-- header-profile -->
            <div class="header-profile">
                <div class="profile-nav">
                    <span class="profile-username">Bent</span>
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                        <span class="fa fa-angle-down"></span>
                    </a>
                    <ul class="dropdown-menu animated flipInX pull-right" role="menu">
                        <li><a href="#"><i class="fa fa-user"></i> Profile</a></li>
                        <li><a href="#"><i class="fa fa-envelope"></i> Inbox</a></li>
                        <li><a href="#"><i class="fa fa-tasks"></i> Tasks</a></li>
                        <li class="divider"></li>
                        <li><a href="#"><i class="fa fa-sign-out"></i> Log Out</a></li>
                    </ul>
                </div>
                <div class="profile-picture">
                    <img alt="me" src="<%=basePath%>/images/dummy/0c31c9dc.profile.jpg">
                </div>
            </div><!-- header-profile -->

            <form role="form" class="form-inline">
                <button type="button" class="btn btn-default btn-expand-search"><i class="fa fa-search"></i></button>
                <div class="toggle-search">
                    <input type="text" class="form-control" placeholder="Search something">    
                    <button type="button" class="btn btn-default btn-collapse-search"><i class="fa fa-times"></i></button>
                </div>
            </form><!--/form-search-->

            <!-- header menu -->
            <ul class="hidden-xs header-menu pull-right">
                <li>
                    <a href="#" title="View site">
                        <i class="header-menu-icon icon-only fa fa-rocket"></i>
                    </a>
                </li><!-- /header-menu-item -->
                <li>
                    <a href="#" title="Notifications" class="dropdown-toggle" data-toggle="dropdown" role="button">
                        <span class="badge badge-success">4</span>
                        <i class="header-menu-icon icon-only fa fa-warning"></i>
                    </a>
                    <ul class="dropdown-menu dropdown-extend animated fadeInDown pull-right" role="menu">
                        <li class="dropdown-header">Notofications</li><!-- /dropdown-header -->
                        <li class="notif-minimal" data-toggle="niceScroll" data-scroll-cursorcolor="#ecf0f1">
                            <a class="notif-item" href="#">
                                <div class="notif-ico bg-primary">
                                    <i class="fa fa-heart-o"></i>
                                </div>
                                <p class="notif-text"><span class="text-bold">Evelyn</span> favorite your Post</p>
                            </a><!-- /notif-item -->
                            <a class="notif-item" href="#">
                                <div class="notif-ico bg-warning">
                                    <i class="fa fa-user"></i>
                                </div>
                                <p class="notif-text"><span class="text-bold">Evans</span> register as a Member</p>
                            </a><!-- /notif-item -->
                            <a class="notif-item" href="#">
                                <div class="notif-ico bg-success">
                                    <i class="fa fa-shopping-cart"></i>
                                </div>
                                <p class="notif-text"><span class="text-bold">Katherine</span> purchase an Item</p>
                            </a><!-- /notif-item -->
                            <a class="notif-item" href="#">
                                <div class="notif-ico bg-danger">
                                    <i class="fa fa-comment-o"></i>
                                </div>
                                <p class="notif-text"><span class="text-bold">Gomez</span> Comment on your Post</p>
                            </a><!-- /notif-item -->
                            <a class="notif-item" href="#">
                                <div class="notif-ico bg-info">
                                    <i class="fa fa-twitter"></i>
                                </div>
                                <p class="notif-text"><span class="text-bold">Willie</span> is now following you</p>
                            </a><!-- /notif-item -->
                            <a class="notif-item" href="#">
                                <div class="notif-ico bg-success">
                                    <i class="fa fa-cloud-upload"></i>
                                </div>
                                <p class="notif-text"><span class="text-bold">Nguyen</span> upload new Portofolio</p>
                            </a><!-- /notif-item -->
                        </li><!-- /dropdown-alert -->
                        <li class="dropdown-footer bg-cloud">
                            <a class="view-all" tabindex="-1" href="#">
                                <i class="fa fa-angle-right pull-right"></i> See all notifications
                            </a>
                        </li><!-- /dropdown-footer -->
                    </ul><!-- /dropdown-extend -->
                </li><!-- /header-menu-item -->
                <li>
                    <a href="#" title="Inboxs" class="dropdown-toggle" data-toggle="dropdown" role="button">
                        <span class="badge badge-warning animated animated-repeat flash">3</span>
                        <i class="header-menu-icon icon-only fa fa-envelope-o"></i>
                    </a>
                    <ul class="dropdown-menu dropdown-extend animated fadeInDown pull-right" role="menu">
                        <li class="dropdown-header">You have 3 new messages</li><!-- /dropdown-header -->
                        <li class="notif-media" data-toggle="niceScroll" data-scroll-cursorcolor="#ecf0f1">
                            <a class="notif-item" href="#">
                                <div class="notif-img pull-left">
                                    <img src="<%=basePath%>/images/dummy/8af46bf8.uifaces21.jpg" alt="" class="img-circle">
                                </div>
                                <h3 class="notif-heading">Account Team <small>58 min</small></h3>
                                <p class="notif-text">Spread the Word & Earn!</p>
                            </a><!-- /notif-item -->
                            <a class="notif-item" href="#">
                                <div class="notif-img pull-left">
                                    <img src="<%=basePath%>/images/dummy/b0f7e705.uifaces5.jpg" alt="" class="img-circle">
                                </div>
                                <h3 class="notif-heading">Timothy Lucas, Me (2) <small>Wed</small></h3>
                                <p class="notif-text">Elit odio, sed leo ligula semper, vehicula maecenas, eros fusce</p>
                            </a><!-- /notif-item -->
                            <a class="notif-item" href="#">
                                <div class="notif-img pull-left">
                                    <img src="<%=basePath%>/images/dummy/b7f97507.uifaces4.jpg" alt="" class="img-circle">
                                </div>
                                <h3 class="notif-heading">Raymond Rios <small>Tue</small></h3>
                                <p class="notif-text">Risus suscipit urna, tristique molestie vestibulum nunc tempor ultricies</p>
                            </a><!-- /notif-item -->
                            <a class="notif-item" href="#">
                                <div class="notif-img pull-left">
                                    <img src="<%=basePath%>/images/dummy/690243f1.uifaces6.jpg" alt="" class="img-circle">
                                </div>
                                <h3 class="notif-heading">Stilearning <small>Tue</small></h3>
                                <p class="notif-text">Thanks for ordering Stilearn Admin (order #WD12345678)</p>
                            </a><!-- /notif-item -->
                            <a class="notif-item" href="#">
                                <div class="notif-img pull-left">
                                    <img src="<%=basePath%>/images/dummy/a0c1c960.uifaces9.jpg" alt="" class="img-circle">
                                </div>
                                <h3 class="notif-heading">andrea.olson@mail.com <small>Mon</small></h3>
                                <p class="notif-text">Lectus curabitur mauris arcu donec morbi diam</p>
                            </a><!-- /notif-item -->
                            <a class="notif-item" href="#">
                                <div class="notif-img pull-left">
                                    <img src="<%=basePath%>/images/dummy/e7dd5f45.uifaces8.jpg" alt="" class="img-circle">
                                </div>
                                <h3 class="notif-heading">Nicole Miller <small>Mon</small></h3>
                                <p class="notif-text">Approval for new design!</p>
                            </a><!-- /notif-item -->
                        </li><!-- /dropdown-alert -->
                        <li class="dropdown-footer bg-cloud">
                            <a class="view-all" tabindex="-1" href="#">
                                <i class="fa fa-angle-right pull-right"></i> See all messages
                            </a>
                        </li><!-- /dropdown-footer -->
                    </ul><!-- /dropdown-extend -->
                </li><!-- /header-menu-item -->
                <li>
                    <a href="#" title="Tasks" class="dropdown-toggle" data-toggle="dropdown" role="button">
                        <span class="badge badge-danger">7</span>
                        <i class="header-menu-icon icon-only fa fa-tasks"></i>
                    </a>
                    <ul class="dropdown-menu dropdown-extend animated fadeInDown pull-right" role="menu">
                        <li class="dropdown-header">Tasks progress</li><!-- /dropdown-header -->
                        <li class="notif-progress" data-toggle="niceScroll" data-scroll-cursorcolor="#ecf0f1">
                            <a class="notif-item" href="#">
                                <div class="notif-text pull-right">60%</div>
                                <div class="notif-text">Uploading...</div>
                                <div class="progress progress-sm">
                                    <div class="progress-bar" role="progressbar" aria-valuenow="60" aria-valuemin="0" aria-valuemax="100" style="width: 60%">
                                        <span class="sr-only">60% Complete</span>
                                    </div>
                                </div>
                            </a><!-- /notif-item -->
                            <a class="notif-item" href="#">
                                <div class="notif-text pull-right">33%</div>
                                <div class="notif-text">Upgrade Theme</div>
                                <div class="progress progress-sm">
                                    <div class="progress-bar progress-bar-success" role="progressbar" aria-valuenow="33" aria-valuemin="0" aria-valuemax="100" style="width: 33%">
                                        <span class="sr-only">33% Complete</span>
                                    </div>
                                </div>
                            </a><!-- /notif-item -->
                            <a class="notif-item" href="#">
                                <div class="notif-text pull-right">87%</div>
                                <div class="notif-text">Webapp Development</div>
                                <div class="progress progress-sm">
                                    <div class="progress-bar progress-bar-info" role="progressbar" aria-valuenow="87" aria-valuemin="0" aria-valuemax="100" style="width: 87%">
                                        <span class="sr-only">87% Complete</span>
                                    </div>
                                </div>
                            </a><!-- /notif-item -->
                            <a class="notif-item" href="#">
                                <div class="notif-text pull-right">54%</div>
                                <div class="notif-text">Backup Data</div>
                                <div class="progress progress-sm">
                                    <div class="progress-bar progress-bar-warning" role="progressbar" aria-valuenow="54" aria-valuemin="0" aria-valuemax="100" style="width: 54%">
                                        <span class="sr-only">54% Complete</span>
                                    </div>
                                </div>
                            </a><!-- /notif-item -->
                            <a class="notif-item" href="#">
                                <div class="notif-text pull-right">92%</div>
                                <div class="notif-text">Bandwidth Limit</div>
                                <div class="progress progress-sm">
                                    <div class="progress-bar progress-bar-danger" role="progressbar" aria-valuenow="92" aria-valuemin="0" aria-valuemax="100" style="width: 92%">
                                        <span class="sr-only">92% Complete</span>
                                    </div>
                                </div>
                            </a><!-- /notif-item -->
                            <a class="notif-item" href="#">
                                <div class="notif-text pull-right">26%</div>
                                <div class="notif-text">Clean System</div>
                                <div class="progress progress-sm">
                                    <div class="progress-bar" role="progressbar" aria-valuenow="26" aria-valuemin="0" aria-valuemax="100" style="width: 26%">
                                        <span class="sr-only">26% Complete</span>
                                    </div>
                                </div>
                            </a><!-- /notif-item -->
                            <a class="notif-item" href="#">
                                <div class="notif-text pull-right">100%</div>
                                <div class="notif-text">Done</div>
                                <div class="progress progress-sm">
                                    <div class="progress-bar progress-bar-success" role="progressbar" aria-valuenow="100" aria-valuemin="0" aria-valuemax="100" style="width: 100%">
                                        <span class="sr-only">100% Complete</span>
                                    </div>
                                </div>
                            </a><!-- /notif-item -->
                            <a class="notif-item" href="#">
                                <div class="notif-text pull-right">100%</div>
                                <div class="notif-text">Done</div>
                                <div class="progress progress-sm">
                                    <div class="progress-bar progress-bar-info" role="progressbar" aria-valuenow="100" aria-valuemin="0" aria-valuemax="100" style="width: 100%">
                                        <span class="sr-only">100% Complete</span>
                                    </div>
                                </div>
                            </a><!-- /notif-item -->
                            <a class="notif-item" href="#">
                                <div class="notif-text pull-right">100%</div>
                                <div class="notif-text">Done with warning</div>
                                <div class="progress progress-sm">
                                    <div class="progress-bar progress-bar-warning" role="progressbar" aria-valuenow="100" aria-valuemin="0" aria-valuemax="100" style="width: 100%">
                                        <span class="sr-only">100% Complete</span>
                                    </div>
                                </div>
                            </a><!-- /notif-item -->
                            <a class="notif-item" href="#">
                                <div class="notif-text pull-right">12%</div>
                                <div class="notif-text">Error</div>
                                <div class="progress progress-sm">
                                    <div class="progress-bar progress-bar-danger" role="progressbar" aria-valuenow="12" aria-valuemin="0" aria-valuemax="100" style="width: 12%">
                                        <span class="sr-only">12% Complete</span>
                                    </div>
                                </div>
                            </a><!-- /notif-item -->
                        </li><!-- /dropdown-alert -->
                        <li class="dropdown-footer bg-cloud">
                            <a class="view-all" tabindex="-1" href="#">
                                <i class="fa fa-angle-right pull-right"></i> See all Tasks
                            </a>
                        </li><!-- /dropdown-footer -->
                    </ul><!-- /dropdown-extend -->
                </li><!-- /header-menu-item -->
            </ul><!--/header-menu pull-right-->
        </header><!--/header-->

        
        <!-- content section -->
        <section class="section" style='display:none;'>
            <!-- DONT FORGET REPLACE IT FOR PRODUCTION! -->
            <aside class="side-left">
                <ul class="sidebar">
                    <li>
                        <a href="index.php" data-pjax=".content-body">
                            <i class="sidebar-icon fa fa-home"></i>
                            <span class="sidebar-text">Dashboard</span>
                        </a>
                    </li><!--/sidebar-item-->
                    <li>
                        <a href="#">
                            <i class="sidebar-icon fa fa-magnet"></i>
                            <span class="sidebar-text">Interface</span>
                        </a>
                        <ul class="sidebar-child animated flipInY">
                            <li>
                                <a href="grid-system.php" data-pjax=".content-body">
                                    <span class="sidebar-text">Grid System</span>
                                </a>
                            </li><!--/child-item-->
                            <li>
                                <a href="typography.php" data-pjax=".content-body">
                                    <span class="sidebar-text">Typography</span>
                                </a>
                            </li><!--/child-item-->
                            <li>
                                <a href="buttons.php" data-pjax=".content-body">
                                    <span class="sidebar-text">Buttons</span>
                                </a>
                            </li><!--/child-item-->
                            <li>
                                <a href="icons.php" data-pjax=".content-body">
                                    <span class="sidebar-text">Icons</span>
                                </a>
                            </li><!--/child-item-->
                            <li class="divider"></li>
                            <li>
                                <a href="modals.php" data-pjax=".content-body">
                                    <span class="sidebar-text">Modals</span>
                                </a>
                            </li><!--/child-item-->
                            <li>
                                <a href="tooltips-popovers.php" data-pjax=".content-body">
                                    <span class="sidebar-text">Tooltips & Popovers</span>
                                </a>
                            </li><!--/child-item-->
                            <li>
                                <a href="alerts-callouts.php" data-pjax=".content-body">
                                    <span class="sidebar-text">Alerts & Callouts</span>
                                </a>
                            </li><!--/child-item-->
                            <li>
                                <a href="progress-bars.php" data-pjax=".content-body">
                                    <span class="sidebar-text">Progress Bars</span>
                                </a>
                            </li><!--/child-item-->
                            <li>
                                <a href="labels-badge.php" data-pjax=".content-body">
                                    <span class="sidebar-text">Labels & Badge</span>
                                </a>
                            </li><!--/child-item-->
                            <li>
                                <a href="navs-navbar.php" data-pjax=".content-body">
                                    <span class="sidebar-text">Navs & Navbar</span>
                                </a>
                            </li><!--/child-item-->
                            <li class="divider"></li>
                            <li>
                                <a href="animated.php" data-pjax=".content-body">
                                    <span class="sidebar-text">Animated</span>
                                </a>
                            </li><!--/child-item-->
                            <li>
                                <a href="loaders.php" data-pjax=".content-body">
                                    <span class="sidebar-text">Loaders</span>
                                </a>
                            </li><!--/child-item-->
                            <li>
                                <a href="helper-classes.php" data-pjax=".content-body">
                                    <span class="sidebar-text">Helper</span>
                                </a>
                            </li><!--/child-item-->
                        </ul><!--/sidebar-child-->
                    </li><!--/sidebar-item-->
                    <li>
                        <a href="#">
                            <div class="badge badge-primary animated animated-repeat wobble">3</div>
                            <i class="sidebar-icon fa fa-edit"></i>
                            <span class="sidebar-text">Form</span>
                        </a>
                        <ul class="sidebar-child animated flipInY">
                            <li>
                                <a href="form-basic.php" data-pjax=".content-body">
                                    <span class="sidebar-text">Basic Form</span>
                                </a>
                            </li><!--/child-item-->
                            <li>
                                <a href="form-elements.php" data-pjax=".content-body">
                                    <span class="sidebar-text">Form Elements</span>
                                </a>
                            </li><!--/child-item-->
                            <li class="divider"></li>
                            <li>
                                <a href="form-validator.php" data-pjax=".content-body">
                                    <span class="sidebar-text">Validator</span>
                                </a>
                            </li><!--/child-item-->
                            <li>
                                <a href="form-wizard.php" data-pjax=".content-body">
                                    <span class="sidebar-text">Wizard</span>
                                </a>
                            </li><!--/child-item-->
                            <li>
                                <a href="form-uploader.php" data-pjax=".content-body">
                                    <span class="sidebar-text">Uploader</span>
                                </a>
                            </li><!--/child-item-->
                            <li>
                                <a href="form-editors.php" data-pjax=".content-body">
                                    <span class="sidebar-text">Editor</span>
                                </a>
                            </li><!--/child-item-->
                        </ul><!--/sidebar-child-->
                    </li><!--/sidebar-item-->
                    <li>
                        <a href="#">
                            <i class="sidebar-icon fa fa-bars"></i>
                            <span class="sidebar-text">Widgets</span>
                        </a>
                        <ul class="sidebar-child animated flipInY">
                            <li>
                                <a href="widget-panel.php" data-pjax=".content-body">
                                    <span class="sidebar-text">Panels</span>
                                </a>
                            </li><!--/child-item-->
                            <li>
                                <a href="widget-tabs.php" data-pjax=".content-body">
                                    <span class="sidebar-text">Tabs</span>
                                </a>
                            </li><!--/child-item-->
                            <li>
                                <a href="widget-collapse.php" data-pjax=".content-body">
                                    <span class="sidebar-text">Collapse</span>
                                </a>
                            </li><!--/child-item-->
                        </ul><!--/sidebar-child-->
                    </li><!--/sidebar-item-->
                    <li>
                        <a href="#">
                            <i class="sidebar-icon fa fa-files-o"></i>
                            <span class="sidebar-text">Pages</span>
                        </a>
                        <ul class="sidebar-child animated flipInY">
                            <li>
                                <a href="page-blank.php" data-pjax=".content-body">
                                    <span class="sidebar-text">Blank Page</span>
                                </a>
                            </li><!--/child-item-->
                            <li class="divider"></li>
                            <li>
                                <a href="page-signin.php">
                                    <span class="sidebar-text">Signin</span>
                                </a>
                            </li><!--/child-item-->
                            <li>
                                <a href="page-404.php" data-pjax=".content-body">
                                    <span class="sidebar-text">Error 404</span>
                                </a>
                            </li><!--/child-item-->
                            <li>
                                <a href="page-500.php" data-pjax=".content-body">
                                    <span class="sidebar-text">Error 500</span>
                                </a>
                            </li><!--/child-item-->
                            <li>
                                <a href="page-landing.php">
                                    <span class="sidebar-text">Landing Page</span>
                                </a>
                            </li><!--/child-item-->
                            <li class="divider"></li>
                            <li>
                                <a href="page-gallery.php" data-pjax=".content-body">
                                    <span class="sidebar-text">Gallery</span>
                                </a>
                            </li><!--/child-item-->
                            <li>
                                <a href="page-pricing.php" data-pjax=".content-body">
                                    <span class="sidebar-text">Pricing</span>
                                </a>
                            </li><!--/child-item-->
                            <li>
                                <a href="page-invoice.php" data-pjax=".content-body">
                                    <span class="sidebar-text">Invoice</span>
                                </a>
                            </li><!--/child-item-->
                        </ul><!--/sidebar-child-->
                    </li><!--/sidebar-item-->
                    <li>
                        <a href="#" data-pjax=".content-body">
                            <i class="sidebar-icon fa fa-bar-chart-o"></i>
                            <span class="sidebar-text">Charts</span>
                        </a>
                        <ul class="sidebar-child animated flipInY">
                            <li>
                                <a href="chart-flot.php" data-pjax=".content-body">
                                    <span class="sidebar-text">Flot Charts</span>
                                </a>
                            </li><!--/child-item-->
                            <li>
                                <a href="chart-morris.php" data-pjax=".content-body">
                                    <span class="sidebar-text">Morris Charts</span>
                                </a>
                            </li><!--/child-item-->
                            <li class="divider"></li>
                            <li>
                                <a href="chart-inline.php" data-pjax=".content-body">
                                    <span class="sidebar-text">Inline Charts</span>
                                </a>
                            </li><!--/child-item-->
                        </ul><!--/sidebar-child-->
                    </li><!--/sidebar-item-->
                    <li>
                        <a href="#" data-pjax=".content-body">
                            <i class="sidebar-icon fa fa-table"></i>
                            <span class="sidebar-text">Tables</span>
                        </a>
                        <ul class="sidebar-child animated flipInY">
                            <li>
                                <a href="table-basic.php" data-pjax=".content-body">
                                    <span class="sidebar-text">Basic Table</span>
                                </a>
                            </li><!--/child-item-->
                            <li class="divider"></li>
                            <li>
                                <a href="table-datatables.php" data-pjax=".content-body">
                                    <span class="sidebar-text">Datatables</span>
                                </a>
                            </li><!--/child-item-->
                            <li>
                                <a href="table-sorter.php" data-pjax=".content-body">
                                    <span class="sidebar-text">Table Sorter</span>
                                </a>
                            </li><!--/child-item-->
                        </ul><!--/sidebar-child-->
                    </li><!--/sidebar-item-->
                    <li>
                        <a href="#">
                            <div class="badge badge-primary animated animated-repeat wobble">5</div>
                            <i class="sidebar-icon fa fa-th-large"></i>
                            <span class="sidebar-text">More</span>
                        </a>
                        <ul class="sidebar-child-inline animated flipInX">
                            <li>
                                <a href="calendar.php" data-pjax=".content-body">
                                    <i class="sidebar-icon fa fa-calendar-o"></i>
                                    <span class="sidebar-text">Calendar</span>
                                </a>
                            </li><!--/child-item-->
                            <li>
                                <a href="maps.php" data-pjax=".content-body">
                                    <i class="sidebar-icon fa fa-map-marker"></i>
                                    <span class="sidebar-text">Maps</span>
                                </a>
                            </li><!--/child-item-->
                            <li>
                                <a href="masonry.php" data-pjax=".content-body">
                                    <i class="sidebar-icon fa fa-magic"></i>
                                    <span class="sidebar-text">Masonry</span>
                                </a>
                            </li><!--/child-item-->
                            <li class="divider"></li>
                            <li>
                                <a href="pjax.php" data-pjax=".content-body">
                                    <i class="sidebar-icon fa fa-play"></i>
                                    <span class="sidebar-text">PJAX</span>
                                </a>
                            </li><!--/child-item-->
                        </ul><!--/sidebar-child-->
                    </li><!--/sidebar-item-->
                </ul><!--/sidebar-->
            </aside><!--/side-left-->

            <div class="content">
                <div class="content-header">
                    <div class="content-header-extra">
                        <a class="item-ch-extra" href="#">
                            <span class="sparkline-bar" data-height="36px" data-barwidth="3" data-barcolor="#5BB75B" data-value="0,5,3,9,6,5,9,7,3,5,2"></span>
                            <div class="data-text text-success">
                                765K <p class="text-muted">Visits</p>
                            </div>
                        </a><!--/item-ch-extra-->
                        
                        <div class="divider"></div>
                        
                        <a class="item-ch-extra" href="#">
                            <span class="sparkline-bar" data-height="36px" data-barwidth="3" data-value="0,9,7,9,6,3,5,3,5,5,2"></span>
                            <div class="data-text text-primary">
                                1437 <p class="text-muted">Users</p>
                            </div>
                        </a><!--/item-ch-extra-->

                        <div class="divider"></div>

                        <a class="item-ch-extra" href="#">
                            <span class="sparkline-bar" data-height="36px" data-barwidth="3" data-barcolor="#49AFCD" data-value="0,6,5,9,7,3,5,2,5,3,9"></span>
                            <div class="data-text text-info">
                                4367 <p class="text-muted">Orders</p>
                            </div>
                        </a><!--/item-ch-extra-->
                    </div><!--/content-header-extra -->

                    <h2 class="content-title"><i class="fa fa-home"></i> Welcome to Stilearn 2.0</h2>
                </div><!--/content-header -->
                
                <!-- content-control -->
                <div class="content-control">
                    <!--control-nav-->
                    <ul class="control-nav pull-right">
                        <li class="divider"></li>
                        <li>
                            <a href="#">
                                <i class="fa fa-money"></i> Orders <span class="text-danger">(+12)</span>
                            </a>
                        </li>
                        <li class="divider"></li>
                        <li>
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                                <i class="fa fa-user"></i> Users <span class="text-danger">(+34)</span>
                                <i class="fa fa-angle-down"></i>
                            </a>                            
                            <ul class="dropdown-menu animated flipInX pull-right">
                                <li><a href="#">Some Action</a></li>
                                <li><a href="#">Other Action</a></li>
                                <li class="divider"></li>
                                <li><a href="#">Something Else</a></li>
                            </ul>
                        </li>
                        <li class="divider"></li>
                        <li>
                            <a data-toggle="side-right" href="#">
                                <i class="fa fa-arrows-h"></i> Toggle
                            </a>
                        </li>
                    </ul><!--/control-nav-->
                    
                    <!--breadcrumb-->
                    <ul class="breadcrumb">
                        <li><a href="index.php"><i class="fa fa-home"></i> Dashboard</a></li>
                        <li><a href="#">Library</a></li>
                        <li class="active">Data</li>
                    </ul><!--/breadcrumb-->
                </div><!-- /content-control -->

                <div class="content-body">
                    <!-- APP CONTENT
                    ================================================== -->
                                        <!-- Grid system
                    ================================================== -->
                    <p>Grid systems are used for creating page layouts through a series of rows and columns that house your content. Here's how the Bootstrap grid system works:</p>
                    <ul class="fa-ul">
                        <li><i class="fa-li fa fa-check-square"></i>Rows must be placed within a <code>.container</code> for proper alignment and padding.</li>
                        <li><i class="fa-li fa fa-check-square"></i>Use rows to create horizontal groups of columns.</li>
                        <li><i class="fa-li fa fa-check-square"></i>Content should be placed within columns, and only columns may be immediate children of rows.</li>
                        <li><i class="fa-li fa fa-check-square"></i>Predefined grid classes like <code>.row</code> and <code>.col-xs-4</code> are available for quickly making grid layouts. LESS mixins can also be used for more semantic layouts.</li>
                        <li><i class="fa-li fa fa-check-square"></i>Columns create gutters (gaps between column content) via <code>padding</code>. That padding is offset in rows for the first and last column via negative margin on <code>.row</code>s.</li>
                        <li><i class="fa-li fa fa-check-square"></i>Grid columns are created by specifying the number of twelve available columns you wish to span. For example, three equal columns would use three <code>.col-xs-4</code>.</li>
                    </ul>
                    <p>Look to the examples for applying these principles to your code.</p>

                    <div class="callout callout-info">
                        <h4>Grids and full-width layouts</h4>
                        <p>Folks looking to create fully fluid layouts (meaning your site stretches the entire width of the viewport) must wrap their grid content in a containing element with <code>padding: 0 15px;</code> to offset the <code>margin: 0 -15px;</code> used on <code>.row</code>s.</p>
                    </div>

                    <h3 id="grid-media-queries">Media queries</h3>
                    <p>Bootstrap use the following media queries in LESS files to create the key breakpoints in grid system.</p>
                    <pre class="no-padding prettyprint lang-css">/* Extra small devices (phones, less than 768px) */
/* No media query since this is the default in Bootstrap */

/* Small devices (tablets, 768px and up) */
@media (min-width: @screen-sm-min) { ... }

/* Medium devices (desktops, 992px and up) */
@media (min-width: @screen-md-min) { ... }

/* Large devices (large desktops, 1200px and up) */
@media (min-width: @screen-lg-min) { ... }</pre>
                    <p>Bootstrap occasionally expand on these media queries to include a <code>max-width</code> to limit CSS to a narrower set of devices.</p>
                    <pre class="no-padding prettyprint lang-css">@media (max-width: @screen-xs-max) { ... }
@media (min-width: @screen-sm-min) and (max-width: @screen-sm-max) { ... }
@media (min-width: @screen-md-min) and (max-width: @screen-md-max) { ... }
@media (min-width: @screen-lg-min) { ... }</pre>
                    
                    <h3 id="grid-options">Grid options</h3>
                    <p>See how aspects of the Bootstrap grid system work across multiple devices with a handy table.</p>
                    <div class="table-responsive">
                        <table class="table table-bordered table-striped">
                            <thead>
                                <tr>
                                    <th></th>
                                    <th>
                                        Extra small devices
                                        <small>Phones (&lt;768px)</small>
                                    </th>
                                    <th>
                                        Small devices
                                        <small>Tablets (&ge;768px)</small>
                                    </th>
                                    <th>
                                        Medium devices
                                        <small>Desktops (&ge;992px)</small>
                                    </th>
                                    <th>
                                        Large devices
                                        <small>Desktops (&ge;1200px)</small>
                                    </th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <th>Grid behavior</th>
                                    <td>Horizontal at all times</td>
                                    <td colspan="3">Collapsed to start, horizontal above breakpoints</td>
                                </tr>
                                <tr>
                                    <th>Max container width</th>
                                    <td>None (auto)</td>
                                    <td>750px</td>
                                    <td>970px</td>
                                    <td>1170px</td>
                                </tr>
                                <tr>
                                    <th>Class prefix</th>
                                    <td><code>.col-xs-</code></td>
                                    <td><code>.col-sm-</code></td>
                                    <td><code>.col-md-</code></td>
                                    <td><code>.col-lg-</code></td>
                                </tr>
                                <tr>
                                    <th># of columns</th>
                                    <td colspan="4">12</td>
                                </tr>
                                <tr>
                                <th>Max column width</th>
                                    <td class="text-muted">Auto</td>
                                    <td>60px</td>
                                    <td>78px</td>
                                    <td>95px</td>
                                </tr>
                                <tr>
                                    <th>Gutter width</th>
                                    <td colspan="4">30px (15px on each side of a column)</td>
                                </tr>
                                <tr>
                                    <th>Nestable</th>
                                    <td colspan="4">Yes</td>
                                </tr>
                                <tr>
                                    <th>Offsets</th>
                                    <td colspan="4">Yes</td>
                                </tr>
                                <tr>
                                    <th>Column ordering</th>
                                    <td colspan="4">Yes</td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                    <p>Grid classes apply to devices with screen widths greater than or equal to the breakpoint sizes, and override grid classes targeted at smaller devices. Therefore, applying any <code>.col-md-</code> class to an element will not only affect its styling on medium devices but also on large devices if a <code>.col-lg-</code> class is not present.</p>

                    <h3>Example: Stacked-to-horizontal</h3>
                    <p>Using a single set of <code>.col-md-*</code> grid classes, you can create a basic grid system that starts out stacked on mobile devices and tablet devices (the extra small to small range) before becoming horizontal on desktop (medium) devices. Place grid columns in any <code>.row</code>.</p>
                    <div class="row show-grid">
                        <div class="col-md-1">.col-md-1</div>
                        <div class="col-md-1">.col-md-1</div>
                        <div class="col-md-1">.col-md-1</div>
                        <div class="col-md-1">.col-md-1</div>
                        <div class="col-md-1">.col-md-1</div>
                        <div class="col-md-1">.col-md-1</div>
                        <div class="col-md-1">.col-md-1</div>
                        <div class="col-md-1">.col-md-1</div>
                        <div class="col-md-1">.col-md-1</div>
                        <div class="col-md-1">.col-md-1</div>
                        <div class="col-md-1">.col-md-1</div>
                        <div class="col-md-1">.col-md-1</div>
                    </div>
                    <div class="row show-grid">
                        <div class="col-md-8">.col-md-8</div>
                        <div class="col-md-4">.col-md-4</div>
                    </div>
                    <div class="row show-grid">
                        <div class="col-md-4">.col-md-4</div>
                        <div class="col-md-4">.col-md-4</div>
                        <div class="col-md-4">.col-md-4</div>
                    </div>
                    <div class="row show-grid">
                        <div class="col-md-6">.col-md-6</div>
                        <div class="col-md-6">.col-md-6</div>
                    </div>
                    <pre class="no-padding prettyprint lang-css">&lt;div class=&quot;row&quot;&gt;
    &lt;div class=&quot;col-md-1&quot;&gt;.col-md-1&lt;/div&gt;
    &lt;div class=&quot;col-md-1&quot;&gt;.col-md-1&lt;/div&gt;
    &lt;div class=&quot;col-md-1&quot;&gt;.col-md-1&lt;/div&gt;
    &lt;div class=&quot;col-md-1&quot;&gt;.col-md-1&lt;/div&gt;
    &lt;div class=&quot;col-md-1&quot;&gt;.col-md-1&lt;/div&gt;
    &lt;div class=&quot;col-md-1&quot;&gt;.col-md-1&lt;/div&gt;
    &lt;div class=&quot;col-md-1&quot;&gt;.col-md-1&lt;/div&gt;
    &lt;div class=&quot;col-md-1&quot;&gt;.col-md-1&lt;/div&gt;
    &lt;div class=&quot;col-md-1&quot;&gt;.col-md-1&lt;/div&gt;
    &lt;div class=&quot;col-md-1&quot;&gt;.col-md-1&lt;/div&gt;
    &lt;div class=&quot;col-md-1&quot;&gt;.col-md-1&lt;/div&gt;
    &lt;div class=&quot;col-md-1&quot;&gt;.col-md-1&lt;/div&gt;
&lt;/div&gt;
&lt;div class=&quot;row&quot;&gt;
    &lt;div class=&quot;col-md-8&quot;&gt;.col-md-8&lt;/div&gt;
    &lt;div class=&quot;col-md-4&quot;&gt;.col-md-4&lt;/div&gt;
&lt;/div&gt;
&lt;div class=&quot;row&quot;&gt;
    &lt;div class=&quot;col-md-4&quot;&gt;.col-md-4&lt;/div&gt;
    &lt;div class=&quot;col-md-4&quot;&gt;.col-md-4&lt;/div&gt;
    &lt;div class=&quot;col-md-4&quot;&gt;.col-md-4&lt;/div&gt;
&lt;/div&gt;
&lt;div class=&quot;row&quot;&gt;
    &lt;div class=&quot;col-md-6&quot;&gt;.col-md-6&lt;/div&gt;
    &lt;div class=&quot;col-md-6&quot;&gt;.col-md-6&lt;/div&gt;
&lt;/div&gt;</pre>

                    <h3>Example: Mobile and desktop</h3>
                    <p>Don't want your columns to simply stack in smaller devices? Use the extra small and medium device grid classes by adding <code>.col-xs-*</code> <code>.col-md-*</code> to your columns. See the example below for a better idea of how it all works.</p>
                    <div class="row show-grid">
                        <div class="col-xs-12 col-md-8">.col-xs-12 .col-md-8</div>
                        <div class="col-xs-6 col-md-4">.col-xs-6 .col-md-4</div>
                    </div>
                    <div class="row show-grid">
                        <div class="col-xs-6 col-md-4">.col-xs-6 .col-md-4</div>
                        <div class="col-xs-6 col-md-4">.col-xs-6 .col-md-4</div>
                        <div class="col-xs-6 col-md-4">.col-xs-6 .col-md-4</div>
                    </div>
                    <div class="row show-grid">
                        <div class="col-xs-6">.col-xs-6</div>
                        <div class="col-xs-6">.col-xs-6</div>
                    </div>
                    <pre class="no-padding prettyprint lang-css">&lt;!-- Stack the columns on mobile by making one full-width and the other half-width --&gt;
&lt;div class=&quot;row&quot;&gt;
    &lt;div class=&quot;col-xs-12 col-md-8&quot;&gt;.col-xs-12 .col-md-8&lt;/div&gt;
    &lt;div class=&quot;col-xs-6 col-md-4&quot;&gt;.col-xs-6 .col-md-4&lt;/div&gt;
&lt;/div&gt;

&lt;!-- Columns start at 50% wide on mobile and bump up to 33.3% wide on desktop --&gt;
&lt;div class=&quot;row&quot;&gt;
    &lt;div class=&quot;col-xs-6 col-md-4&quot;&gt;.col-xs-6 .col-md-4&lt;/div&gt;
    &lt;div class=&quot;col-xs-6 col-md-4&quot;&gt;.col-xs-6 .col-md-4&lt;/div&gt;
    &lt;div class=&quot;col-xs-6 col-md-4&quot;&gt;.col-xs-6 .col-md-4&lt;/div&gt;
&lt;/div&gt;

&lt;!-- Columns are always 50% wide, on mobile and desktop --&gt;
&lt;div class=&quot;row&quot;&gt;
    &lt;div class=&quot;col-xs-6&quot;&gt;.col-xs-6&lt;/div&gt;
    &lt;div class=&quot;col-xs-6&quot;&gt;.col-xs-6&lt;/div&gt;
&lt;/div&gt;</pre>
                    
                    <h3>Example: Mobile, tablet, desktops</h3>
                    <p>Build on the previous example by creating even more dynamic and powerful layouts with tablet <code>.col-sm-*</code> classes.</p>
                    <div class="row show-grid">
                        <div class="col-xs-12 col-sm-6 col-md-8">.col-xs-12 .col-sm-6 .col-md-8</div>
                        <div class="col-xs-6 col-md-4">.col-xs-6 .col-md-4</div>
                    </div>
                    <div class="row show-grid">
                        <div class="col-xs-6 col-sm-4">.col-xs-6 .col-sm-4</div>
                        <div class="col-xs-6 col-sm-4">.col-xs-6 .col-sm-4</div>
                    <!-- Optional: clear the XS cols if their content doesn't match in height -->
                    <div class="clearfix visible-xs"></div>
                        <div class="col-xs-6 col-sm-4">.col-xs-6 .col-sm-4</div>
                    </div>
                    <pre class="no-padding prettyprint lang-css">&lt;div class=&quot;row&quot;&gt;
    &lt;div class=&quot;col-xs-12 col-sm-6 col-md-8&quot;&gt;.col-xs-12 .col-sm-6 .col-md-8&lt;/div&gt;
    &lt;div class=&quot;col-xs-6 col-md-4&quot;&gt;.col-xs-6 .col-md-4&lt;/div&gt;
&lt;/div&gt;
&lt;div class=&quot;row&quot;&gt;
    &lt;div class=&quot;col-xs-6 col-sm-4&quot;&gt;.col-xs-6 .col-sm-4&lt;/div&gt;
    &lt;div class=&quot;col-xs-6 col-sm-4&quot;&gt;.col-xs-6 .col-sm-4&lt;/div&gt;
    &lt;!-- Optional: clear the XS cols if their content doesn&#39;t match in height --&gt;
    &lt;div class=&quot;clearfix visible-xs&quot;&gt;&lt;/div&gt;
    &lt;div class=&quot;col-xs-6 col-sm-4&quot;&gt;.col-xs-6 .col-sm-4&lt;/div&gt;
&lt;/div&gt;</pre>
                    
                    <h3>Responsive column resets</h3>
                    <p>With the four tiers of grids available you're bound to run into issues where, at certain breakpoints, your columns don't clear quite right as one is taller than the other. To fix that, use a combination of a <code>.clearfix</code> and responsive utility classes.</p>
                    <div class="row show-grid">
                        <div class="col-xs-6 col-sm-3">
                        .col-xs-6 .col-sm-3
                        <br>
                        Resize your viewport or check it out on your phone for an example.
                    </div>
                    <div class="col-xs-6 col-sm-3">.col-xs-6 .col-sm-3</div>

                    <!-- Add the extra clearfix for only the required viewport -->
                    <div class="clearfix visible-xs"></div>

                    <div class="col-xs-6 col-sm-3">.col-xs-6 .col-sm-3</div>
                        <div class="col-xs-6 col-sm-3">.col-xs-6 .col-sm-3</div>
                    </div>
                    <pre class="no-padding prettyprint lang-css">&lt;div class=&quot;row&quot;&gt;
    &lt;div class=&quot;col-xs-6 col-sm-3&quot;&gt;.col-xs-6 .col-sm-3&lt;/div&gt;
    &lt;div class=&quot;col-xs-6 col-sm-3&quot;&gt;.col-xs-6 .col-sm-3&lt;/div&gt;

    &lt;!-- Add the extra clearfix for only the required viewport --&gt;
    &lt;div class=&quot;clearfix visible-xs&quot;&gt;&lt;/div&gt;

    &lt;div class=&quot;col-xs-6 col-sm-3&quot;&gt;.col-xs-6 .col-sm-3&lt;/div&gt;
    &lt;div class=&quot;col-xs-6 col-sm-3&quot;&gt;.col-xs-6 .col-sm-3&lt;/div&gt;
&lt;/div&gt;</pre>
                    
                    <p>In addition to column clearing at responsive breakpoints, you may need to <strong>reset offsets, pushes, or pulls</strong>. Those resets are available for medium and large grid tiers only, since they start only at the (second) small grid tier. See this in action in <a target="_blank" href="http://getbootstrap.com/examples/grid/">the grid example</a>.</p>
                    <pre class="no-padding prettyprint lang-css">&lt;div class=&quot;row&quot;&gt;
    &lt;div class=&quot;col-sm-5 col-md-6&quot;&gt;.col-sm-5 .col-md-6&lt;/div&gt;
    &lt;div class=&quot;col-sm-5 col-sm-offset-2 col-md-6 col-md-offset-0&quot;&gt;.col-sm-5 .col-sm-offset-2 .col-md-6 .col-md-offset-0&lt;/div&gt;
&lt;/div&gt;

&lt;div class=&quot;row&quot;&gt;
    &lt;div class=&quot;col-sm-6 col-md-5 col-lg-6&quot;&gt;.col-sm-6 .col-md-5 .col-lg-6&lt;/div&gt;
    &lt;div class=&quot;col-sm-6 col-md-5 col-md-offset-2 col-lg-6 col-lg-offset-0&quot;&gt;.col-sm-6 .col-md-5 .col-md-offset-2 .col-lg-6 .col-lg-offset-0&lt;/div&gt;
&lt;/div&gt;</pre>

                    <h3 id="grid-offsetting">Offsetting columns</h3>
                    <p>Move columns to the right using <code>.col-md-offset-*</code> classes. These classes increase the left margin of a column by <code>*</code> columns. For example, <code>.col-md-offset-4</code> moves <code>.col-md-4</code> over four columns.</p>
                    <div class="row show-grid">
                        <div class="col-md-4">.col-md-4</div>
                        <div class="col-md-4 col-md-offset-4">.col-md-4 .col-md-offset-4</div>
                    </div>
                    <div class="row show-grid">
                        <div class="col-md-3 col-md-offset-3">.col-md-3 .col-md-offset-3</div>
                        <div class="col-md-3 col-md-offset-3">.col-md-3 .col-md-offset-3</div>
                    </div>
                    <div class="row show-grid">
                        <div class="col-md-6 col-md-offset-3">.col-md-6 .col-md-offset-3</div>
                    </div>
                    <pre class="no-padding prettyprint lang-css">&lt;div class=&quot;row&quot;&gt;
    &lt;div class=&quot;col-md-4&quot;&gt;.col-md-4&lt;/div&gt;
    &lt;div class=&quot;col-md-4 col-md-offset-4&quot;&gt;.col-md-4 .col-md-offset-4&lt;/div&gt;
&lt;/div&gt;
&lt;div class=&quot;row&quot;&gt;
    &lt;div class=&quot;col-md-3 col-md-offset-3&quot;&gt;.col-md-3 .col-md-offset-3&lt;/div&gt;
    &lt;div class=&quot;col-md-3 col-md-offset-3&quot;&gt;.col-md-3 .col-md-offset-3&lt;/div&gt;
&lt;/div&gt;
&lt;div class=&quot;row&quot;&gt;
    &lt;div class=&quot;col-md-6 col-md-offset-3&quot;&gt;.col-md-6 .col-md-offset-3&lt;/div&gt;
&lt;/div&gt;</pre>

                    <h3 id="grid-nesting">Nesting columns</h3>
                    <p>To nest your content with the default grid, add a new <code>.row</code> and set of <code>.col-md-*</code> columns within an existing <code>.col-md-*</code> column. Nested rows should include a set of columns that add up to 12.</p>
                    <div class="row show-grid">
                        <div class="col-md-9">
                            Level 1: .col-md-9
                            <div class="row show-grid">
                                <div class="col-md-6">Level 2: .col-md-6</div>
                                <div class="col-md-6">Level 2: .col-md-6</div>
                            </div>
                        </div>
                    </div>
                    <pre class="no-padding prettyprint lang-css">&lt;div class=&quot;row&quot;&gt;
    &lt;div class=&quot;col-md-9&quot;&gt;
        Level 1: .col-md-9
        &lt;div class=&quot;row&quot;&gt;
            &lt;div class=&quot;col-md-6&quot;&gt;Level 2: .col-md-6&lt;/div&gt;
            &lt;div class=&quot;col-md-6&quot;&gt;Level 2: .col-md-6&lt;/div&gt;
        &lt;/div&gt;
    &lt;/div&gt;
&lt;/div&gt;</pre>

                    <h3 id="grid-column-ordering">Column ordering</h3>
                    <p>Easily change the order of built-in grid columns with <code>.col-md-push-*</code> and <code>.col-md-pull-*</code> modifier classes.</p>
                    <div class="row show-grid">
                        <div class="col-md-9 col-md-push-3">.col-md-9 .col-md-push-3</div>
                        <div class="col-md-3 col-md-pull-9">.col-md-3 .col-md-pull-9</div>
                    </div>
                    <pre class="no-padding prettyprint lang-css">&lt;div class=&quot;row&quot;&gt;
    &lt;div class=&quot;col-md-9 col-md-push-3&quot;&gt;.col-md-9 .col-md-push-3&lt;/div&gt;
    &lt;div class=&quot;col-md-3 col-md-pull-9&quot;&gt;.col-md-3 .col-md-pull-9&lt;/div&gt;
&lt;/div&gt;</pre>                </div><!--/content-body -->
            </div><!--/content -->

        </section><!--/content section -->
		<!-- middle -->
		<div class="row" style='padding:0;'>
			<div class="opacity_bg"></div><!-- alert_background-->
			<!-- alert_notebook -->
				<div class="modal fade in" id="modalBasic" tabindex="-1" role="dialog" aria-labelledby="modalBasicLabel" aria-hidden="false" style="display: none;">
					<div class="modal-dialog">
						<div class="modal-content">
							<div class="modal-header">
								<button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
								<h4 class="modal-title" id="modalBasicLabel">新建笔记本</h4>
							</div>
							<div class="modal-body">
								<div class="form-group">
                                    <label class="col-sm-3 control-label" for="input" style='margin-top:5px;'>笔记本名称</label>
                                    <div class="col-sm-8">
                                        <input type="text" class="form-control" id="input_notebook">
                                    </div>
                                </div>
							</div>
							<div class="modal-footer">
								<button type="button" class="btn btn-default cancle" data-dismiss="modal">取 消</button>
								<button type="button" class="btn btn-primary sure">创 建</button>
							</div>
						</div><!-- /.modal-content -->
					</div><!-- /.modal-dialog -->
				</div>
			<!-- alert_notebook -->
			<!-- alert_note -->
			<div class="modal fade in" id="modalBasic_2" tabindex="-1" role="dialog" aria-labelledby="modalBasicLabel" aria-hidden="false" style="display: none;">
					<div class="modal-dialog">
						<div class="modal-content">
							<div class="modal-header">
								<button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
								<h4 class="modal-title" id="modalBasicLabel_2">新建笔记</h4>
							</div>
							<div class="modal-body">
								<div class="form-group">
                                    <label class="col-sm-3 control-label" for="input" style='margin-top:5px;'>笔记名称</label>
                                    <div class="col-sm-8">
                                        <input type="text" class="form-control" id="input_note">
                                    </div>
                                </div>
							</div>
							<div class="modal-footer">
								<button type="button" class="btn btn-default cancle" data-dismiss="modal">取 消</button>
								<button type="button" class="btn btn-primary sure">创 建</button>
							</div>
						</div><!-- /.modal-content -->
					</div><!-- /.modal-dialog -->
				</div>
			<!-- alert_note -->
			<div class="col-xs-2" style='padding:0;' id='pc_part_1'>
				<!-- side-right -->
				<div class="pc_top_first">
					<h3>全部笔记本</h3>
					<button type="button" class="btn btn-default btn-xs btn_plus" id='add_notebook'><i class="fa fa-plus"></i></button>
				</div>
				<aside class="side-right" id='first_side_right'>
					<div class="module" data-toggle="niceScroll">
						<div class="chat-contact">
							<div class="contact-body">
								<ul class="contacts-list">
									<!-- 笔记本列表 -->
									<li class="online"><a href="#"><i class="fa fa-book" title="online" rel="tooltip-bottom"></i> 默认笔记本</a></li>
									
								</ul><!-- /contacts-list -->
							</div><!-- /contact-body -->
						</div><!-- /chat-contact -->

						<div class="chatbox">
							<h3 class="chatbox-heading">
								<a data-toggle="chatbox-close" href="#" class="pull-right text-sm text-silver"><i class="fa fa-times"></i></a>
								<i class="fa fa-circle-o text-primary"></i> 
								Phillip Morrison
							</h3><!-- /chatbox-heading -->

							<div class="chatbox-body" data-toggle="niceScroll">

								<div class="chat-separate"><time class="chat-time" datetime="">Jan 9, 2014</time></div>

								<div class="chat-in">
									<div class="chat-user">Phillip Morrison</div>
									<div class="chat-msg">
										<p>Praesent cras quisque. Volutpat sit interdum. Magnis leo, duis faucibus eu, in rutrum nulla. Eget sed, dolor nibh. Vero mi habitant</p>
										<time class="chat-time" datetime="2013-12-13T20:00">01:14 PM</time>
									</div>
								</div><!-- /chat-in -->

								<div class="chat-out">
									<div class="chat-user">Me</div>
									<div class="chat-msg">
										<p>Dictum at aenean, faucibus euismod convallis. Ipsum nec, platea amet nulla.</p>
										<time class="chat-time" datetime="2013-12-13T20:00">01:16 PM</time>
									</div>
								</div><!-- /chat-out -->

								<div class="chat-in">
									<div class="chat-user">Phillip Morrison</div>
									<div class="chat-msg">
										<p>Eu augue, proin rutrum. Et vehicula, wisi fusce, ut ipsum</p>
										<time class="chat-time" datetime="2013-12-13T20:00">01:20 PM</time>
									</div>
								</div><!-- /chat-in -->

								<div class="chat-separate"><time class="chat-time" datetime="">Jan 14, 2014</time></div>

								<div class="chat-out">
									<div class="chat-user">Me</div>
									<div class="chat-msg">
										<p>Est penatibus pellentesque, augue tincidunt, a suspendisse</p>
										<time class="chat-time" datetime="2013-12-13T20:00">09:36 AM</time>
									</div>
								</div><!-- /chat-out -->

								<div class="chat-in">
									<div class="chat-user">Phillip Morrison</div>
									<div class="chat-msg">
										<p>Nunc nulla. Donec laoreet non, lobortis praesent</p>
										<time class="chat-time" datetime="2013-12-13T20:00">09:40 AM</time>
									</div>
								</div><!-- /chat-in -->

								<div class="chat-separate"><time class="chat-time" datetime="">Recent</time></div>

								<div class="chat-in">
									<div class="chat-user">Phillip Morrison</div>
									<div class="chat-msg">
										<p>Dui posuere. Reprehenderit felis libero, potenti vitae</p>
										<time class="chat-time" datetime="2013-12-13T20:00">12 min</time>
									</div>
								</div><!-- /chat-out -->

							</div><!-- /chatbox-body -->

							<div class="chatbox-footer">
								<form class="chat-form">
									<p class="chat-status"><i class="fa fa-spinner fa-spin"></i> Phillip Morrison is type...</p>
									<div class="form-group">
										<button type="submit" class="btn" title="Send"><i class="fa fa-share"></i></button>
										<input type="text" class="chat-input" name="send_chat" placeholder="Type a message">
									</div>
								</form>
							</div><!-- /chatbox -->
						</div><!-- /chatbox -->
					</div><!-- /module -->
				</aside><!--/side-right -->
				<div class="pc_top_first" id='rollback_button'>
					<h3>回收站笔记</h3>
				</div>
			</div>
			<div class="col-xs-3" style='padding:0;' id='pc_part_2'>
				<!-- side-right -->
				<div class="pc_top_second">
					<h3>全部笔记</h3>
					<button type="button" class="btn btn-default btn-xs btn_plus" id='add_note'><i class="fa fa-plus"></i></button>
				</div>
				<aside class="side-right" id='second_side_right'>
					<div class="module" data-toggle="niceScroll">
						<div class="chat-contact">
							<div class="contact-body">
								<!-- 笔记列表 -->
								<ul class="contacts-list">
									
									
								</ul><!-- /contacts-list -->
							</div><!-- /contact-body -->
						</div><!-- /chat-contact -->

						<div class="chatbox">
							<h3 class="chatbox-heading">
								<a data-toggle="chatbox-close" href="#" class="pull-right text-sm text-silver"><i class="fa fa-times"></i></a>
								<i class="fa fa-circle-o text-primary"></i> 
								Phillip Morrison
							</h3><!-- /chatbox-heading -->

							<div class="chatbox-body" data-toggle="niceScroll">

								<div class="chat-separate"><time class="chat-time" datetime="">Jan 9, 2014</time></div>

								<div class="chat-in">
									<div class="chat-user">Phillip Morrison</div>
									<div class="chat-msg">
										<p>Praesent cras quisque. Volutpat sit interdum. Magnis leo, duis faucibus eu, in rutrum nulla. Eget sed, dolor nibh. Vero mi habitant</p>
										<time class="chat-time" datetime="2013-12-13T20:00">01:14 PM</time>
									</div>
								</div><!-- /chat-in -->

								<div class="chat-out">
									<div class="chat-user">Me</div>
									<div class="chat-msg">
										<p>Dictum at aenean, faucibus euismod convallis. Ipsum nec, platea amet nulla.</p>
										<time class="chat-time" datetime="2013-12-13T20:00">01:16 PM</time>
									</div>
								</div><!-- /chat-out -->

								<div class="chat-in">
									<div class="chat-user">Phillip Morrison</div>
									<div class="chat-msg">
										<p>Eu augue, proin rutrum. Et vehicula, wisi fusce, ut ipsum</p>
										<time class="chat-time" datetime="2013-12-13T20:00">01:20 PM</time>
									</div>
								</div><!-- /chat-in -->

								<div class="chat-separate"><time class="chat-time" datetime="">Jan 14, 2014</time></div>

								<div class="chat-out">
									<div class="chat-user">Me</div>
									<div class="chat-msg">
										<p>Est penatibus pellentesque, augue tincidunt, a suspendisse</p>
										<time class="chat-time" datetime="2013-12-13T20:00">09:36 AM</time>
									</div>
								</div><!-- /chat-out -->

								<div class="chat-in">
									<div class="chat-user">Phillip Morrison</div>
									<div class="chat-msg">
										<p>Nunc nulla. Donec laoreet non, lobortis praesent</p>
										<time class="chat-time" datetime="2013-12-13T20:00">09:40 AM</time>
									</div>
								</div><!-- /chat-in -->

								<div class="chat-separate"><time class="chat-time" datetime="">Recent</time></div>

								<div class="chat-in">
									<div class="chat-user">Phillip Morrison</div>
									<div class="chat-msg">
										<p>Dui posuere. Reprehenderit felis libero, potenti vitae</p>
										<time class="chat-time" datetime="2013-12-13T20:00">12 min</time>
									</div>
								</div><!-- /chat-out -->

							</div><!-- /chatbox-body -->

							<div class="chatbox-footer">
								<form class="chat-form">
									<p class="chat-status"><i class="fa fa-spinner fa-spin"></i> Phillip Morrison is type...</p>
									<div class="form-group">
										<button type="submit" class="btn" title="Send"><i class="fa fa-share"></i></button>
										<input type="text" class="chat-input" name="send_chat" placeholder="Type a message">
									</div>
								</form>
							</div><!-- /chatbox -->
						</div><!-- /chatbox -->
					</div><!-- /module -->
				</aside><!--/side-right -->

			</div>
			<div class="col-sm-7" style='padding:0;' id='pc_part_3'>
				<!-- side-right -->
				<div class="pc_top_third">
					<div class="row">
						<div class="col-xs-9">
							<h3>编辑笔记</h3>
						</div>
						<div class="col-xs-3">
							<button type="button" class="btn btn-block btn-sm btn-primary" id='save_note'>保存笔记</button>
						</div>
					</div>
				</div>
				<aside class="side-right" id='third_side_right'>
					<div class="module" data-toggle="niceScroll">
						<div class="chat-contact">
							<div class="contact-body clear_margin">
								<!--<ul class="contacts-list">
									<li class="online"><a href="#"><i class="fa fa-circle-o" title="online" rel="tooltip-bottom"></i> Phillip Morrison</a></li>
									<li class="offline"><a href="#"><i class="fa fa-circle-o" title="offline" rel="tooltip-bottom"></i> Samuel Porter</a></li>
									<li class="online"><a href="#"><i class="fa fa-circle-o" title="online" rel="tooltip-bottom"></i> Kathy Reynolds</a></li>
									<li class="online"><a href="#"><i class="fa fa-circle-o" title="online" rel="tooltip-bottom"></i> Aaron James</a></li>
									<li class="idle"><a href="#"><i class="fa fa-circle-o" title="idle" rel="tooltip-bottom"></i> Teresa May</a></li>
									<li class="online"><a href="#"><i class="fa fa-circle-o" title="online" rel="tooltip-bottom"></i> John Doe</a></li>
									<li class="online"><a href="#"><i class="fa fa-circle-o" title="online" rel="tooltip-bottom"></i> Iin Triasneni</a></li>
									<li class="online"><a href="#"><i class="fa fa-circle-o" title="online" rel="tooltip-bottom"></i> Mahatma</a></li>
									<li class="offline"><a href="#"><i class="fa fa-circle-o" title="offline" rel="tooltip-bottom"></i> Lawrence Ramirez</a></li>
									<li class="offline"><a href="#"><i class="fa fa-circle-o" title="offline" rel="tooltip-bottom"></i> Samantha Jenkins</a></li>
									<li class="disable"><a href="#"><i class="fa fa-circle-o" title="disable" rel="tooltip-bottom"></i> Sarah Payne</a></li>
									<li class="offline"><a href="#"><i class="fa fa-circle-o" title="offline" rel="tooltip-bottom"></i> Justin Perry</a></li>
									<li class="idle"><a href="#"><i class="fa fa-circle-o" title="idle" rel="tooltip-bottom"></i> Rebecca Vargas</a></li>
									<li class="online"><a href="#"><i class="fa fa-circle-o" title="online" rel="tooltip-bottom"></i> Sean Carpenter</a></li>
									<li class="idle"><a href="#"><i class="fa fa-circle-o" title="idle" rel="tooltip-bottom"></i> Arthur Pearson</a></li>
									<li class="offline"><a href="#"><i class="fa fa-circle-o" title="offline" rel="tooltip-bottom"></i> Julie Jimenez</a></li>
									<li class="idle"><a href="#"><i class="fa fa-circle-o" title="idle" rel="tooltip-bottom"></i> Sandra Ramirez</a></li>
									<li class="online"><a href="#"><i class="fa fa-circle-o" title="online" rel="tooltip-bottom"></i> Nicholas Cole</a></li>
									<li class="idle"><a href="#"><i class="fa fa-circle-o" title="idle" rel="tooltip-bottom"></i> Madison Hall</a></li>
									<li class="offline"><a href="#"><i class="fa fa-circle-o" title="offline" rel="tooltip-bottom"></i> Alan Shaw</a></li>
									<li class="online"><a href="#"><i class="fa fa-circle-o" title="online" rel="tooltip-bottom"></i> Randy Mills</a></li>
									<li class="disable"><a href="#"><i class="fa fa-circle-o" title="disable" rel="tooltip-bottom"></i> Kenneth Soto</a></li>
									<li class="disable"><a href="#"><i class="fa fa-circle-o" title="disable" rel="tooltip-bottom"></i> Harold James</a></li>
									<li class="online"><a href="#"><i class="fa fa-circle-o" title="online" rel="tooltip-bottom"></i> Paul Greene</a></li>
								</ul> /contacts-list -->
								<!--- 笔记标题 --->
								<div class="row" >
									<div class="col-xs-8">
										<input type="text" class="form-control" id="input_note_title" placeholder='笔记标题...'>
									</div>
								</div>
								<!--- 笔记标题 --->
								<div class="row">
									<div class="col-sm-12">
																		<!--- 输入框 --->
							<div id="panel-withbtn" class="panel panel-default sortable-widget-item">
                                <div class="panel-heading">
                                    <div class="btn-group">
                                        <button rel="tooltip-bottom" title="copy" class="btn btn-default btn-sm"><i class="fa fa-copy"></i></button>
                                        <button rel="tooltip-bottom" title="cut" class="btn btn-default btn-sm"><i class="fa fa-cut"></i></button>
                                        <button rel="tooltip-bottom" title="paste" class="btn btn-default btn-sm"><i class="fa fa-paste"></i></button>
                                    </div><!-- /btn-group -->
                                    <div class="btn-group">
                                        <button rel="tooltip-bottom" title="create new file" class="btn btn-default btn-sm"><i class="fa fa-file"></i></button>
                                        <button rel="tooltip-bottom" title="open from folder" class="btn btn-default btn-sm"><i class="fa fa-folder-open-o"></i></button>
                                        <button rel="tooltip-bottom" title="save" class="btn btn-default btn-sm"><i class="fa fa-save"></i></button>
                                    </div><!-- /btn-group -->
                                    <h3 class="panel-title sortable-widget-handle">编辑笔记</h3>
                                </div><!-- /panel-heading -->

                                <div class="panel-helper-block">
                                    <button data-refresh="#panel-withbtn" rel="tooltip-bottom" title="refresh" class="btn btn-default btn-sm pull-right"><i class="fa fa-refresh"></i></button>
                                    <div class="btn-group" data-toggle="buttons">
                                        <button rel="tooltip-bottom" title="bold" class="btn btn-default btn-sm"><i class="fa fa-bold"></i></button>
                                        <button rel="tooltip-bottom" title="italic" class="btn btn-default btn-sm"><i class="fa fa-italic"></i></button>
                                        <button rel="tooltip-bottom" title="underline" class="btn btn-default btn-sm"><i class="fa fa-underline"></i></button>
                                        <button rel="tooltip-bottom" title="strikethrough" class="btn btn-default btn-sm"><i class="fa fa-strikethrough"></i></button>
                                    </div>
                                    <div class="btn-group">
                                        <button rel="tooltip-bottom" title="list-ol" class="btn btn-default btn-sm"><i class="fa fa-list-ol"></i></button>
                                        <button rel="tooltip-bottom" title="list-ul" class="btn btn-default btn-sm"><i class="fa fa-list-ul"></i></button>
                                        <button rel="tooltip-bottom" title="table" class="btn btn-default btn-sm"><i class="fa fa-table"></i></button>
                                    </div>
                                    <div class="btn-group" data-toggle="buttons">
                                        <button rel="tooltip-bottom" title="align-center" class="btn btn-default btn-sm"><i class="fa fa-align-center"></i></button>
                                        <button rel="tooltip-bottom" title="align-justify" class="btn btn-default btn-sm"><i class="fa fa-align-justify"></i></button>
                                        <button rel="tooltip-bottom" title="align-left" class="btn btn-default btn-sm"><i class="fa fa-align-left"></i></button>
                                        <button rel="tooltip-bottom" title="align-right" class="btn btn-default btn-sm"><i class="fa fa-align-right"></i></button>
                                    </div>
                                </div>
                                
                                <form class="single-editor" role="form">
                                    <textarea class="form-control single-editor" placeholder="输入笔记内容..." id='input_note_text'></textarea>
                                </form>
                            </div>
								<!--- 输入框 --->
									</div>
								</div>
							</div><!-- /contact-body -->
						</div><!-- /chat-contact -->

						<div class="chatbox">
							<h3 class="chatbox-heading">
								<a data-toggle="chatbox-close" href="#" class="pull-right text-sm text-silver"><i class="fa fa-times"></i></a>
								<i class="fa fa-circle-o text-primary"></i> 
								Phillip Morrison
							</h3><!-- /chatbox-heading -->

							<div class="chatbox-body" data-toggle="niceScroll">

								<div class="chat-separate"><time class="chat-time" datetime="">Jan 9, 2014</time></div>

								<div class="chat-in">
									<div class="chat-user">Phillip Morrison</div>
									<div class="chat-msg">
										<p>Praesent cras quisque. Volutpat sit interdum. Magnis leo, duis faucibus eu, in rutrum nulla. Eget sed, dolor nibh. Vero mi habitant</p>
										<time class="chat-time" datetime="2013-12-13T20:00">01:14 PM</time>
									</div>
								</div><!-- /chat-in -->

								<div class="chat-out">
									<div class="chat-user">Me</div>
									<div class="chat-msg">
										<p>Dictum at aenean, faucibus euismod convallis. Ipsum nec, platea amet nulla.</p>
										<time class="chat-time" datetime="2013-12-13T20:00">01:16 PM</time>
									</div>
								</div><!-- /chat-out -->

								<div class="chat-in">
									<div class="chat-user">Phillip Morrison</div>
									<div class="chat-msg">
										<p>Eu augue, proin rutrum. Et vehicula, wisi fusce, ut ipsum</p>
										<time class="chat-time" datetime="2013-12-13T20:00">01:20 PM</time>
									</div>
								</div><!-- /chat-in -->

								<div class="chat-separate"><time class="chat-time" datetime="">Jan 14, 2014</time></div>

								<div class="chat-out">
									<div class="chat-user">Me</div>
									<div class="chat-msg">
										<p>Est penatibus pellentesque, augue tincidunt, a suspendisse</p>
										<time class="chat-time" datetime="2013-12-13T20:00">09:36 AM</time>
									</div>
								</div><!-- /chat-out -->

								<div class="chat-in">
									<div class="chat-user">Phillip Morrison</div>
									<div class="chat-msg">
										<p>Nunc nulla. Donec laoreet non, lobortis praesent</p>
										<time class="chat-time" datetime="2013-12-13T20:00">09:40 AM</time>
									</div>
								</div><!-- /chat-in -->

								<div class="chat-separate"><time class="chat-time" datetime="">Recent</time></div>

								<div class="chat-in">
									<div class="chat-user">Phillip Morrison</div>
									<div class="chat-msg">
										<p>Dui posuere. Reprehenderit felis libero, potenti vitae</p>
										<time class="chat-time" datetime="2013-12-13T20:00">12 min</time>
									</div>
								</div><!-- /chat-out -->

							</div><!-- /chatbox-body -->

							<div class="chatbox-footer">
								<form class="chat-form">
									<p class="chat-status"><i class="fa fa-spinner fa-spin"></i> Phillip Morrison is type...</p>
									<div class="form-group">
										<button type="submit" class="btn" title="Send"><i class="fa fa-share"></i></button>
										<input type="text" class="chat-input" name="send_chat" placeholder="Type a message">
									</div>
								</form>
							</div><!-- /chatbox -->
						</div><!-- /chatbox -->
					</div><!-- /module -->
				</aside><!--/side-right -->

			</div>
		</div>
        <footer>
            <p>&copy; 2014 Stilearning</p>
        </footer>
		<script type="text/javascript">
			function get_dom(e){
				return document.getElementById(e);
			}
			function set_height(){
				var pc_height=window.innerHeight;
				pc_height=pc_height-131;
				get_dom('first_side_right').style.height=(pc_height-31)+'px';
				get_dom('second_side_right').style.height=pc_height+'px';
				get_dom('input_note_text').value=pc_height+'px';
				get_dom('third_side_right').style.height=(pc_height-15)+'px';
			}
			set_height();
			window.onresize=function(){
				set_height();
			}
		</script>



        <!-- javascript
        ================================================== -->
        <!-- List of dependencies file, please check on readme.txt! (Purchase only) -->

        <script src="<%=basePath%>/scripts/39914ff3.vendor-main.js"></script>
        
        <script src="<%=basePath%>/scripts/756399db.vendor-usefull.js"></script>

        <script src="<%=basePath%>/scripts/e7058f60.vendor-form.js"></script>
        
        <script src="<%=basePath%>/scripts/fc9d433c.vendor-editor.js"></script>
        
        
        <!--[if lte IE 8]>
        <script src="scripts/eae815b5.excanvas.js"></script>
        <![endif]-->

        <script src="<%=basePath%>/scripts/2ce1156c.vendor-graph.js"></script>
    
        <script src="<%=basePath%>/scripts/37a77790.vendor-table.js"></script>

        <script src="<%=basePath%>/scripts/1581b2aa.vendor-maps.js"></script>
        
        <script src="<%=basePath%>/scripts/5f4fd25b.vendor-util.js"></script>


        <!-- required stilearn template js -->
        <script src="<%=basePath%>/scripts/5917523f.main.js"></script>

        <!-- This scripts will be reload after pjax or if popstate event is active (use with class .re-execute) -->
        <script src="<%=basePath%>/scripts/89c3d6c9.initializer.js"></script>
<script type="text/javascript">
$(function(){
			/**
			*进入页面之后加载，查询所有笔记
			*/
			$.ajax({
				type : "post",
				url : "<%=basePath%>/note/getAllNoteBook",
				async : false,
				dataType : "json",
				success : function(data) {
					//alert(data.allNoteBook);
					if(data.allNoteBook!=null){
						var allNoteBookList = eval(data.allNoteBook);
						$.each(allNoteBookList,function(idx,item){ //循环对象取值
						$('.contacts-list:first li:first').after('<li class="online" onclick="noteBookClick(this)" name="'+item.rowKey+'"><a name="'+item.rowKey+'" href="#"><i class="fa fa-book" title="笔记本" rel="tooltip-bottom"></i> '+item.name+'<button type="button" class="btn btn-default btn-xs btn_position btn_delete"><i class="fa fa-times"></i></button></a></li>');
		          		 });
					}
				},
				error:function(data) {
					alert("no");
				}
			});
//----取消创建
	//----创建笔记本
	$(document).on("click", "#modalBasic .btn.btn-primary.sure",
    function(a) {
		var get_name=$('#input_notebook').val()?$('#input_notebook').val():'新建笔记本';
		var now = new Date().getTime();
		var flag;
		$.ajax({
			type : "post",
			url : "<%=basePath%>/note/addNoteBook",
			async : false,
			dataType : "json",
			data: {"noteBookName":get_name,"now":now},
			success : function(data) {
				//alert(data.success);
				flag=data.success;
				if(flag){
					 if(get_name==null||get_name==''){
							$(this).parent('dd').remove();
						}
						else{
							$('.contacts-list:first li:first').after('<li class="online" name="'+flag+'"  onclick="noteBookClick(this)" ><a href="#"><i class="fa fa-book" title="笔记本" rel="tooltip-bottom"></i> '+get_name+'<button type="button" class="btn btn-default btn-xs btn_position btn_delete"><i class="fa fa-times"></i></button></a></li>');
							$('.close,.cancle').trigger('click');
						}
				}
			},
			error:function(data) {
				//alert("no");
				$(this).parent('dd').remove();
			}
		});
		
    });		
		//----创建笔记本
	//----删除笔记本
	$(document).on("click", "#first_side_right .btn_delete",
    function(a) {
		var action=confirm('确定删除笔记本？');
		var get_name=$(this).parents('li').text();
		var rowKey=$(this).parents('li').attr("name");
		var flag;
		if(action==true){
			$.ajax({
				type : "post",
				url : "<%=basePath%>/note/deleteNoteBook",
				async : false,
				dataType : "json",
				data: {"noteBookName":get_name,"rowKey":rowKey},
				success : function(data) {
					//alert(data.allNoteBook);
					flag=data.success;
				},
				error:function(data) {
					//alert("no");
				}
			});
			if (flag) {
				$(this).parents('li').remove();
			}
			
		}
		else{
			return false;
		}
	});	
		
		//添加笔记内容
		$(document).on("click", "#save_note",
    		function(a) {
    		alert("添加笔记内容");
			var noteName=$("#input_note_title").val();
			var noteRowKey=$("#hidden_now_noterowkey").val();
			var noteContent=$("#input_note_text").val();
			var noteBookName = $("#hidden_now_notebook").val();
			var noteBookRowkey = $("#hidden_now_rowkey").val();
			var flag;
				$.ajax({
					type : "post",
					url : "<%=basePath%>/note/addNoteContent",
					async : false,
					dataType : "json",
					data: {"noteName":noteName,"noteRowKey":noteRowKey,"noteContent":noteContent,"noteBookName":noteBookName,"noteBookRowkey":noteBookRowkey},
					success : function(data) {
						//alert(data.allNoteBook);
						if(data){
							alert("保存成功");
						}
					},
					error:function(data) {
						alert("no");
					}
				});

    	});		
			
			
		});
		
		//点击笔记本列表事件
		function noteBookClick(obj){
				var noteBookName = $(obj).text();
					var rowkey = $(obj).attr('name');
					$("#hidden_now_rowkey").val(rowkey);
					$("#hidden_now_notebook").val(noteBookName);
					$.ajax({
						type : "post",
						url : "<%=basePath%>/note/getNoteListByNotebook",
						async : false,
						data :{"noteBookName":noteBookName,"rowkey":rowkey},
						dataType : "json",
						success : function(data) {
							if(data!=null){
								$('.contacts-list:eq(1)').html("");
								$.each(data,function(idx,item){ //循环对象取值
									//alert(item.name);
									$('.contacts-list:eq(1)').append("<li onclick=\"loadNoteContent('"+item.name+"','"+item.rowKey+"')\" name='"+item.rowKey+"' class=\"online\"><a href=\"#\"><i class=\"fa fa-file-text-o\" title=\"online\" rel=\"tooltip-bottom\"></i> "+item.name+"<button type=\"button\" class=\"btn btn-default btn-xs btn_position btn_delete\"><i class=\"fa fa-times\"></i></button><button type=\"button\" class=\"btn btn-default btn-xs btn_position_2 btn_share\"><i class=\"fa fa-sitemap\"></i></button></a></li>");
				          		 });
							}
						},
						error:function(data) {
							//alert("no");
							
						}
					});
		}
		
		function loadNoteContent(noteName,rowkey){
			$("#input_note_title").val(noteName);
			//ajax请求笔记内容：
			$.ajax({
						type : "post",
						url : "<%=basePath%>/note/getNoteListByNotebook11",
						async : false,
						data :{"noteBookName":noteName,"rowkey":rowkey},
						dataType : "json",
						success : function(data) {
							if(data.noteList!=null){
								
								$.each(data.noteList,function(idx,item){ //循环对象取值
									//alert(item.name);
									
				          		 });
							}
						},
						error:function(data) {
							//alert("no");
							
						}
					});
			
		}
		
		
</script>
    </body>
</html>

