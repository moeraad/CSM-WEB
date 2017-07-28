@foreach($items as $item)
@if(sizeof($item->children) != 0)
<div class="col-lg-2  col-md-2 col-sm-4 col-xs-6 hidden-sm hidden-xs">
    <h6>{{__("messages.".str_replace(" ", "_", strtolower($item->title)))}}</h6>
    <ul>
        @foreach($item->children as $child_item)
        <li><small><a href="{{$child_item->url}}">{{__("messages.".str_replace(" ", "_", strtolower($child_item->title)))}}</a></small></li>
        @endforeach
    </ul>
</div>
@endif
@endforeach

<div class="col-lg-4  col-md-4 col-sm-12 col-xs-12">
    <h3>{{__("messages.search_site")}} </h3>
    <ul>
        <li>

        <li><form id="s-lg-srch-form" class="pad-top-med" role="search" action="srch.php">
                <div class="form-group">
                    <label for="s-lg-srch-input-q" class="sr-only">{{__("messages.go")}}</label>
                    <div class="input-group">
                        <input type="text" id="s-lg-srch-input-q" name="q" class="form-control" value="" placeholder="{{__("messages.search_for")}}" aria-controls="s-lg-srch-content">
                        <span class="input-group-btn">
                            <button class="btn btn-default" type="submit">{{__("messages.go")}}</button>
                        </span>
                    </div>
                </div>
                <input type="hidden" name="group_id" id="group_id" value="0">
            </form>
    </ul>
    <!--    <ul class="social">
            <li> <a href="https://www.facebook.com/massasoitlib"> <i class=" fa fa-facebook">   </i> </a> </li>
            <li> <a href="https://twitter.com/massasoitlib"> <i class="fa fa-twitter">   </i> </a> </li>
    
        </ul>-->

</div>