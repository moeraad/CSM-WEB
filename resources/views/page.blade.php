@extends('layouts.app')

@section('content')
    @if(sizeof($page)!=0)
        <h1>{{$page->title}}</h1>
        <hr/>
        <p>
            @if($page->image!=null)
            <div class="thumbnail pull-right" style="margin: 0 0 10px 10px;">
                <img class="img-responsive" src="{{env('APP_URL') . "/storage/" . $page->image}}" style="max-width: 300px"/>
            </div>
            @endif
            {!!$page->body!!}
        </p>
        
    @else
        <h1>page do not exist</h1>
    @endif
@endsection
