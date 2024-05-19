<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

class CaptchaController extends Controller
{
    public function reloadCaptcha()
    {
        return response()->json(['captcha' => captcha_img('math')]);
    }

    public function post(Request $request)
    {
        $request->validate([
            'captcha' => 'required|captcha',
        ]);

        // Handle login logic here. For demonstration, we'll just return a success message.
        return back()->with('success', 'CAPTCHA validated successfully.');
    }
}
