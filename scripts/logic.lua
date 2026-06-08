function canAccessSealed() 
  local pendantObj = Tracker:FindObjectForCode("pendant")
  local blackTyranoObj = Tracker:FindObjectForCode("blacktyranoboss")
  local dragonTankObj = Tracker:FindObjectForCode("dragontankboss")
  local magusObj = Tracker:FindObjectForCode("magusboss")

  if not pendantObj or not blackTyranoObj or not dragonTankObj or not magusObj then
    return false
  end

  local pendant = pendantObj.Active
  local earlyPendant = Tracker:ProviderCountForCode("earlypendant") > 0
  local blackTyrano = blackTyranoObj.Active
  local dragonTank = dragonTankObj.Active
  local magus = magusObj.Active
  local uid = Tracker.ActiveVariantUID or ""
  local locMode = string.find(uid, "legacy_of_cyrus") ~= nil
  local lwMode = string.find(uid, "lost_worlds") ~= nil
  
  return ((dragonTank or (locMode and pendant)) and earlyPendant) or (pendant and (magus or blackTyrano or lwMode))
end

function canFly()
  local epochfail = Tracker:ProviderCountForCode("epochfail") > 0
  local fixedepochObj = Tracker:FindObjectForCode("fixedepoch")
  local fixedepoch = fixedepochObj and fixedepochObj.Active or false

  return (not epochfail) or fixedepoch
end