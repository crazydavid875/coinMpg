<?php 
    class Receipt{
        public $id;
        public $dist;
        public $uid;
        public $datetime;
        public $articleTitle;
        public $total;
        public function __construct($data){
            if(isset($data['id'])){
                $this->id = $data['id'];
            }
            if(isset($data['dist'])){
                $this->dist = $data['dist'];
            }
            if(isset($data['uid'])){
                $this->uid = $data['uid'];
            }
            if(isset($data['datetime'])){
                $this->datetime = $data['datetime'];
            }
            if(isset($data['articleTitle'])){
                $this->articleTitle = $data['articleTitle'];
            }
            if(isset($data['total'])){
                $this->total = $data['total'];
            }
            
        }
    }
?>