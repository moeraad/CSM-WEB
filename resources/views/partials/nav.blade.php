<ul class="nav navbar-nav">
    @foreach($items as $item)
        @if(sizeof($item->children) == 0)
            <li><a href="{{$item->url}}">{{__("messages.".str_replace(" ", "_", strtolower($item->title)))}}</a></li>
            <?php
            
            ?>
        @else
            <li class="dropdown">
                <a href="{{$item->url}}" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">{{__("messages.".str_replace(" ", "_", strtolower($item->title)))}} <span class="caret"></span></a>
                <ul class="dropdown-menu">
                    @foreach($item->children as $child_item)
                    <li><a href="{{$child_item->url}}">{{__("messages.".str_replace(" ", "_", strtolower($child_item->title)))}}</a></li>
                    @endforeach
                </ul>
            </li>
        @endif
    @endforeach
</ul>