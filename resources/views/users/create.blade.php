@extends('layouts.app')

@section('content')
<div class="container">
    <div class="row justify-content-center">
        <div class="col-md-8">
            <div class="card">
                <div class="card-header bg-success text-white">Create New User</div>
                <div class="card-body">
                    @can('create users')
                        <p>This is where the user creation form would go. You have the **'create users'** permission.</p>
                        {{-- Add your form fields here --}}
                        <a href="{{ route('users.index') }}" class="btn btn-secondary">Back to User List</a>
                    @else
                        <p class="text-danger">You do not have permission to view this page.</p>
                    @endcan
                </div>
            </div>
        </div>
    </div>
</div>
@endsection