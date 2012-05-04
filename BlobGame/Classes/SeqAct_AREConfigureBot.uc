class SeqAct_AREConfigureBot extends SequenceAction;
 
var() object Target;
var() float MaxFireRange;
var() object PatrolStart;
var() object PatrolEnd;
 
defaultproperties
{
  ObjName="Configure a BlobBot"
  ObjCategory="Blob"
  HandlerName = "AREConfigureBot"
 
  target = None
  MaxFireRange = 256
  PatrolStart = None
  PatrolEnd = None
 
  VariableLinks(1)=(ExpectedType=class'SeqVar_Object', LinkDesc="Firing Target", bWriteable=true, PropertyName=Target)
  VariableLinks(2)=(ExpectedType=class'SeqVar_Float', LinkDesc="Max. Fire Range", bWriteable=true, PropertyName=MaxFireRange)
  VariableLinks(3)=(ExpectedType=class'SeqVar_Object', LinkDesc="Patrol Start", bWriteable=true, PropertyName=PatrolStart)
  VariableLinks(4)=(ExpectedType=class'SeqVar_Object', LinkDesc="Patrol End", bWriteable=true, PropertyName=PatrolEnd)
}