#include <sscanf2>
#include <Pawn.CMD>


// Kişiye istediğin miktarda can ve zırh verme (SADECE ADMİNLER)

CMD:canzirhver(playerid, params[])
{
    new id, canver, zirhver;
    if(pAdmin[playerid] < 5) return HataGonder(playerid, "{F0FFFF}Bu komutu yanlızca {F81414}rütbeli {F0FFFF}adminler kullanabilir.");
    if(sscanf(params, "udd",id,canver,zirhver)) return SendClientMessage(playerid, COLOR_RED, "[KULLANIM] : {ffffff}/canzirhver [oyuncu id] [can] [zirh]");
    if(!GirisYapmamis(id)) return HataGonder(playerid, "Gerçersiz bir ID girdiniz.");
    GivePlayerArmour(playerid, zirhver);
    GivePlayerHealth(playerid, canver);
    new cisim[24]; 
    new cisim2[24];
    GetPlayerName(playerid, cisim, 24);
    GetPlayerName(id, cisim2, 24);
    new czmesaj[256];
    format(czmesaj, sizeof(czmesaj),"[A]: {f81414}%s {FFFFFF}adlı admin {f81414}%s {ffffff}adlı oyuncuya {f81414}%d {ffffff}can {f81414}%d {ffffff}zırh verdi.",cisim,cisim2,canver,zirhver);
    SendClientMessageToAll(COLOR_RED, czmesaj);
    return 1;
}

//GİRİŞ FONKSIYONU //
stock GirisYapmamis(playerid)
{
	if (!IsPlayerConnected(playerid))
	{
	    return 0;
	}
	return 1;
}
// GIRIS FONKSIYONU BITIS //
