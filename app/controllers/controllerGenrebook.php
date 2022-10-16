<?php
    require_once './app/views/viewGenreBook.php';
    require_once './app/models/modelGenrebook.php';
    require_once './app/helpers/auth.helper.php';
    class controllerGenreBook{
        private $viewGenre;
        private $modelGenre;
        public function __construct(){
            $this->viewGenre=new GenreView ();
            $this->modelGenre=new GenreBookModel();
            $authHelper = new AuthHelper();
            $authHelper->checkLoggedIn();
        }

        public function showGender(){
            $books=$this->modelGenre->getGenre();
            $this->viewGenre->viewGender($books);
        }
        public function seemoreGenreBook($id_genero){
            $librerys=$this->modelGenre->getDescrition($id_genero);
            $this->viewGenre->viewGenrerBook($librerys);
        }
        public function addGenre(){
            if (isset($_SESSION['USER_ID'])) {
                if (isset($_POST['genero'])) {
                    if (empty($_POST['genero'])) {
                        echo 'Datos incompletos';
                        return;
                    }
                    $genero = $_POST ['genero'];  
                    $books=$this->modelGenre->insertGenre($genero);
                    header("Location: " . BASE_URL."listadogeneros");
       
                }
                $this->viewGenre->viewNewGenrerBook();
            }
        }
        public function editGenre($id_genero){
            if (isset($_SESSION['USER_ID'])) {
                if (isset($_POST['genero'])) {
                    if (empty($_POST['genero'])) {
                        echo 'Datos incompletos';
                        return;
                    }
                    $genero = $_POST ['genero'];  
                    $id_genero=$this->modelGenre->editGenreById($genero,$id_genero);
                    header("Location: " . BASE_URL."listadogeneros");
       
                }
                $this->viewGenre->viewNewGenrerBook();
            }
        }

        public function deleteGenre($id_genero){
            if (isset($_SESSION['USER_ID'])) {
                try{
                    $this->modelGenre->deleteGenrekById($id_genero);
                    header("Location: " . BASE_URL."listadogeneros" );
                }catch(Exception $e){
                   $this->viewGenre->statusHello($e);
                }
                
            }
           

        }
        
    }