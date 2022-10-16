<?php
    class BookModel{
        private $db;

        public function __construct() {
            $this->db = new PDO('mysql:host=localhost;'.'dbname=db_biblioteca;charset=utf8', 'root', '');
        }
        public function getLibrery(){
            $query = $this->db->prepare("SELECT * FROM libros JOIN genero ON libros.id_genero=genero.id_genero");
            $query->execute();
            $books = $query->fetchAll(PDO::FETCH_OBJ);
            return $books;
        }
        public function getDescrition($id){
            $query = $this->db->prepare("SELECT * FROM libros JOIN genero ON libros.id_genero=genero.id_genero WHERE id=?");
            $query->execute([$id]);
            $books = $query->fetchAll(PDO::FETCH_OBJ);
            return $books;
        }


        public function getBooks($nombre){
            $query = $this->db->prepare("SELECT * FROM libros JOIN genero ON libros.id_genero=genero.id_genero WHERE nombre LIKE ?");
            $query->execute(['%'.$nombre.'%']);
            $books = $query->fetchAll(PDO::FETCH_OBJ);
            return $books;
        }
//----------------------------------------
        public function selectGenre(){
            $query = $this->db->prepare("SELECT * FROM genero");
            $query->execute();
            $books = $query->fetchAll(PDO::FETCH_OBJ);
            return $books;
        }


        public function insertBook($nombre, $autor, $anio, $descripcion, $id_genero){
            $query=$this->db->prepare("INSERT INTO libros (nombre, autor, anio, descripcion, id_genero, disponibilidad) VALUES (?, ?, ?, ?, ?, ?)");
            $query->execute([$nombre, $autor, $anio, $descripcion, $id_genero, true]);
            return $this->db->lastInsertId();
        }
        public function deleteBookById($id){
            $query = $this->db->prepare('DELETE FROM libros WHERE id = ?');
            $query->execute([$id]);
        }
        
        public function editLibrery($nombre,$autor,$anio,$descripcion,$id_genero,$id){ //saque la disponibilidad
            $query = $this->db->prepare("UPDATE libros SET nombre=?, autor=?, anio=?, descripcion=?, id_genero=? WHERE (libros.id=?)");
            $query->execute([$nombre,$autor,$anio,$descripcion,$id_genero,$id]);
            
        }
        public function editAvailability($disponibilidad,$id){ //saque la disponibilidad
            $query = $this->db->prepare("UPDATE libros SET disponibilidad=? WHERE id=?");
            $query->execute([$disponibilidad,$id]);
            
        }

    }