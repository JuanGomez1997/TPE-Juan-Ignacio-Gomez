<?php

class AuthHelper {

    public function checkLoggedIn() {
        
        if (session_status()!= PHP_SESSION_ACTIVE) {
            session_start();
        }
           
        
    } 
}