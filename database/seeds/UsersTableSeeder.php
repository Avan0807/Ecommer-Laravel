<?php

use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\Hash;
class UsersTableSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        $data=array(
            array(
                'name'=>'Anh Van',
                'email'=>'admin@mail.com',
                'password'=>Hash::make('123'),
                'role'=>'admin',
                'status'=>'active'
            ),
            array(
                'name'=>'Customer A',
                'email'=>'customer@mail.com',
                'password'=>Hash::make('123'),
                'role'=>'user',
                'status'=>'active'
            ),
        );

        DB::table('users')->insert($data);
    }
}
