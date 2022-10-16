<?php
    require_once './app/views/viewLibrary.php';
    require_once './app/models/modelBook.php';
    require_once './app/helpers/auth.helper.php';
    require_once './app/models/modelGenrebook.php';
    class controllerBook{
        private $view;
        private $modelBook;
        private $modelGenre;
        public function __construct(){
            $this->view=new LibraryView ();
            $this->modelBook=new BookModel();
            $this->modelGenre=new controllerGenreBook();
            $authHelper = new AuthHelper();
            $authHelper->checkLoggedIn();
        }
        public function showHome(){
            $this->view->Home();    
        }

        public function showLibrery(){
            $books=$this->modelBook->getLibrery();
            $this->view->libreryComplete($books);
        }
        public function seemore($id){
            $librerys=$this->modelBook->getDescrition($id);
            $this->view->description($librerys);
        }
        public function showBooks(){
            if (isset($_POST['busqueda'])) {
                if (empty($_POST['busqueda'])) {
                    echo 'Datos incompletos';
                    return;
                }
                $busqueda = $_POST ['busqueda'];
                $books=$this->modelBook->getBooks($busqueda);
                $this->view->viewBook($books);

            }
        }
        public function addBook(){
            if (isset($_SESSION['USER_ID'])) { 
                if (isset($_POST['nombre'])&&isset($_POST['autor'])&&isset($_POST['anio'])&&isset($_POST['descripcion'])&&isset($_POST['seleccion'])) {
                    if (empty($_POST['nombre'])||empty($_POST['autor'])||empty($_POST['anio'])||empty($_POST['descripcion'])||empty($_POST['seleccion'])) {
                        echo 'Datos incompletos';
                        return;
                    }
                    $nombre = $_POST ['nombre'];
                    $autor = $_POST['autor'];
                    $anio = $_POST['anio'];
                    $descripcion = $_POST['descripcion'];
                    $seleccion = $_POST['seleccion'];
                    
                    
                    $books=$this->modelBook->insertBook($nombre, $autor, $anio, $descripcion, $seleccion);
                    header("Location: " . BASE_URL."lista");
       
                }
                $genre=$this->modelBook->selectGenre();
                $this->view->viewSelecAddBook($genre);
            }
        }
        public function deleteBook($id){
            if (isset($_SESSION['USER_ID'])) {
                 $this->modelBook->deleteBookById($id);
                header("Location: " . BASE_URL."lista" );
            }
           

        }
        public function editBook($id){
            if (isset($_SESSION['USER_ID'])) {
                if (isset($_POST['nombre'])&&isset($_POST['autor'])&&isset($_POST['anio'])&&isset($_POST['descripcion'])&&isset($_POST['seleccion'])) {
                    if (empty($_POST['nombre'])&&empty($_POST['autor'])&&empty($_POST['anio'])&&empty($_POST['descripcion'])&&empty($_POST['seleccion'])) {
                        echo 'Datos incompletos';
                        return;
                    }
                    $nombre = $_POST ['nombre'];
                    $autor = $_POST['autor'];
                    $anio = $_POST['anio'];
                    $descripcion = $_POST['descripcion'];
                    $seleccion = $_POST['seleccion'];

                    
                    
                    $id=$this->modelBook->editLibrery($nombre, $autor, $anio, $descripcion, $seleccion,$id);
                    header("Location: " . BASE_URL."lista");
       
                }
                $genre=$this->modelBook->selectGenre();
                $this->view->viewSelecEdit($genre);
            }
        }
        public function availability($id){
            if (isset($_SESSION['USER_ID'])) {
                $this->modelBook->editAvailability(1,$id);
                header("Location: " . BASE_URL."lista");
            }
        }
        public function Noavailability($id){
            if (isset($_SESSION['USER_ID'])) {
                $this->modelBook->editAvailability(0,$id);
                header("Location: " . BASE_URL."lista");
            }
        }  
        
    }