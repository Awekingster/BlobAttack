class SeqAct_ARESetCoinsNeeded extends SequenceAction;
 
var() int NumCoins;
 
DefaultProperties
 {
    ObjName="Set Coins Needed"
        ObjCategory="BlobCoin"
    HandlerName="SetCoinsNeeded"
    NumCoins = 0
    VariableLinks(1)=(ExpectedType=class'SeqVar_Int', LinkDesc="NumCoins", bWriteable=true, PropertyName=NumCoins)
 }