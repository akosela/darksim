// ================================================================================
// RSD: Fixes melee AI endlessly chasing the player and never attacking
class rsdMonsterChaseFix extends SqRootScript {
	static rageMax = 12;
	arch = 0;
	CombatDist = vector();
	
	function OnBeginScript() {
		StartRage();
	}
	
	function OnEndScript() {
		KillRage();
	}
	
	function OnSlain() {
		KillRage();
	}
	
	function OnStartAttack() {
		ResetRage();
	}
	
	function OnEndAttack() {
		ResetRage();
	}
	
	function OnTimer() {
		if (message().name == "RageTimer") {
			IterateRage();
		}
	}
	
	function StartRage() {
		if (GetProperty("AI_Mode") != 5) { //5 is "Dead" enum
			SetData("RageTimer",SetOneShotTimer("RageTimer",Data.RandFlt0to1()*1.0)); //Don't want all AI doing this at the same time
			SetData("monsterRage",0);
			arch = Object.Archetype(self);
			CombatDist = Property.Get(arch,"HTHCombatDist");
		}
	}
	
	function IterateRage() {
		if (GetProperty("AI_Mode") != 5) { //5 is "Dead" enum
			if (AI.GetAlertLevel(self) == eAIScriptAlertLevel.kHighAlert) {
				if (Property.Possessed(arch,"HTHCombatDist")) {
					local rage = GetData("monsterRage");
					if (rage == null) {
						rage = 0;
					}
					local player = Networking.FirstPlayer();
					local playerRelPos = Object.WorldToObject(self,Object.Position(player));
					if ((fabs(playerRelPos.x) < fabs(CombatDist.y)) && (fabs(playerRelPos.y) < fabs(CombatDist.x)) && (fabs(playerRelPos.z) < fabs(CombatDist.z))) {
						rage++;
						if (rage >= rageMax) {
							rage = rageMax;
						}
						SetData("monsterRage",rage);
						local dist = vector(CombatDist.x,CombatDist.y,CombatDist.z);
						dist.y *= (1.0+1.0*rage.tofloat());
						Property.SetSimple(self,"HTHCombatDist",dist);
					}
				}
			}
			SetData("RageTimer",SetOneShotTimer("RageTimer",0.1));
		}
		else {
			KillRage();
		}
	}
	
	function ResetRage() {
		local arch = Object.Archetype(self);
		if (Property.Possessed(arch,"HTHCombatDist")) {
			local rage = 0;
			local dist = vector(CombatDist.x,CombatDist.y,CombatDist.z);
			// ShockGame.AddText(rage,"Player");
			SetData("monsterRage",rage);
			dist.y *= (1.0+1.0*rage.tofloat());
			Property.SetSimple(self,"HTHCombatDist",dist);
		}
	}
	
	function KillRage() {
		if (IsDataSet("RageTimer")) {
			KillTimer(GetData("RageTimer"));
		}
		ClearData("monsterRage");
	}
}

// ================================================================================
// RSD: Fixes midwife never being able to hit crouching player
class rsdMidwifeCrouchFix extends rsdMonsterChaseFix {
	function OnStartAttackRanged() {
		ResetRange();
	}
	
	function OnEndAttackRanged() {
		ResetRange();
	}
	
	function OnEndAttackMelee() {
		if (GetData("bCrouchAttack")) {
			CrouchAttack();
		}
	}
	
	function CrouchAttack() {
		local player = Networking.FirstPlayer();
		local bCrouching = Property.Get(player,"AI_Visibility","Exposure Rating") < -2; //hack from NVScript source
		if (bCrouching) {
			local playerRelPos = Object.WorldToObject(self,Object.Position(player));
			if ((fabs(playerRelPos.x) < fabs(CombatDist.y)) && (fabs(playerRelPos.y) < fabs(CombatDist.x)) && (fabs(playerRelPos.z) < fabs(CombatDist.z))) {
				local flags = 0;
				flags = rsd.setBitFlag(flags,0); //PRJ_FLG_ZEROVEL
				Physics.LaunchProjectile(self,"Midwife Spike Proj",1.0,flags,vector());
			}
		}
		SetData("bCrouchAttack",false);
	}
	
	function IterateRage() {
		if (GetProperty("AI_Mode") != 5) { //5 is "Dead" enum
			if (AI.GetAlertLevel(self) == eAIScriptAlertLevel.kHighAlert) {
				if (Property.Possessed(arch,"HTHCombatDist")) {
					local rage = GetData("monsterRage");
					if (rage == null) {
						rage = 0;
					}
					local player = Networking.FirstPlayer();
					local playerRelPos = Object.WorldToObject(self,Object.Position(player));
					//first check for crouching
					local bCrouching = Property.Get(player,"AI_Visibility","Exposure Rating") < -2; //hack from NVScript source
					if ((fabs(playerRelPos.x) < fabs(CombatDist.y)) && (fabs(playerRelPos.y) < fabs(CombatDist.x)) && (fabs(playerRelPos.z) < fabs(CombatDist.z))) {
						if (bCrouching) {
							SetData("bCrouchAttack",true);
						}
						rage++;
						if (rage >= rageMax) {
							rage = rageMax;
						}
						SetData("monsterRage",rage);
						local dist = vector(CombatDist.x,CombatDist.y,CombatDist.z);
						dist.y *= (1.0+1.0*rage.tofloat());
						Property.SetSimple(self,"HTHCombatDist",dist);
					}
				}
			}
			SetData("RageTimer",SetOneShotTimer("RageTimer",0.1));
		}
		else {
			KillRage();
		}
	}
	
	function ResetRange() {
		local arch = Object.Archetype(self);
		if (Property.Possessed(arch,"HTHCombatDist")) {
			Property.Set(self,"AIRCProp","Minimum Distance",Property.Get(arch,"AIRCProp","Minimum Distance"));
			Property.Set(self,"AIRCProp","Ideal Distance",Property.Get(arch,"AIRCProp","Ideal Distance"));
		}
	}
}

// ================================================================================
// RSD: Support for Assassin Rapier attack sounds (need the script slot)
class rsdRapierSounds extends rsdMonsterChaseFix {
	function OnStartAttackMelee() {
		if (Data.RandFlt0to1() < 0.5) {
			Sound.PlaySchemaAtObject(self, "swing_es_fwd", self);
		}
		else {
			Sound.PlaySchemaAtObject(self, "swing_es_over", self);
		}
	}
	
	function OnEndAttackMelee() {
		Sound.PlaySchemaAtObject(self, "swing_es_back", self);
	}
}

// ================================================================================
// RSD: sets attack joint to a different spot to mitigate shooting through objects
class rsdAttackJointFix extends SqRootScript {
	function OnSim() {
		PostMessage(self,"AttackJointFix");
	}
	
	function OnAttackJointFix() {
		// ShockGame.AddText("fixing joint on:"+self+" archetype:"+Object.Archetype(self),"Player");
		local projLink = Link.GetOne("AIProjectile",self);
		local archLink = Link.GetOne("AIProjectile",Object.Archetype(self));
		local joint = LinkTools.LinkGetData(archLink,"Launch Joint");
		LinkTools.LinkSetData(projLink,"Launch Joint",joint);
	}
}