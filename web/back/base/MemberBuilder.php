<?php
class MemberBuilder{
    private $articleRepo;
    private $RecordRepo;
    private $PayItemRepo;
    private $memberRepo;
    public function __construct($memberRepo,$articleRepo,$RecordRepo,$PayItemRepo){
        $this->memberRepo = $memberRepo;
        $this->articleRepo = $articleRepo;
        $this->RecordRepo = $RecordRepo;
        $this->PayItemRepo = $PayItemRepo;
    }
    public function Build($uid){
        $member = $this->memberRepo->find($uid);
        $member->articles = $this->articleRepo->findAll($uid);
        $member->paymentRecords =  $this->RecordRepo->findAll($uid);
        $payitem = $this->PayItemRepo;
        foreach($member->paymentRecords as $record){
            
            $record->items = $payitem->findAll($record->id);
            $record->getTotal();
        }
        $member->getTotalpaied();
        $member->getTotalUnPay();

        return $member;
    }
}