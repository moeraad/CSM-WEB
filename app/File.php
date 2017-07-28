<?php

namespace App;

use Illuminate\Database\Eloquent\Model;


class File extends Model
{
    public function pageId(){
        return $this->belongsTo(\TCG\Voyager\Models\Page::class);
    }
}
