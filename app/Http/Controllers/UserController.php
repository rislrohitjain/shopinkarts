<?php

namespace App\Http\Controllers;

use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Gate;

class UserController extends Controller
{
    /**
     * Display a listing of the users.
     */
    public function index()
    {
        // Policy check is optional here, as the route middleware ('permission:view user management') 
        // already protects the route. This just ensures redundancy.
        
        // This line checks the permission assigned to the route
        if (!auth()->user()->can('view user management')) {
             abort(403, 'Unauthorized action.');
        }

        // Retrieve all users with their roles (for display purposes)
        $users = User::with('roles')->paginate(10); 

        return view('users.index', compact('users'));
    }

    /**
     * Show the form for creating a new user.
     * The route middleware will ensure 'create users' permission is held.
     */
    public function create()
    {
        return view('users.create');
    }

    // You would add methods for store, edit, update, and destroy here, 
    // each protected by the specific route middleware (e.g., 'permission:edit users').
}