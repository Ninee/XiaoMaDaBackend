<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>活动详情</title>
    <link rel="stylesheet" href="{{ asset('css/base.css') }}">
    <link rel="stylesheet" href="{{ asset('css/weui.css') }}">
    <link rel="stylesheet" href="{{ asset('css/weuix.css') }}">
    <link rel="stylesheet" href="{{ asset('css/app.css') }}">
    <script src="{{ asset('js/main.js') }}"></script>
    <style>
        .weui-panel__hd {
            color: #ef4f4f;
        }
        .weui-panel__hd:after {
            border-bottom: 2px solid #ef4f4f;
        }
        .tips {
            margin: 0.1333rem;
        }
        .p-tag {
            margin: 0.1333rem;
        }
        .weui-media-box__desc{
            line-height: 18px;
        }
    </style>
</head>
<body>
<div class="app-content">
    <section class="header">
        <div class="page-hd">
            <h1 class="page-hd-title">
                {{ $article->title }}
            </h1>
            <p class="page-hd-desc">{{ $article->sub_title }}</p>
        </div>
    </section>
    <section class="contents">
        <div class="weui-content">
            <div class="weui-c-inner">
                <div class="weui-c-content">
                    {{--<h2 class="weui-c-title">这是个大标题</h2>--}}
                    <!-- <div class="weui-c-meta">
                        <span class="weui-c-nickname"><a href="javascript:;">Yoby开发者</a></span>
                        <em class="weui-c-nickname">2018-10-10 10:10</em>
                    </div> -->
                    <div class="weui-c-article">
                        {!! $article->content !!}
                    </div>
                </div>
                {{--<div class="weui-c-tools">--}}
                    {{--<a href="javascript:;">阅读原文</a>--}}
                    {{--<div class="weui-c-readnum">阅读<span id="readnum">10万+</span></div>--}}

                {{--</div>--}}
            </div>
        </div>
    </section>

</div>
</body>
</html>