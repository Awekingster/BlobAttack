/**
 *	BlobGameInfo
 *
 *	Creation date: 15/04/2012 14:26
 *	Copyright 2012, thedeadmanafterlife
 */
class BlobGameInfo extends UTGame;

DefaultProperties
{
    MapPrefixes(0)="ARE"
    DefaultPawnClass=Class'BlobGame.BlobPawn'
    PlayerControllerClass=Class'BlobGame.BlobPlayerController'
    BotClass=class'BlobGame.BlobBot'
    HUDType=class'BlobGame.BlobHUD'
 
    bUseClassicHUD = true
 
    DefaultInventory(0)=class'UTWeap_RocketLauncher_Content'
	
}