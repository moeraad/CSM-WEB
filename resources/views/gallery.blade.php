@extends('layouts.app')

@section('content')
<h1>{{__("messages.former_presidents")}}</h1>
<div class="row">
    @foreach($gallery as $image)
    <div class="col-sm-6 col-md-4"> 
        <div class="thumbnail text-center"> 
            <img alt="{{$image->name}}" src="{{env('APP_URL') . "/storage/" . $image->image}}" style="height: 300px; display: block;"> 
            <div class="caption"> 
                <h3>{{$image->name}} <br/><small>[{{$image->period}}]</small></h3> 
            </div> 
        </div> 
    </div>
    @endforeach
</div>
@endsection
