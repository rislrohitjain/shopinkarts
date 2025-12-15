<?php 
namespace Database\Seeders;

use Illuminate\Database\Seeder;
use Spatie\Permission\Models\Role;
use Spatie\Permission\Models\Permission;
use App\Models\User;

class RolesAndPermissionsSeeder extends Seeder
{
    public function run(): void
    {
        app()[\Spatie\Permission\PermissionRegistrar::class]->forgetCachedPermissions();

        // --- 1. Define Permissions ---
        $permissions = [
            'view user management', 'create users', 'edit users', 'delete users', 
            'view dashboard', 'manage content',
        ];
        foreach ($permissions as $permission) {
            Permission::firstOrCreate(['name' => $permission]);
        }

        // --- 2. Define Roles ---
        $superAdminRole = Role::firstOrCreate(['name' => 'Super Admin']);
        $adminRole = Role::firstOrCreate(['name' => 'Admin']);
        $operatorRole = Role::firstOrCreate(['name' => 'Operator']);

        // --- 3. Assign Permissions to Roles ---
        $superAdminRole->givePermissionTo(Permission::all());

        $userManagementPermissions = [
            'view user management', 'create users', 'edit users', 'delete users', 
            'view dashboard', 'manage content'
        ];
        $adminRole->givePermissionTo($userManagementPermissions);

        $operatorRole->givePermissionTo(['view dashboard', 'manage content']);

        // --- 4. Create Initial Test Users ---
        User::factory()->create(['name' => 'Super Admin', 'email' => 'superadmin@app.com', 'password' => bcrypt('password')])
            ->assignRole($superAdminRole);

        User::factory()->create(['name' => 'Admin User', 'email' => 'admin@app.com', 'password' => bcrypt('password')])
            ->assignRole($adminRole);

        User::factory()->create(['name' => 'Operator User', 'email' => 'operator@app.com', 'password' => bcrypt('password')])
            ->assignRole($operatorRole);
    }
}