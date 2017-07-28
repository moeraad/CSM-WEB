<?php

namespace App\Http\Controllers;

use TCG\Voyager\Models\Page;

class PagesController extends Controller
{
    function his_authorship()
    {
        $page = Page::where("slug","his_authorship")->first();
        return view("page",compact("page"));
    }
    
    function duties()
    {
        $page = Page::where("slug","duties")->first();
        return view("page",compact("page"));
    }
    
    function president()
    {
        $page = Page::where("slug","president")->first();
        return view("page",compact("page"));
    }
    
    function president_word()
    {
        $page = Page::where("slug","president_word")->first();
        $files = \App\File::where("page_id",$page->id)->orderBy("created_at","desc")->get();
        
        return view("president_word",compact("page","files"));
    }
    
    function media_data()
    {
        $page = Page::where("slug","media_data")->first();
        $files = \App\File::where("page_id",$page->id)->orderBy("created_at","desc")->get();
        
        return view("media_data",compact("page","files"));
    }
    
    function vice_president()
    {
        $page = Page::where("slug","vice_president")->first();
        return view("page",compact("page"));
    }
    
    function former_presidents()
    {
        $gallery = \App\Gallery::all();
        return view("gallery",compact("gallery"));
    }
    
    function ethics_of_judges()
    {
        $page = Page::where("slug","ethics_of_judges")->first();
        return view("page",compact("page"));
    }
    
    function make_a_complaint()
    {
        $page = Page::where("slug","make_a_complaint")->first();
        return view("page",compact("page"));
    }
    
    function disciplinary_board_of_judges()
    {
        $page = Page::where("slug","disciplinary_board_of_judges")->first();
        return view("page",compact("page"));
    }
    
    function supreme_authority_for_discipline()
    {
        $page = Page::where("slug","supreme_authority_for_discipline")->first();
        return view("page",compact("page"));
    }
    
    function press_interviews()
    {
        $page = Page::where("slug","press_interviews")->first();
        return view("page",compact("page"));
    }
    
    function press_articles()
    {
        $page = Page::where("slug","press_articles")->first();
        return view("page",compact("page"));
    }
    
    function circulars_of_the_council()
    {
        $page = Page::where("slug","circulars_of_the_council")->first();
        return view("page",compact("page"));
    }
    
    function decisions_of_the_council()
    {
        $page = Page::where("slug","decisions_of_the_council")->first();
        return view("page",compact("page"));
    }
    
    function advisory_bodies()
    {
        $page = Page::where("slug","advisory_bodies")->first();
        return view("page",compact("page"));
    }
    
    
    function court_statistics()
    {
        $page = Page::where("slug","court_statistics")->first();
        return view("page",compact("page"));
    }
    
    function decree_of_judicial_formations()
    {
        $page = Page::where("slug","decree_of_judicial_formations")->first();
        return view("page",compact("page"));
    }
    
    function business_distribution_decisions()
    {
        $page = Page::where("slug","business_distribution_decisions")->first();
        return view("page",compact("page"));
    }
    
    function judicial_assignments()
    {
        $page = Page::where("slug","judicial_assignments")->first();
        return view("page",compact("page"));
    }
    
    function journey_to_the_heart_of_justice()
    {
        $page = Page::where("slug","journey_to_the_heart_of_justice")->first();
        return view("page",compact("page"));
    }
}
