<?php
require_once './app/views/auth.view.php';
require_once './app/models/user.model.php';

class AuthController {
    private $view;
    private $model;
    
    public function __construct() {
        $this->model = new UserModel();
        $this->view = new AuthView();
    }

    public function showFormLogin() {
        $this->view->showFormLogin();
    }
    public function validateUser() {
        if (isset($_POST['usuario']) && isset($_POST['contrasenia'])) {
            if (empty($_POST['usuario']) || empty($_POST['contrasenia'])) {
                echo 'Datos incompletos';
                return;
            }
            $usuario = $_POST['usuario'];
            $contrasenia = $_POST['contrasenia'];
            $user = $this->model->getUserByUser($usuario);
            if ($user && password_verify($contrasenia, $user->contrasenia)) {
                session_start();
                $_SESSION['USER_ID'] = $user->id;
                $_SESSION['USER_USER'] = $user->usuario;
                $_SESSION['IS_LOGGED'] = true;

                header("Location: " . BASE_URL);
            } else {
               $this->view->showFormLogin("El usuario o la contraseña no existe.");
            } 

        }        
    }
    public function logout() {
        session_start();
        session_destroy();
        header("Location: " . BASE_URL. 'sesion');
    }

}