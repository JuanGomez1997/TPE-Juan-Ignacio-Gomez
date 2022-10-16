<?php
    class GenreBookModel{
        private $db;

        public function __construct() {
            $this->db = new PDO('mysql:host=localhost;'.'dbname=db_biblioteca;charset=utf8', 'root', '');
        }
        public function getGenre(){
            $querry = $this->db->prepare("SELECT * FROM genero");
            $querry->execute();
            $books = $querry->fetchAll(PDO::FETCH_OBJ);
            return $books;
        }
        public function getDescrition($id_genero){
            $querry = $this->db->prepare("SELECT * FROM libros JOIN genero ON libros.id_genero=genero.id_genero WHERE genero.id_genero=?");
            $querry->execute([$id_genero]);
            $books = $querry->fetchAll(PDO::FETCH_OBJ);
            return $books;
        }

        public function insertGenre($genero){
            $query=$this->db->prepare("INSERT INTO genero (genero) VALUES (?)");
            $query->execute([$genero]);
            return $this->db->lastInsertId();
        }
        public function editGenreById($genero,$id_genero){
            $query = $this->db->prepare("UPDATE genero SET genero=? WHERE (genero.id_genero=?)");
            $query->execute([$genero,$id_genero]);
            
        }
        
        public function deleteGenrekById($id_genero){
            $query = $this->db->prepare('DELETE FROM genero WHERE id_genero = ?');
            $query->execute([$id_genero]);
        }
        
    }