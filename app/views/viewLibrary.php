<?php
require_once './libs/smarty-4.2.1/libs/Smarty.class.php';

class LibraryView {
    private $smarty;

    public function __construct() {
        $this->smarty = new Smarty(); 
    }

    public function Home() {
        $this->smarty->display('home.tpl');
    }

    public function libreryComplete($books){
        $this->smarty->assign('count',count($books));
        $this->smarty->assign('books',$books);
        $this->smarty->display('completeList.tpl');
    }
    public function description($librerys){
        $this->smarty->assign('librerys',$librerys);
        $this->smarty->display('seemore.tpl');
    }
    public function viewBook($books){
        $this->smarty->assign('books',$books);
        $this->smarty->display('searchNav.tpl');
    }
    public function viewSelecAddBook($genders){
        $this->smarty->assign('genders',$genders);
        $this->smarty->display('formAdd.tpl');
    }

    public function viewAddBook($books){
        $this->smarty->assign('books',$books);
        $this->smarty->display('listaddbook.tpl');
    }
    public function viewSelecEdit($genders){
        $this->smarty->assign('genders',$genders);
        $this->smarty->display('formEdit.tpl');
    }
    

}