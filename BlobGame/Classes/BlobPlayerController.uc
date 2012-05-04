/**
 *	BlobPlayerController
 *
 *	Creation date: 15/04/2012 14:43
 *	Copyright 2012, thedeadmanafterlife
 */
class BlobPlayerController extends UTPlayerController
		dependson(SeqAct_AREGivePoints)
        dependson(SeqAct_ARESetCoinsNeeded)
        dependson(SeqAct_ARECollectCoin);

  var() int AREPoints;
  var() int ARECoinsCollected;
  var() int ARECoinsNeededThisLevel;

exec function TestWinningConditions()
{
	 local int i;
   local Sequence GameSeq;
   local array<SequenceObject> AllSeqEvents;
   
  `log("TestWinningConditions() : Checking winning conditions");
  `log("TestWinningConditions() : Collected: "$ARECoinsCollected);
  `log("TestWinningConditions() : Needed: "$ARECoinsNeededThisLevel);
 
  if(ARECoinsCollected > 0 && ARECoinsNeededThisLevel > 0 && ARECoinsCollected >= ARECoinsNeededThisLevel)
  {
       `log("TestWinningConditions() : Victory!");
	   GameSeq = WorldInfo.GetGameSequence();
	   if(GameSeq != None)
       {
               GameSeq.FindSeqObjectsByClass(class'SeqEvent_AREGameWon', true, AllSeqEvents);
               for(i=0; i<AllSeqEvents.Length; i++)
                       SeqEvent_AREGameWon(AllSeqEvents[i]).CheckActivate(WorldInfo, None);
       }
  }
  else
  {
       `log("TestWinningConditions() : Go collect more coins!");
  }
}

function CollectCoin(SeqAct_ARECollectCoin MyAction)
{
  `log("CollectCoin() : Collected coin");
  ARECoinsCollected += 1;
  TestWinningConditions();
}
function SetCoinsNeeded(SeqAct_ARESetCoinsNeeded MyAction)
{
  `log("SetCoinsNeeded() : Set needed coins to "$MyAction.NumCoins);
  ARECoinsNeededThisLevel = MyAction.NumCoins;
}
function AddPoints(SeqAct_AREGivePoints MyAction)
{
  `log("AddPoints() : Adding points: "$MyAction.NumPoints);
  AREPoints += MyAction.NumPoints;
}

state PlayerWalking
{
ignores SeePlayer, HearNoise, Bump;

   function ProcessMove(float DeltaTime, vector NewAccel, eDoubleClickDir DoubleClickMove, rotator DeltaRot)
   {
      if( Pawn == None )
      {
         return;
      }

      if (Role == ROLE_Authority)
      {
         // Update ViewPitch for remote clients
         Pawn.SetRemoteViewPitch( Rotation.Pitch );
      }

      Pawn.Acceleration = NewAccel;

      CheckJumpOrDuck();
   }
}

function UpdateRotation( float DeltaTime )
{
   local Rotator   DeltaRot, newRotation, ViewRotation;

   ViewRotation = Rotation;
   if (Pawn!=none)
   {
      Pawn.SetDesiredRotation(ViewRotation);
   }

   // Calculate Delta to be applied on ViewRotation
   DeltaRot.Yaw   = PlayerInput.aTurn;
   DeltaRot.Pitch   = 0;

   ProcessViewRotation( DeltaTime, ViewRotation, DeltaRot );
   SetRotation(ViewRotation);

   NewRotation = ViewRotation;
   NewRotation.Roll = Rotation.Roll;

   if ( Pawn != None )
      Pawn.FaceRotation(NewRotation, deltatime);
}   

defaultproperties
{
AREPoints = 0
ARECoinsCollected = 0
ARECoinsNeededThisLevel = 10
}