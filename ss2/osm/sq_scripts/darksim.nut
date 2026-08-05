class DestroyOnSpawn extends SqRootScript
{
  function OnBeginScript()
  {
    print("DestroyOnSpawn: destroy object");
    Object.Destroy(self);
  }
}

class ResetStats extends SqRootScript
{
  function OnBeginScript()
  {
    print("ResetStats: reset stats");
    Property.Set("Player", "BaseStatsDesc", "STR", 1);
    Property.Set("Player", "BaseStatsDesc", "END", 1);
    Property.Set("Player", "BaseStatsDesc", "PSI", 1);
    Property.Set("Player", "BaseStatsDesc", "AGI", 1);
    Property.Set("Player", "BaseStatsDesc", "CYB", 1);

    Property.Set("Player", "BaseWeaponDesc", "Conventional", 6);
    Property.Set("Player", "BaseWeaponDesc", "Energy", 6);
    Property.Set("Player", "BaseWeaponDesc", "Heavy", 6);
    Property.Set("Player", "BaseWeaponDesc", "Annelid", 6);

    Property.Set("Player", "BaseTechDesc", "Hack", 6);
    Property.Set("Player", "BaseTechDesc", "Repair", 6);
    Property.Set("Player", "BaseTechDesc", "Modify", 6);
    Property.Set("Player", "BaseTechDesc", "Maintain", 6);
    Property.Set("Player", "BaseTechDesc", "Research", 6);

    Property.SetSimple("Player", "PsiPowerDesc", 0);
    Property.SetSimple("Player", "PsiPower2Desc", 0);

    ShockGame.RecalcStats("Player");
  }
}
