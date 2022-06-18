CMD:gotopos(playerid, params[])
{
    new id,Float:x, Float:y, Float:z, interior;
    if(aData[playerid][aLevel] < 5 ) return YetersizYetki(playerid);
    if(sscanf(params, "ufffd",id,x,y,z,interior)) return KomutKullanım(playerid, "/gotopos [oyuncu id] [x] [y] [z] [interior id]");
    if(!GirisYapmamis(id)) return GecersizID(playerid);
    if(interior < 0 || interior > 18) return HataGonder(playerid, "İnterior için 0-18 arası değer girmen gerekiyor.");
    if(IsPlayerInAnyVehicle(playerid)) return AracKomut(playerid);
    SetPlayerInterior(id,interior);
    SetPlayerPos(id, Float:x, Float:y, Float:z);
    MesajGonder(playerid,"%s adlı admin %0.3f | %0.3f | %0.3f | %d {c9c9c9} kordinatlarına ışınlandı.",oyuncuisim(playerid),Float:x, Float:y, Float:z, interior);
    return 1;
}

CMD:getpos(playerid, params[])
{
    new id, Float:x , Float:y , Float:z;
    if(aData[playerid][aLevel] < 5) return YetersizYetki(playerid);
    if(sscanf(params, "u", id)) return KomutKullanım(playerid, "/getpos [Oyuncu id]");
    if(!GirisYapmamis(id)) return GecersizID(playerid);
    GetPlayerPos(id, Float:x, Float:y, Float:z);
    MesajGonder(playerid, "%s adlı oyuncunun pos kordinatları %0.3f | %0.3f | %0.3f",oyuncuisim(id),Float:x,Float:y,Float:z);
    return 1;
}
