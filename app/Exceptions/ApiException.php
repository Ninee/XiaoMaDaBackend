<?php

namespace App\Exceptions;

use Exception;

class ApiException extends Exception
{
    public function render()
    {
        return exception_response($this);
    }
}
