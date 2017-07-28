@extends('layouts.app')

@section('content')
<h1>{{__("messages.president_word")}}</h1>
<hr/>
<div class="row">
    <ul class="nav">
        @foreach($files as $file)
        <li>
            <div class="panel panel-default">
                <div class="panel-body">
                    <div class="media">
                        <div class="media-body">
                            <h4 class="media-heading text-primary flip pull-left">{{$file->title}}</h4><small class="flip pull-right">{{$file->created_at}}</small>
                            <div class="clearfix"></div>
                            <div class="clearfix">
                                {{$file->description}}
                            </div>
                            <small class="flip pull-right"><a href="{{env('APP_URL') . "/storage/" . $file->file}}">download</a></small>
                        </div>
                    </div>
                </div>
            </div>
        </li>
        @endforeach
    </ul>
</div>
@endsection
