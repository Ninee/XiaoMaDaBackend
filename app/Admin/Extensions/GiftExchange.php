<?php

namespace App\Admin\Extensions;

use Encore\Admin\Admin;

class GiftExchange
{
    protected $id;

    public function __construct($id)
    {
        $this->id = $id;
    }

    protected function script()
    {
        return <<<SCRIPT

$('.exchange-btn').on('click', function () {
    var id = $(this).data('id');
    swal({
        title: "确认结算该任务？",
        type: "warning",
        showCancelButton: true,
        confirmButtonColor: "#DD6B55",
        confirmButtonText: "确认",
        showLoaderOnConfirm: true,
        cancelButtonText: "取消",
        preConfirm: function() {
            $.ajax({
                method: 'get',
                url: '/admin/task_user/clear/' + id, 
                success: function (data) {
                    console.log(data);
                    $.pjax.reload('#pjax-container');
                    if(data.errno == 0){
                        swal(data.msg, data.message, 'success');
                    }else{
                        swal(data.msg, data.message, 'error');
                    }
                }
            });
        }
    });
});

SCRIPT;
    }

    protected function render()
    {
        Admin::script($this->script());

        return "<a class='btn btn-xs btn-info exchange-btn' data-id='{$this->id}'>确认结算</a>";
    }

    public function __toString()
    {
        return $this->render();
    }
}