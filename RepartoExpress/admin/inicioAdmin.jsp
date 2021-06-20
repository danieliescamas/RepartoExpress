<%-- 
    Document   : inicioAdmin
    Created on : 14-jun-2021, 16:20:01
    Author     : daniel
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        
        <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
        <script src="https://ajax.googleapis.com/ajax/libs/d3js/6.7.0/d3.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        
        
        
        
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/js/bootstrap.bundle.min.js"
                integrity="sha384-ygbV9kiqUc6oa4msXn9868pTtWMgiQaeYH7/t7LECLbyPA2x65Kgf80OJFdroafW"
        crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"
                integrity="sha384-q2kxQ16AaE6UbzuKqyBE9/u/KzioAlnx2maXQHiDX9d4/zp8Ok3f+M7DPm+Ib6IU"
        crossorigin="anonymous"></script>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet"
              integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1" crossorigin="anonymous">

        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.2/css/all.css" integrity="sha384-vSIIfh2YWi9wW0r9iZe7RJPrKwp6bG+s9QZMoITbCckVJqGCCRhc+ccxNcdpHuYu" crossorigin="anonymous">
        <script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
        
        <style>
            /*!
 * Start Bootstrap - Simple Sidebar (https://startbootstrap.com/)
 * Copyright 2013-2016 Start Bootstrap
 * Licensed under MIT (https://github.com/BlackrockDigital/startbootstrap/blob/gh-pages/LICENSE)
 */

            body {
                overflow-x: hidden;
            }

            /* Toggle Styles */

            #wrapper {
                padding-left: 0;
                -webkit-transition: all 0.5s ease;
                -moz-transition: all 0.5s ease;
                -o-transition: all 0.5s ease;
                transition: all 0.5s ease;
            }

            #wrapper.toggled {
                padding-left: 250px;
            }

            #sidebar-wrapper {
                z-index: 1000;
                position: fixed;
                left: 250px;
                width: 0;
                height: 100%;
                margin-left: -250px;
                overflow-y: auto;
                background: #000;
                -webkit-transition: all 0.5s ease;
                -moz-transition: all 0.5s ease;
                -o-transition: all 0.5s ease;
                transition: all 0.5s ease;
            }

            #wrapper.toggled #sidebar-wrapper {
                width: 250px;
            }

            #page-content-wrapper {
                width: 100%;
                position: absolute;
                padding: 15px;
            }

            #wrapper.toggled #page-content-wrapper {
                position: absolute;
                margin-right: -250px;
            }

            /* Sidebar Styles */

            .sidebar-nav {
                position: absolute;
                top: 0;
                width: 250px;
                margin: 0;
                padding: 0;
                list-style: none;
            }

            .sidebar-nav li {
                text-indent: 20px;
                line-height: 40px;
            }

            .sidebar-nav li a {
                display: block;
                text-decoration: none;
                color: #999999;
            }

            .sidebar-nav li a:hover {
                text-decoration: none;
                color: #fff;
                background: rgba(255,255,255,0.2);
            }

            .sidebar-nav li a:active,
            .sidebar-nav li a:focus {
                text-decoration: none;
            }

            .sidebar-nav > .sidebar-brand {
                height: 65px;
                font-size: 18px;
                line-height: 60px;
            }

            .sidebar-nav > .sidebar-brand a {
                color: #999999;
            }

            .sidebar-nav > .sidebar-brand a:hover {
                color: #fff;
                background: none;
            }

            @media(min-width:768px) {
                #wrapper {
                    padding-left: 250px;
                }

                #wrapper.toggled {
                    padding-left: 0;
                }

                #sidebar-wrapper {
                    width: 250px;
                }

                #wrapper.toggled #sidebar-wrapper {
                    width: 0;
                }

                #page-content-wrapper {
                    padding: 20px;
                    position: relative;
                }

                #wrapper.toggled #page-content-wrapper {
                    position: relative;
                    margin-right: 0;
                }
            }
        </style>

        <title>Inicio-Admin</title>
    </head>
    <body>

        <div id="wrapper">

            <!-- Sidebar -->
            <div id="sidebar-wrapper">
                <ul class="sidebar-nav">
                    <li class="sidebar-brand">
                        <a href="inicioAdmin.jsp">
                            Inicio
                        </a>
                    </li>
                    <li>
                        <a href="CargarSolicitudesTrabajador">Solicitudes de trabajadores</a>
                    </li>
                    <li>
                        <a href="CargarSolicitudesEmpresa">Solicitudes de empresas</a>
                    </li>
                   
                </ul>
            </div>
            <!-- /#sidebar-wrapper -->

            <!-- Page Content -->
            <div id="page-content-wrapper">
                <div class="container-fluid">
                    <div class="row">
                        <div class="col-lg-12">
                            <h1>Administración de Reparto Express</h1>
                            <a href="#menu-toggle" class="btn btn-dark" id="menu-toggle">Menú</a>
                        </div>
                    </div>
                </div>
                
                <!-- AQUÍ EL CONTENIDO DE LA PÁGINA -->
                
                <div class="container">
                    
                    <div class="row">
                        
                        <div class="col text-center">
                            
                            <img class="img-fluid" style="height:30%" src="../Imagenes/admin.png" alt="img">
                            
                        </div>
                        
                    </div>
                </div>
                
                
                
            </div>
            <!-- /#page-content-wrapper -->

        </div>
        <!-- /#wrapper -->



        
              <script>
            $("#menu-toggle").click(function(e) {
            e.preventDefault();
            $("#wrapper").toggleClass("toggled");
            });
        </script>
      


    </body>
</html>
