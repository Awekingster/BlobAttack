class BlobHUD extends UTHUD;

function DrawHealthBar(float percentFull)
 {
    local int currentBarWidth;
    local int maxBarWidth;
    local int barHeight;
    local int barPositionX;
    local int barPositionY;
    local int healthPct;
 
    maxBarWidth = 300;
    barHeight = 20;
    barPositionX = 20;
    barPositionY = 20;
    healthPct = percentFull * 100;
 
    currentBarWidth = maxBarWidth * percentFull;
 
        // Draw the "filled" part of the bar
    Canvas.SetPos(barPositionX, barPositionY);        // X, Y position
    Canvas.SetDrawColor(80, 200, 80, 200);    // R, G, B, A for bar rectangle
    Canvas.DrawRect(currentBarWidth, barHeight);
 
        // Draw the empty part of the bar
    Canvas.SetPos(barPositionX + currentBarWidth, barPositionY);
    Canvas.SetDrawColor(200, 255, 200, 110);
    Canvas.DrawRect(maxBarWidth - currentBarWidth, barHeight);
 
        // Draw some text next to the bar
    Canvas.SetPos(barPositionX + maxBarWidth + 10, barPositionY);
    Canvas.SetDrawColor(0, 200, 0, 200);
    Canvas.Font = class'Engine'.static.GetMediumFont();
    Canvas.DrawText("Health: "$healthPct$"%");
 }
 
 function DrawString(string text, int X, int Y, int R, int G, int B, int A)
 {
        Canvas.SetPos(X, Y);
    Canvas.SetDrawColor(R, G, B, A);
    Canvas.Font = class'Engine'.static.GetMediumFont();
    Canvas.DrawText(text);
 }
 
 function DrawGameHud()
 {
    local BlobPlayerController PC;
 
    // Type cast the PlayerOwner property of the HUD to BlobPlayerController
    PC = BlobPlayerController(PlayerOwner);
 
    if (!PlayerOwner.IsDead())
    {
           // Display health bar only when the player hasn't died
           if(PlayerOwner.Pawn.HealthMax > 0)
           {
             DrawHealthBar(float(PlayerOwner.Pawn.Health) / float(PlayerOwner.Pawn.HealthMax));
           }
    }
 
        // Always display other information
    DrawString("Coins: "$PC.ARECoinsCollected$"/"$PC.ARECoinsNeededThisLevel,20,40,140,80,0,200);
    DrawString("Score: "$PC.AREPoints,20,60,0,80,160,200);
 }
 
 defaultproperties
 {
   bCrosshairShow=false
 }