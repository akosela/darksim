class NoPsiAmp extends SqRootScript
{
  function OnBeginScript()
  {
    print("NoPsiAmp: deleting Psi Amp");
    Object.Destroy(self);
  }
}
