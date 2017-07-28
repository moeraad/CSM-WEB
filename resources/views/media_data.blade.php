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
                            <h4 class="media-heading text-primary flip pull-left"><a href="{{env('APP_URL') . "/storage/" . $file->file}}"><i class="glyphicon glyphicon-download-alt"></i></a> {{$file->title}}</h4><small class="flip pull-right">{{$file->created_at}}</small>
                        </div>
                    </div>
                </div>
            </div>
        </li>
        @endforeach
    </ul>
</div>
@endsection
