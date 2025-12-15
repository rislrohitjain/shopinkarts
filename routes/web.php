<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\UserController;

Route::get('/', function () {
    return view('welcome');
})->name('landing');




Auth::routes();

Route::get('/home', [App\Http\Controllers\HomeController::class, 'index'])->name('home');

// The base route is protected by the 'view user management' permission
Route::middleware(['auth', 'permission:view user management'])->prefix('users')->group(function () {
    Route::get('/', [UserController::class, 'index'])->name('users.index');

    // Specific actions are protected by granular permissions
    Route::get('/create', [UserController::class, 'create'])->middleware('permission:create users')->name('users.create');
    Route::put('/{user}', [UserController::class, 'update'])->middleware('permission:edit users')->name('users.update');
    Route::delete('/{user}', [UserController::class, 'destroy'])->middleware('permission:delete users')->name('users.destroy');
});

Auth::routes();
 
