<?php

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

Route::get('/', "HomeController@index");


Route::group(['prefix' => 'admin'], function () {
    Voyager::routes();
});

Auth::routes();

Route::group( ['middleware' => 'auth' ], function()
{
    Route::get('/circulars_of_the_council',"PagesController@circulars_of_the_council");
    Route::get('/decisions_of_the_council',"PagesController@decisions_of_the_council");
    Route::get('/advisory_bodies',"PagesController@advisory_bodies");
    Route::get('/court_statistics',"PagesController@court_statistics");
    Route::get('/decree_of_judicial_formations',"PagesController@decree_of_judicial_formations");
    Route::get('/business_distribution_decisions',"PagesController@business_distribution_decisions");
    Route::get('/judicial_assignments',"PagesController@judicial_assignments");
});

Route::get('/home', 'HomeController@index')->name('home');

/*pages routes*/
Route::get('/his_authorship',"PagesController@his_authorship");
Route::get('/duties',"PagesController@duties");
Route::get('/president',"PagesController@president");
Route::get('/vice_president',"PagesController@vice_president");
Route::get('/former_presidents',"PagesController@former_presidents");
Route::get('/ethics_of_judges',"PagesController@ethics_of_judges");
Route::get('/make_a_complaint',"PagesController@make_a_complaint");
Route::get('/disciplinary_board_of_judges',"PagesController@disciplinary_board_of_judges");
Route::get('/supreme_authority_for_discipline',"PagesController@supreme_authority_for_discipline");
Route::get('/media_data',"PagesController@media_data");
Route::get('/press_interviews',"PagesController@press_interviews");
Route::get('/press_articles',"PagesController@press_articles");
Route::get('/journey_to_the_heart_of_justice',"PagesController@journey_to_the_heart_of_justice");
Route::get('/president_word',"PagesController@president_word");

