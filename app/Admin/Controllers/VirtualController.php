<?php

namespace App\Admin\Controllers;

use App\Virtual;
use App\Http\Controllers\Controller;
use Encore\Admin\Controllers\HasResourceActions;
use Encore\Admin\Form;
use Encore\Admin\Grid;
use Encore\Admin\Layout\Content;
use Encore\Admin\Show;

class VirtualController extends Controller
{
    use HasResourceActions;

    /**
     * Index interface.
     *
     * @param Content $content
     * @return Content
     */
    public function index(Content $content)
    {
        return $content
            ->header('虚拟商品')
            ->description('列表')
            ->body($this->grid());
    }

    /**
     * Show interface.
     *
     * @param mixed $id
     * @param Content $content
     * @return Content
     */
    public function show($id, Content $content)
    {
        return $content
            ->header('Detail')
            ->description('description')
            ->body($this->detail($id));
    }

    /**
     * Edit interface.
     *
     * @param mixed $id
     * @param Content $content
     * @return Content
     */
    public function edit($id, Content $content)
    {
        return $content
            ->header('虚拟商品')
            ->description('编辑')
            ->body($this->form()->edit($id));
    }

    /**
     * Create interface.
     *
     * @param Content $content
     * @return Content
     */
    public function create(Content $content)
    {
        return $content
            ->header('虚拟商品')
            ->description('创建')
            ->body($this->form());
    }

    /**
     * Make a grid builder.
     *
     * @return Grid
     */
    protected function grid()
    {
        $grid = new Grid(new Virtual);
        $grid->name('商品');
        $grid->thumb('封面图')->image();
        $grid->price('面值');
        $grid->created_at('创建时间');


        return $grid;
    }

    /**
     * Make a show builder.
     *
     * @param mixed $id
     * @return Show
     */
    protected function detail($id)
    {
        $show = new Show(Virtual::findOrFail($id));



        return $show;
    }

    /**
     * Make a form builder.
     *
     * @return Form
     */
    protected function form()
    {
        $form = new Form(new Virtual);
        $form->text('name', '商品名');
        $form->image('thumb', '封面图')->uniqueName();
        $form->number('price', '面值');
        $form->text('type', '卡密类型')->help('填写卡密种类序号,例如:京东卡填1。所有序列号: 1京东E卡，2苏宁礼品卡，3携程，4唯品，5亚马逊，7_1优酷土豆会员卡密，7_2爱奇艺会员卡密，7_3搜狐，7_4腾讯，8乐次元，9中石化，10中石油，11沃尔玛，12滴滴，13良品铺子，14星巴克代金券，15肯德基电子卡，16 ofo共享单车月卡，17车点点洗车券，18 e袋洗卡密，19我买网代金券，20当当礼品卡，21网易礼品卡，22天猫代金券，23中百电子卡，24麦德龙电子购物卡，25屈臣氏代金券，26迪卡侬礼品卡，27家乐福购物卡，28麦当劳代金券，29哈根达斯代金券，30百草味电子代金券，31COAST通兑券，32元祖电子券，33歌帝梵电子券，34美团外卖代金券，35淘票票代金券，36必胜客代金券');

        return $form;
    }
}
