<?php

namespace App\Admin\Extensions;

use Encore\Admin\Admin;

class DeliverAction
{
    protected $id;

    public function __construct($id)
    {
        $this->id = $id;
    }

    protected function script()
    {
        return <<<SCRIPT

$("#deliverBtn{$this->id}").on('click', function () {
    $("#deliverModal{$this->id}").modal('show')
});

$("#submitExpress{$this->id}").on('click', function() {
    console.log($(this).data('id'));
    $.ajax({
        method: 'post',
        url: '/admin/order/express',
        data: {
			_token:LA.token,
            id: '{$this->id}',
            company: $("#expressCompany{$this->id}").val(),
            sn: $("#expressSn{$this->id}").val(),
        },
        success: function (res) {
			console.log(res)
			$("#deliverModal{$this->id}").modal('hide');
			if(res.errno == 0){
				$.pjax.reload('#pjax-container');
				toastr.success('操作成功');
			} else {
				toastr.error(res.message);
			}
            
        }
    });
});

SCRIPT;
    }

    protected function render()
    {
        $modal = <<<HTML
<div class="container">
    <!-- 模态框（Modal） -->
    <div class="modal fade" id="deliverModal{$this->id}" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                    <h4 class="modal-title" id="myModalLabel">发货信息</h4>
                </div>
                <div class="modal-body" style="height: 200px;">
                <div role="form">
                    <div class="form-group  row">
                                <label for="express" class="col-sm-2  control-label">快递公司</label>
                                <div class="col-sm-8">                                                
                                    <div class="input-group">                   
                                                    <span class="input-group-addon"><i class="fa fa-pencil fa-fw"></i></span>                              
                                        <input type="text" id="expressCompany{$this->id}" name="express" value="" class="form-control order_id" placeholder="输入快递公司">                                                 
                                    </div>                  
                                </div>
                        </div>
                        <div class="form-group  row">
                                <label for="sn" class="col-sm-2  control-label">快递单号</label>
                                <div class="col-sm-8">                                                
                                    <div class="input-group">                   
                                                    <span class="input-group-addon"><i class="fa fa-pencil fa-fw"></i></span>                              
                                        <input type="text" id="expressSn{$this->id}" name="sn" value="" class="form-control order_id" placeholder="输入快递单号">                                                 
                                    </div>                  
                                </div>
                        </div>
                    </div>
                    
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                    <button id="submitExpress{$this->id}" data-id="{$this->id}" type="button" class="btn btn-primary submit-express">提交</button>
                </div>
            </div><!-- /.modal-content -->
        </div><!-- /.modal -->
    </div>
</div>
HTML;

        Admin::html($modal);

        Admin::script($this->script());

        return "<a  id='deliverBtn{$this->id}' class='btn btn-xs btn-primary deliver-btn' data-id='{$this->id}'>发货</a>";
    }

    public function __toString()
    {
        return $this->render();
    }
}