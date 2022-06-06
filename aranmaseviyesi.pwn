
#include <Pawn.CMD>
#include <sscanf2>
new oisim[128];
new aisim[128];

// Aranma seviyesi ekleme //
CMD:aekle(playerid, params[])
{
    new id, aranmaseviyesi;
    if(pAdmin[playerid] < 5) return HataGonder(playerid, "Yetersiz yetki.");
    if(sscanf(params, "ud", id, aranmaseviyesi)) return KomutKullanım(playerid, " /aekle [oyuncu id] [aranma seviyesi]");
    if(!GirisYapmamis(id)) return HataGonder(playerid,"Geçersiz bir ID girdiniz.");
    GivePlayerWanted(id, aranmaseviyesi);
    GetPlayerName(id, oisim, 24);
    GetPlayerName(playerid, aisim, 24);
    new aranmamesaj[246];
    format(aranmamesaj, sizeof (aranmamesaj),"{F81414}SUNUCU : {F81313}%s {ffffff}adlı admin {f81313}%s {ffffff}adlı oyuncunun aranma seviyesine {f81313}%d {ffffff}ekledi.",aisim,oisim,aranmaseviyesi);
    SendClientMessageToAll(COLOR_RED, aranmamesaj);
    return 1;
}

// Aranma seviyesine bakma //
CMD:aseviyem(playerid, params[])
{
    new id, aranmaseviyem;
    if(pAdmin[playerid] < 5) return HataGonder(playerid, "Yetersiz yetki.");
    if(sscanf(params, "u", id)) return KomutKullanım(playerid, " /aseviyem [oyuncu id]");
    if(!GirisYapmamis(id)) return HataGonder(playerid, "Geçersiz bir ID girdiniz.");
    aranmaseviyem = GetPlayerWantedLevel(playerid);
    new aranmamesaj2[128];
    GetPlayerName(id, oisim, 24);
    format(aranmamesaj2, sizeof(aranmamesaj2),"{AA3333}[WANTED] : '{f81414} %s {ffffff}' {ffffff}adlı kullanıcının aranma seviyesi = {f81414}'%i'",oisim,aranmaseviyem);
    SendClientMessage(playerid,-1,aranmamesaj2);
    return 1;
}
