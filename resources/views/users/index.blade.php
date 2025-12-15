@extends('layouts.app')

@section('content')
<div class="container">
    <div class="row justify-content-center">
        <div class="col-md-10">
            <div class="card">
                <div class="card-header bg-primary text-white">
                    <h5 class="mb-0">
                        User Management 
                        @can('create users')
                            <a href="{{ route('users.create') }}" class="btn btn-sm btn-light float-end">Add New User</a>
                        @endcan
                    </h5>
                </div>

                <div class="card-body">
                    <table class="table table-striped table-hover">
                        <thead>
                            <tr>
                                <th>#</th>
                                <th>Name</th>
                                <th>Email</th>
                                <th>Roles</th>
                                <th>Permissions</th>
                                <th>Actions</th>
                            </tr>
                        </thead>
                        <tbody>
                            @foreach ($users as $user)
                            <tr>
                                <td>{{ $user->id }}</td>
                                <td>{{ $user->name }}</td>
                                <td>{{ $user->email }}</td>
                                <td>
                                    @foreach ($user->roles as $role)
                                        <span class="badge bg-secondary">{{ $role->name }}</span>
                                    @endforeach
                                </td>
                                <td>
                                    {{-- Display only the first 3 direct permissions for brevity --}}
                                    @php
                                        $permissions = $user->getDirectPermissions()->pluck('name')->take(3);
                                    @endphp
                                    @foreach ($permissions as $permission)
                                        <span class="badge bg-info">{{ $permission }}</span>
                                    @endforeach
                                    @if ($user->getDirectPermissions()->count() > 3)
                                        <span class="badge bg-info">+{{ $user->getDirectPermissions()->count() - 3 }} more</span>
                                    @endif
                                </td>
                                <td>
                                    {{-- Check for 'edit users' permission before showing edit button --}}
                                    @can('edit users')
                                        <a href="#" class="btn btn-sm btn-warning">Edit</a>
                                    @endcan
                                    
                                    {{-- Check for 'delete users' permission before showing delete button --}}
                                    @can('delete users')
                                        <form method="POST" action="#" style="display:inline;">
                                            @csrf
                                            @method('DELETE')
                                            <button type="submit" class="btn btn-sm btn-danger" onclick="return confirm('Are you sure?')">Delete</button>
                                        </form>
                                    @endcan
                                </td>
                            </tr>
                            @endforeach
                        </tbody>
                    </table>

                    <div class="d-flex justify-content-center">
                        {{ $users->links() }}
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
@endsection