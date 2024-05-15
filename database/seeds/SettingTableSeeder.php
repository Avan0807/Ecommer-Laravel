<?php

use Illuminate\Database\Seeder;

class SettingTableSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        $data=array(
            'description'=>"Im Anh Van",
            'short_des'=>"HeHe",
            'photo'=>"https://i.pinimg.com/236x/ee/87/d8/ee87d8be406a16e8649217baa79505c2.jpg",
            'logo'=>'https://i.pinimg.com/236x/5b/51/64/5b5164dcf86e0b3825931f217964b144.jpg',
            'address'=>"1 P.Trung Hòa, Trung Hoà, Cầu Giấy, Hà Nội, Việt Nam",
            'email'=>"yaemiko@gmail.com",
            'phone'=>"0967078760",
        );
        DB::table('settings')->insert($data);
    }
}
