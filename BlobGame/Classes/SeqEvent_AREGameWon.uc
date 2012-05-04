class SeqEvent_AREGameWon extends SequenceEvent;
 
event Activated(){
       `log("IN SeqEvent_AREGameWon Activated()");
}
 
defaultproperties
{
    ObjName="Blob Game Won"
    ObjCategory="BlobGame"
        bPlayerOnly = false
}