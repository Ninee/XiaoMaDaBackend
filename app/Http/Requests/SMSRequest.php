<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;

class SMSRequest extends FormRequest
{
    /**
     * Determine if the user is authorized to make this request.
     *
     * @return bool
     */
    public function authorize()
    {
        return true;
    }

    /**
     * Get the validation rules that apply to the request.
     *
     * @return array
     */
    public function rules()
    {
        return [
            'mobile' => 'required|digits:11',
        ];
    }

    public function messages()
    {
        return [
            'mobile.required' => '请输入手机号码',
            'mobile.digits' => '无效的手机号码',
        ];
    }
}
