<?php
    require_once './app/controllers/controllerBook.php';
    require_once './app/controllers/controllerGenrebook.php';
    require_once './app/controllers/auth.controller.php';


    define('BASE_URL', '//'.$_SERVER['SERVER_NAME'] . ':' . $_SERVER['SERVER_PORT'] . dirname($_SERVER['PHP_SELF']).'/');


    $action = 'home'; 
    if (!empty($_GET['action'])) {
        $action = $_GET['action'];
    }

    $params = explode('/', $action);
    $bookController = new controllerBook();
    $controllerGenreBook= new controllerGenreBook();
    $AuthController = new AuthController();


    // tabla de ruteo
    switch ($params[0]) {
        case 'sesion':
            $AuthController->showFormLogin();
            break;
        case 'validacion':
            $AuthController->validateUser();
            break;
        case 'cierresesion':
            $AuthController->logout();
            break; 
        case 'home':
            $bookController->showHome();
            break;
        case 'lista':
            $bookController->showLibrery();
            break;
        case 'vermas':
            $id=$params[1];
            $bookController->seemore($id);
            break;
        case 'buscador':
            $bookController->showBooks();
            break;
        case 'listadogeneros':
            $controllerGenreBook->showGender();
            break;
        case 'librosporgenero':
            $id_genero=$params[1];
            $controllerGenreBook->seemoreGenreBook($id_genero);
            break;
        case 'agregarlibro':
            $bookController-> addBook();
            break;
        case 'agregargenero':
            $controllerGenreBook->addGenre();
            break;
        case 'eliminarlibro':
            $id=$params[1];
            $bookController->deleteBook($id);
           break;
        case 'editarlibro':
            $id=$params[1];
            $bookController->editBook($id);
            break; 
        case 'editargenero':
            $id_genero=$params[1];
            $controllerGenreBook->editGenre($id_genero);
            break; 
        case 'eliminargenero':
            $id_genero=$params[1];
            $controllerGenreBook->deleteGenre($id_genero);
            break; 
        case 'editardisponibilidad':
            $id=$params[1];
            $bookController->availability($id);
            break;
        case 'editarNodisponibilidad':
            $id=$params[1];
            $bookController->Noavailability($id);
            break;
        default:
            echo('404 Page not found');
            break;
    }
