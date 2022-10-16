<?php
require_once './libs/smarty-4.2.1/libs/Smarty.class.php';

class GenreView {
    private $smarty;

    public function __construct() {
        $this->smarty = new Smarty(); 
    }

    function viewGender($genders){
        $this->smarty->assign('genders',$genders);
        $this->smarty->display('listofgenres.tpl');
    }
    //-------------------------------
    function viewGenrerBook($books){
        $this->smarty->assign('books',$books);
        $this->smarty->display('list_books _by_genre.tpl');
    }
    function viewNewGenrerBook(){
        $this->smarty->display('formGenre.tpl');
    }
    public function statusHello(){
        $this->smarty->assign('status','No se puede eliminar porque en este genero hay libros,si aun quiere eliminar este genero tendra que cambiar el genero y/o eliminar dichos libros');
        $this->smarty->display('succeed.tpl');
    }

}