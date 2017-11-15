class DizzyHUD extends NexgenHUD;

function PreBeginPlay() {

	local NexgenHUD OldHUD;
	local Byte B;

	Log("DizzyHUD loaded");

	// Go through all actors in the level
	// May be unnecessary
	foreach AllActors(class'NexgenHUD', OldHUD) {
		CheckReplacement(OldHUD, B);
	}

}

simulated function renderMessage(Canvas c, float x, float y, MessageInfo msg) {
	Log("Called renderMessage");
}
