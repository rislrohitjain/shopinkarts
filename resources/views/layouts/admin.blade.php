<!DOCTYPE html>
<html lang="{{ str_replace('_', '-', app()->getLocale()) }}">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta http-equiv="x-ua-compatible" content="ie=edge">

    <meta name="csrf-token" content="{{ csrf_token() }}">

    <title>{{ config('app.name', 'Laravel') }} | @yield('page_title', 'Dashboard')</title>

    {{-- AdminLTE CSS and Plugins (Assuming AdminLTE assets are in public/adminlte) --}}

    <link rel="stylesheet" href="{{ asset('public/adminlte/plugins/fontawesome-free/css/all.min.css') }}">
    <link rel="stylesheet" href="{{ asset('public/adminlte/plugins/fontawesome-free/css/all.min.css') }}">
    
    <link rel="stylesheet" href="{{ asset('public/adminlte/dist/css/adminlte.min.css') }}">
    
    <link href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700" rel="stylesheet">
    
    <link href="{{ asset('public/css/app.css') }}" rel="stylesheet">

    @stack('styles')
</head>

{{-- The AdminLTE body class is essential for the layout and sidebar functionality --}}
<body class="hold-transition sidebar-mini layout-fixed">
<div class="wrapper">

    {{-- ================================================================= --}}
    {{-- 1. TOP NAVBAR (AdminLTE Header)                                   --}}
    {{-- ================================================================= --}}
    <nav class="main-header navbar navbar-expand navbar-white navbar-light">
        <ul class="navbar-nav">
            <li class="nav-item">
                {{-- This button toggles the sidebar (AdminLTE pushmenu) --}}
                <a class="nav-link" data-widget="pushmenu" href="#" role="button"><i class="fas fa-bars"></i></a>
            </li>
            {{-- You can add other left-side navigation links here --}}
        </ul>

        <ul class="navbar-nav ml-auto">
            @guest
                {{-- Login Link --}}
                @if (Route::has('login'))
                    <li class="nav-item">
                        <a class="nav-link" href="{{ route('login') }}">{{ __('Login') }}</a>
                    </li>
                @endif
                {{-- Register Link --}}
                @if (Route::has('register'))
                    <li class="nav-item">
                        <a class="nav-link" href="{{ route('register') }}">{{ __('Register') }}</a>
                    </li>
                @endif
            @else
                {{-- User Dropdown Menu --}}
                <li class="nav-item dropdown">
                    <a class="nav-link" data-toggle="dropdown" href="#" role="button" aria-expanded="false">
                        {{ Auth::user()->name }} <i class="fas fa-caret-down"></i>
                    </a>
                    <div class="dropdown-menu dropdown-menu-lg dropdown-menu-right">
                        <a class="dropdown-item" href="{{ route('logout') }}"
                           onclick="event.preventDefault(); document.getElementById('logout-form').submit();">
                            <i class="fas fa-sign-out-alt mr-2"></i> {{ __('Logout') }}
                        </a>
                        <form id="logout-form" action="{{ route('logout') }}" method="POST" class="d-none">
                            @csrf
                        </form>
                    </div>
                </li>
            @endguest
        </ul>
    </nav>
    {{-- /.navbar --}}


    {{-- ================================================================= --}}
    {{-- 2. MAIN SIDEBAR CONTAINER                                         --}}
    {{-- ================================================================= --}}
    @auth 
    <aside class="main-sidebar sidebar-dark-primary elevation-4">
        
        <a href="{{ url('home') }}" class="brand-link">
            {{-- Replaced original logo with AdminLTE style --}}
            <img src="{{ asset('public/images/logo.png') }}" alt="{{ config('app.name', 'Laravel') }} Logo" class="brand-image img-circle elevation-3" style="opacity: .8" height="50px" width="50px" >
            <span class="brand-text font-weight-light">{{ config('app.name', 'Laravel') }}</span>
        </a>

        <div class="sidebar">
            <div class="user-panel mt-3 pb-3 mb-3 d-flex">
                <div class="image">
                    {{-- Placeholder image, replace with user avatar if available --}}
                    <img src="{{ asset('public/adminlte/dist/img/user2-160x160.jpg') }}" class="img-circle elevation-2" alt="User Image">
                </div>
                <div class="info">
                    <a href="#" class="d-block">{{ Auth::user()->name }}</a>
                </div>
            </div>

            <nav class="mt-2">
                <ul class="nav nav-pills nav-sidebar flex-column" data-widget="treeview" role="menu" data-accordion="false">
                    
                <li class="nav-item">
                    <a href="{{ route('home') }}" class="nav-link active">
                    <i class="nav-icon fas fa-file"></i>
                    <p>Dashboard</p>
                    </a>
                </li>
          

                    {{-- Refactored Master Main Menu (using AdminLTE structure) --}}
                    {{-- The 'menu-open' class can be added dynamically to keep it expanded --}}
                    <li class="nav-item has-treeview menu-open"> 
                        <a href="#" class="nav-link activenot"> {{-- 'active' class to highlight the main link --}}
                            <i class="nav-icon fas fa-tachometer-alt"></i>
                            <p>
                                Master Main Menu
                                <i class="right fas fa-angle-left"></i>
                            </p>
                        </a>
                        <ul class="nav nav-treeview">
                            <li class="nav-item">
                                {{-- Use 'active' class dynamically based on current route --}}
                                <a href="{{ route('home') }}" class="nav-link"> 
                                    <i class="far fa-circle nav-icon"></i>
                                    <p>Users Management</p>
                                </a>
                            </li>
                            {{-- Add other submenu items here --}}
                        </ul>
                    </li>
                    
                    {{-- Add other main menu items here --}}

                </ul>
            </nav>
            </div>
        </aside>
    @endauth
    
    {{-- ================================================================= --}}
    {{-- 3. CONTENT WRAPPER (Main Content Area)                            --}}
    {{-- ================================================================= --}}
    <div class="content-wrapper">
        
        <div class="content-header">
            <div class="container-fluid">
                <div class="row mb-2">
                    <div class="col-sm-6">
                        <h1 class="m-0 text-dark">@yield('page_title', 'Page Title')</h1>
                    </div><div class="col-sm-6">
                        {{-- You can add breadcrumbs here --}}
                        @yield('breadcrumb')
                    </div></div></div></div>
        <section class="content">
            <div class="container-fluid">
                {{-- Content section where child views will inject their content --}}
                @yield('content')
            </div></section>
        </div>
    {{-- ================================================================= --}}
    {{-- 4. FOOTER (Optional)                                              --}}
    {{-- ================================================================= --}}
    <footer class="main-footer">
        <div class="float-right d-none d-sm-inline">
            Shopinkarts
        </div>
        <strong>Copyright &copy; {{ date('Y') }} <a href="{{ url('/') }}">{{ config('app.name', 'Laravel') }}</a>.</strong> All rights reserved.
    </footer>

</div>
{{-- ================================================================= --}}
{{-- 5. SCRIPTS                                                        --}}
{{-- ================================================================= --}}

<script src="{{ asset('public/adminlte/plugins/jquery/jquery.min.js') }}"></script>
<script src="{{ asset('public/adminlte/plugins/bootstrap/js/bootstrap.bundle.min.js') }}"></script>
<script src="{{ asset('public/adminlte/dist/js/adminlte.min.js') }}"></script>

<script src="{{ asset('public/js/app.js') }}" defer></script>

@stack('scripts')

</body>
</html>