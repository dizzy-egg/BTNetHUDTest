class HUDMutator extends Mutator;

function preBeginPlay() {
	// then you have a mutator that replaces the existing nexgenhud with your custom one, and sets the owner to the owner of the existing hud, which should be the nexgenclient
	// then on that client you set the hud reference to the new one
}

// All actors call this function when spawned
function bool CheckReplacement(Actor SomeActor, out byte bSuperRelevant) {
	if (SomeActor.IsA('NexgenHUD')) {
		Log("Replacing NexgenHUD with DizzyHUD");
		ReplaceWith(SomeActor, "BTNetHUDTest.DizzyHUD");
		return False;
	}
}

simulated function Tick(float delta) {
	if (Level.NetMode == NM_DedicatedServer) {
		Disable('Tick');
	} else {
		RegisterHUDMutator();
	}
}

defaultproperties {
	bAlwaysRelevant=True
	bNetTemporary=True
	RemoteRole=Role_SimulatedProxy 
}