<?php

namespace App;
use System\Database\ORM\Model;
use System\Database\Traits\HasSoftDelete;

class Gallery extends Model
{
    use HasSoftDelete;

    public $table="galleries";
    public $fillable=['image','advertise_id'];
    public $deletedAt="deleted_at";

}