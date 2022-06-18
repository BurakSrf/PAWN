CMD:goto(playerid, params[])
{
    new id, Float:x, Float:y, Float:z;
    if(sscanf(params, "u",id)) return KomutKullanım(playerid, "/goto [Oyuncu ID]");
    if(!GirisYapmamis(id)) return GecersizID(playerid);
    if(aData[playerid][aLevel] < 5) return YetersizYetki(playerid);
    if(id == playerid) return HataGonder(playerid, "Kendine ışınlanamazsın.");
    GetPlayerPos(playerid, x,y,z);
    SetPlayerPos(id, x, y+1, z);
    MesajGonder(playerid, "%s adlı oyuncunun yanına ışınlandın.",oyuncuisim(id));
    MesajGonder(id, "%s adlı admin senin yanına ışınlandı.",oyuncuisim(playerid));
    return 1;
}

CMD:gethere(playerid, params[])
{
    new id, Float:x, Float:y, Float:z;
    if(sscanf(params, "u",id)) return KomutKullanım(playerid, "/gethere [Oyuncu ID]");
    if(!GirisYapmamis(id)) return GecersizID(playerid);
    if(aData[playerid][aLevel] < 5) return YetersizYetki(playerid);
    if(id == playerid) return HataGonder(playerid, "Kendini çekemezsin.");
    GetPlayerPos(id, x, y, z);
    SetPlayerPos(playerid, x, y+2, z);
    MesajGonder(playerid, "%s adlı oyuncuyu yanına çektin.",oyuncuisim(id));
    MesajGonder(id, "%s adlı admin seni yanına çekti.",oyuncuisim(playerid));
    return 1;
}
