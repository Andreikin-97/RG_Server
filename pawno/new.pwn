main() {}
/* ___________________________________________________________________

������ ���������� ������� - (15.01.2020 � 19:16)
�������� �������: Redwich RolePlay

����������� (����������) ������� - ������ ������� - (Andreikin)

��� - (������� ������������ �������):
    1. ������ ������� (Andreikin)

��������� ���:
    1. None - (None)
    2. None - (None)
    3. None - (None)
______________________________________________________________________ */

// �������
#include <a_samp>

#include <streamer>
#include <nex-ac>
#undef MAX_PLAYERS
#define MAX_PLAYERS 100
#include <sscanf2>
#include <a_mysql>
#include <mxdate>
#include <a_objects>
#include <foreach>
#include <a_vehicles>
#include <a_players>
#include <Pawn.CMD>
#include <mxINI>

// ������� �������

#define  	sNAMES			"None RP" // - �������� �������
#define 	sSERVER_NAMES	"None" // - �������� �������
#define 	sNUMBER			"1" // - ����� �������
#define 	sOBNOVA			"None" // - �������� ����������
#define 	sVERSION 		"v 0.0.1" // - ������ ���� (����������) �������
#define 	sWEBSITE 		"none-rp.com" // - ���� �������
#define 	sWEB_DONATE     "none-rp.com/donat" // - ����� �������
#define 	sFORUM         	"forum.none-rp.com" // - ����� �������
#define 	sGROUP         	"vk.com/none_rp" // - ������ �������
#define 	sMAPNAME       	"Criminal Russia" // - �������� �����
#define 	sLANGUAGE      	"Russian" // - ����� �������
#define 	sRCON_PASS		"awldkawWAWdawWADWadawwd5648651654" // - RCON ������
#define 	sPASS 			"" // - ������ �������

// ������� ������� ���� ������
#define     T_SERVER        "`server_setting`" //

// �����

#define 	cSERVER        	(0xFF9900FF)
#define 	SERVER         	"{FF9900}"

// �������� ����
#define 	cWHITE        	0xFFFFFFAA // �����
#define 	WHITE         	"{FFFFFF}"
#define 	cBLUE 			0x3399FFFF // �����
#define     BLUE    		"{3399FF}"
#define 	cPURPLE 		0xDD90FFFF // ���������
#define     PURPLE    		"{DD90FF}"
#define 	cLIME			0x66CC00FF // ���������
#define     LIME    		"{66CC00}"
#define 	cLIMEGREEN		0x32CD32FF // ������-�������
#define     LIMEGREEN    	"{32CD32}"
#define     cRED    		0xAA3333AA // �������
#define     RED    			"{AA3333}"
#define 	cWAR	     	0xDF3C3CFF // ������
#define 	WAR	        	"{DF3C3C}"
#define 	cGREEN 			0x63BD4EFF // �������
#define     GREEN    		"{63BD4E}"
#define 	cGREY 			0xAFAFAFAA // �����
#define     GREY    		"{AFAFAF}"
#define 	cYELLOW 		0xFFFF00FF // ������
#define     YELLOW    		"{FFFF00}"

// �������

#define	d_info 				DIALOG_STYLE_MSGBOX
#define	d_list 				DIALOG_STYLE_LIST
#define	d_pass 				DIALOG_STYLE_PASSWORD
#define	d_input         	DIALOG_STYLE_INPUT
// ������ ��� 0.3.7 ������
#define d_tlist				DIALOG_STYLE_TABLIST
#define d_tlisth			DIALOG_STYLE_TABLIST_HEADERS
//

#define	SCM            		SendClientMessage
#define	SCMAll          	SendClientMessageToAll
#define	SPD             	ShowPlayerDialog
#define	FSCM(%1,%2,%3,%4)	do{new _s[128]; format(_s,128,%3,%4); SCM(%1,%2,_s); }while(FALSE)

#define	SEM     			SendErrorMessage
#define	SendErrorMessage(%0,%1) \
							SCM(%0, cWAR, "[ ������ ] {FFFFFF}"%1), PlayerPlaySound(playerid, 1085, 0.0, 0.0, 0.0)
#define	SCMInfo(%0,%1)		SCM(%0, cLIME, "[ ����������� ] {FFFFFF}"%1), PlayerPlaySound(%0, 1083, 0.0, 0.0, 0.0)

#define for(%0,%1)   		for(new %0; %0 < %1; %0++)
#define f(  				format(string, sizeof(string),


#if !defined FALSE
							new stock bool:FALSE = false;
#endif
#if !defined IsValidVehicle
     						native IsValidVehicle(vehicleid);

#endif

#define LoginOff        	"��� ������ �������������!"
#define PlayerOff       	"������ ��� �� �������!"
#define PlayerLoginOff  	"����� �� �����������!"
#define AdminLoginOff   	"�� �� �������������� � ����� - ������!"
#define AdminBlock          "���� ����� �������������� �������������!"
#define PlayerID        	"�� ����� ���� ID!"
#define CMDOff          	"������� �� �������! ��� ������� �� ������� "SERVER"/mn(/menu){FFFFFF} > ������� �������"
//
#define	OffStrelki(%0,%1)	TogglePlayerSpectating(%0, %1)
#define	Freeze(%0,%1)		TogglePlayerControllable(%0, %1)
#define	publics%0(%1)		forward%0(%1); public%0(%1)
//
#define PRESSED(%0) 		(((newkeys & (%0)) == (%0)) && ((oldkeys & (%0)) != (%0)))
#define RELEASED(%0) 		(((newkeys & (%0)) != (%0)) && ((oldkeys & (%0)) == (%0)))


// ���������� - �������
new
	MySQL: mysql, rows,
	year_s, month_s, day_s, // ���������� ����
	hour_s, minute_s, second_s; // ���������� �������

// �����
enum // �������
{
    dNull,
    // ������� ��������� �������
    dSettingServerMenu, // ����
    dSettingServerNameProject, // �������� �������
    dSettingServerNumber, // ����� �������
    dSettingServerName, // �������� �������
    dSettingServerNameUpdate, // �������� ����������
    dSettingServerUpdate, // ������ ����������
    dSettingServerWeb, // ���� �������
    dSettingServerWebDonat, // ���� ������ �������
    dSettingServerForum, // ����� �������
    dSettingServerGroup, // ������ ��������� �������
    dSettingServerNameMap, // �������� �����
    dSettingServerPassword, // ������ �������
    dSettingServerBonusCash, // �������� ������
    dSettingServerBonusLevel, // �������� �������
    dSettingServerBonusDonat, // �������� �����
    dSettingServerXServer, // �������� �� �������
    dSettingServerXexp, // �������� �����
    dSettingServerXjobPay, // �������� ������� �� �������
    dSettingServerXfracPay, // �������� ������� � ������������
    dSettingServerXdonat // �������� ������
    //
};

enum MYSQL_SETTINGS // ����������� � ���� ������ MySQL
{
	mysql_Host, // �������
	mysql_Name, // ��� ������������
	mysql_Pass, // ������ ���� ������
	mysql_Baza // ��� ���� ������
};
new MySQLSettings[MYSQL_SETTINGS][30];

enum Server_Info // ���������� � �������/�������
{
	sName[32], // �������� �������
	sNumber, // ����� �������
	sNameServer[12], // �������� �������
	sObnova[24], // ������ �������
	sVersion[12], // ������ �������
	sWeb[24], // ���� �������
	sDonate[24], // ����� �������
	sForum[24], // ����� �������
	sGroup[24], // ������ �������
	sMapName[24], // �������� �����
	sLanguage[12], // ����
	sPassword[32], // ������ �������
	sRconPass[32], // ������� ������ �������
	// �����
	sBonusMoney, // �������� ������
	sBonusLevel, // �������� �������
	sBonusDonat, // �������� �����
	//
	sAdminPay, // �������� ��������������
	sBankAdmin, // ���� �������������
	//
	sMineral, // ���� �� �����
	sMineralVagon, // ���-�� ���� � ������ �� �����
	sStatusVagon, // ������ ������ �� �����
	sDrova, //
	//
	sX_Server, // �������� �� �������
	sX_Exp, // ��������� �����
	sX_JobPay, // �������� ������� �� �������
	sX_PayDay, // �������� ������� � ������������
	sX_Donat, // �������� ������
 	//
 	sEvent, // �����
};
new SI[Server_Info];

/* =========================== [ ������ �������� ] ============================ */
public OnGameModeInit()
{
	getdate(year_s, month_s, day_s); // ������ ����
	gettime(hour_s, minute_s, second_s); // ������ �����
	SetWorldTime(hour_s); // ������ ����� �� �������

	ShowNameTags(1); // ������� ������������� ��������� �����
	DisableInteriorEnterExits(); // ���������� ���� ������������ �������
	EnableStuntBonusForAll(0); // ���������� ������ �� ������ � �����
	SetNameTagDrawDistance(20.0); // ����������� ����� ������ � �������
	SetGravity(0.008); // ����������� ���������� �������
	// ShowPlayerMarkers(1); �������� ������� ������� �� �������
	// LimitPlayerMarkerRadius(100.0); ����������� ������� ������ �� ����-����� � �������
	// ManualVehicleEngineAndLights(); ���������� ����������� ����������

	// ����������� � ���� ������
	LoadMySQLSettings(); // �������� � ����� ������ MySQL

	mysql = mysql_connect(MySQLSettings[mysql_Host], MySQLSettings[mysql_Name], MySQLSettings[mysql_Pass], MySQLSettings[mysql_Baza]);
	mysql_log(WARNING | ERROR);// mysql_log(WARNING | ERROR);

	if(mysql_errno(mysql) != 0)
    {
    	printf("\n������ �� ��������� � ���� ������: %s", MySQLSettings[mysql_Baza]);
    	print("��������� ������ � �������� ��� � ����������� ������!\n");
		SendRconCommand("exit");
    }
    else
	{
		printf("--- ���������� c MySQL ����� ������ [ %s ] ���������� ---", MySQLSettings[mysql_Baza]);
		// ������ ���� �� �������!!!
		mysql_set_charset("cp1251");
		mysql_tquery(mysql, "SET CHARACTER SET 'utf8'", "", "");
		mysql_tquery(mysql, "SET NAMES 'utf8'", "", "");
		mysql_tquery(mysql, "SET character_set_client = 'cp1251'", "", "");
		mysql_tquery(mysql, "SET character_set_connection = 'cp1251'", "", "");
		mysql_tquery(mysql, "SET character_set_results = 'cp1251'", "", "");
		mysql_tquery(mysql, "SET SESSION collation_connection = 'utf8_general_ci'", "", "");
		//

        mysql_tquery(mysql, "SELECT * FROM "T_SERVER"", "LoadSettingServer", ""); // ��������� �������
	}
	//
	AddPlayerClass(0, 1958.3783, 1343.1572, 15.3746, 269.1425, 0, 0, 0, 0, 0, 0);

	return 1;
}

public OnGameModeExit()
{
	mysql_close(mysql);
	return 1;
}

public OnPlayerRequestClass(playerid, classid)
{
	return 1;
}

public OnPlayerConnect(playerid)
{
	return 1;
}

public OnPlayerDisconnect(playerid, reason)
{
	return 1;
}

public OnPlayerSpawn(playerid)
{
	return 1;
}

public OnPlayerDeath(playerid, killerid, reason)
{
	return 1;
}

public OnVehicleSpawn(vehicleid)
{
	return 1;
}

public OnVehicleDeath(vehicleid, killerid)
{
	return 1;
}

public OnPlayerText(playerid, text[])
{
	return 1;
}

public OnPlayerCommandText(playerid, cmdtext[])
{
	return 0;
}

public OnPlayerEnterVehicle(playerid, vehicleid, ispassenger)
{
	return 1;
}

public OnPlayerExitVehicle(playerid, vehicleid)
{
	return 1;
}

public OnPlayerStateChange(playerid, newstate, oldstate)
{
	return 1;
}

public OnPlayerEnterCheckpoint(playerid)
{
	return 1;
}

public OnPlayerLeaveCheckpoint(playerid)
{
	return 1;
}

public OnPlayerEnterRaceCheckpoint(playerid)
{
	return 1;
}

public OnPlayerLeaveRaceCheckpoint(playerid)
{
	return 1;
}

public OnRconCommand(cmd[])
{
	return 1;
}

public OnPlayerRequestSpawn(playerid)
{
	return 1;
}

public OnObjectMoved(objectid)
{
	return 1;
}

public OnPlayerObjectMoved(playerid, objectid)
{
	return 1;
}

public OnPlayerPickUpPickup(playerid, pickupid)
{
	return 1;
}

public OnVehicleMod(playerid, vehicleid, componentid)
{
	return 1;
}

public OnVehiclePaintjob(playerid, vehicleid, paintjobid)
{
	return 1;
}

public OnVehicleRespray(playerid, vehicleid, color1, color2)
{
	return 1;
}

public OnPlayerSelectedMenuRow(playerid, row)
{
	return 1;
}

public OnPlayerExitedMenu(playerid)
{
	return 1;
}

public OnPlayerInteriorChange(playerid, newinteriorid, oldinteriorid)
{
	return 1;
}

public OnPlayerKeyStateChange(playerid, newkeys, oldkeys)
{
	return 1;
}

public OnRconLoginAttempt(ip[], password[], success)
{
	return 1;
}

public OnPlayerUpdate(playerid)
{
	return 1;
}

public OnPlayerStreamIn(playerid, forplayerid)
{
	return 1;
}

public OnPlayerStreamOut(playerid, forplayerid)
{
	return 1;
}

public OnVehicleStreamIn(vehicleid, forplayerid)
{
	return 1;
}

public OnVehicleStreamOut(vehicleid, forplayerid)
{
	return 1;
}

public OnDialogResponse(playerid, dialogid, response, listitem, inputtext[])
{
	switch(dialogid)
	{
		// ������� ��������� �������
		case dSettingServerMenu: // ����
	    {
	        if(!response)return 1;
	        {
				new string[512];
				switch(listitem)
				{
				    case 0: // �������� �������
				    {
						format(string, sizeof(string), "{FFFFFF}\
							������� ����� �������� �������.\n\n\
							�������� ������� ������ ���� �� "SERVER"4-��{FFFFFF} �� "SERVER"32-��{FFFFFF} ��������.\n\
							�������� ������� �� ����� ��������� �������������� �����.\n\n\
							������� �������� �������: "SERVER"%s",
						SI[sName]);
						SPD(playerid, dSettingServerNameProject, d_input, "{FFFFFF}������ ������������ | "SERVER"�������� �������", string, "�������", "<< �����");
					}
				    case 1: // ����� �������
				    {
						format(string, sizeof(string), "{FFFFFF}\
							������� ����� ����� �������.\n\n\
							������� ����� �������: "SERVER"%i",
						SI[sNumber]);
						SPD(playerid, dSettingServerNumber, d_input, "{FFFFFF}������ ������������ | "SERVER"����� �������", string, "�������", "<< �����");
					}
				    case 2: // �������� �������
				    {
						format(string, sizeof(string), "{FFFFFF}\
							������� ����� �������� �������.\n\n\
							�������� ������� ������ ���� �� "SERVER"4-��{FFFFFF} �� "SERVER"12-��{FFFFFF} ��������.\n\
							�������� ������� �� ����� ��������� �������������� �����.\n\n\
							������� �������� �������: "SERVER"%s",
						SI[sNameServer]);
						SPD(playerid, dSettingServerName, d_input, "{FFFFFF}������ ������������ | "SERVER"�������� �������", string, "�������", "<< �����");
					}
				    case 3: // �������� ����������
				    {
				        new stringObnova[32];
				        if(GetString(SI[sObnova], "None")) stringObnova = ""GREEN"�����������";
        				else format(stringObnova, sizeof(stringObnova), "%s", SI[sObnova]);

						format(string, sizeof(string), "{FFFFFF}\
							������� ����� �������� ����������.\n\n\
							�������� ���������� ������ ���� �� "SERVER"4-��{FFFFFF} �� "SERVER"32-��{FFFFFF} ��������.\n\
							�������� ���������� �� ����� ��������� �������������� �����.\n\
							������� "SERVER"None{FFFFFF} ���� ������ ����� ������ �������� ����������.\n\n\
							������� �������� ����������: "SERVER"%s",
						stringObnova);
						SPD(playerid, dSettingServerNameUpdate, d_input, "{FFFFFF}������ ������������ | "SERVER"�������� ����������", string, "�������", "<< �����");
					}
				    case 4: // ������ ����������
				    {
						format(string, sizeof(string), "{FFFFFF}\
							������� ����� ������ ����������.\n\n\
							������ ���������� ������ ���� ������: "SERVER"v 0.0.1\n\
							������� ������ ����������: "SERVER"%s",
						SI[sVersion]);
						SPD(playerid, dSettingServerUpdate, d_input, "{FFFFFF}������ ������������ | "SERVER"������ ����������", string, "�������", "<< �����");
					}
				    case 5: // ���� �������
				    {
						format(string, sizeof(string), "{FFFFFF}\
							������� ����� "SERVER"URL{FFFFFF} ����� �������.\n\
							"SERVER"URL{FFFFFF} �� ������ ��������� ��������� �������� ("SERVER"http://{FFFFFF} ��� "SERVER"https://{FFFFFF}).\n\n\
							������� "SERVER"URL{FFFFFF} ����� �������: "SERVER"%s",
						SI[sWeb]);
						SPD(playerid, dSettingServerWeb, d_input, "{FFFFFF}������ ������������ | "SERVER"���� �������", string, "�������", "<< �����");
					}
				    case 6: // ���� ������ �������
				    {
						format(string, sizeof(string), "{FFFFFF}\
							������� ����� "SERVER"URL{FFFFFF} ����� � ������� �������.\n\
							"SERVER"URL{FFFFFF} �� ������ ��������� ��������� �������� ("SERVER"http://{FFFFFF} ��� "SERVER"https://{FFFFFF}).\n\n\
							������� "SERVER"URL{FFFFFF} ����� � ������� �������: "SERVER"%s",
						SI[sDonate]);
						SPD(playerid, dSettingServerWebDonat, d_input, "{FFFFFF}������ ������������ | "SERVER"���� ������ �������", string, "�������", "<< �����");
					}
				    case 7: // ����� �������
				    {
						format(string, sizeof(string), "{FFFFFF}\
							������� ����� "SERVER"URL{FFFFFF} ������ �������.\n\
							"SERVER"URL{FFFFFF} �� ������ ��������� ��������� �������� ("SERVER"http://{FFFFFF} ��� "SERVER"https://{FFFFFF}).\n\n\
							������� "SERVER"URL{FFFFFF} ������ �������: "SERVER"%s",
						SI[sForum]);
						SPD(playerid, dSettingServerForum, d_input, "{FFFFFF}������ ������������ | "SERVER"����� �������", string, "�������", "<< �����");
					}
				    case 8: // ������ ��������� �������
				    {
						format(string, sizeof(string), "{FFFFFF}\
							������� ����� "SERVER"URL{FFFFFF} ������ "SERVER"��{FFFFFF} �������.\n\
							"SERVER"URL{FFFFFF} �� ������ ��������� ��������� �������� ("SERVER"http://{FFFFFF} ��� "SERVER"https://{FFFFFF}).\n\n\
							������� "SERVER"URL{FFFFFF} ������ "SERVER"��{FFFFFF} �������: "SERVER"%s",
						SI[sGroup]);
						SPD(playerid, dSettingServerGroup, d_input, "{FFFFFF}������ ������������ | "SERVER"������ ��������� �������", string, "�������", "<< �����");
					}
				    case 9: // �������� �����
				    {
						format(string, sizeof(string), "{FFFFFF}\
							������� ����� �������� �����.\n\n\
							�������� ����� ������ ���� �� "SERVER"4-��{FFFFFF} �� "SERVER"12-��{FFFFFF} ��������.\n\
							�������� ����� �� ����� ��������� �������������� �����.\n\n\
							������� �������� �����: "SERVER"%s",
						SI[sMapName]);
						SPD(playerid, dSettingServerNameMap, d_input, "{FFFFFF}������ ������������ | "SERVER"�������� �����", string, "�������", "<< �����");
					}
				    case 10: return callcmd::ss(playerid); // ����
				    case 11: // ������ �������
				    {
						new stringPass[32];
						if(GetString(SI[sPassword], "None")) stringPass = ""GREEN"�����������";
				        else format(stringPass, sizeof(stringPass), "%s", SI[sPassword]);

						format(string, sizeof(string), "{FFFFFF}\
							������� ����� ������ �������.\n\
							������ ������� ����� ��� �������� ������� ��� ����� ������ ����������.\n\
							���-�� ������ ��������� ��� ����������� ����� �� �������.\n\n\
	      					������� ������ ���� ������ �� ��������� ("SERVER"En{FFFFFF}) �������� � ���� �� "SERVER"5-��{FFFFFF} �� "SERVER"32-��{FFFFFF} ��������.\n\
		  					������� "SERVER"None{FFFFFF} ���� ������ ����� ������ � �������.\n\n\
							������� ������ �� �������: "SERVER"%s",
						stringPass);
						SPD(playerid, dSettingServerPassword, d_input, "{FFFFFF}������ ������������ | "SERVER"������ �������", string, "�������", "<< �����");
					}
				    case 12: // �������� ������
				    {
						format(string, sizeof(string), "{FFFFFF}\
							������� ����� ����� �������� ������.\n\
							�������� ������ �������� ������� ��� �����������.\n\n\
							����� ������ ���� �� "GREEN"15.000 ������{FFFFFF} �� "GREEN"1.500.000 ������{FFFFFF}\n\n\
							������� ����� �������� ������: "GREEN"%s ������",
						ConvertCash(SI[sBonusMoney]));
						SPD(playerid, dSettingServerBonusCash, d_input, "{FFFFFF}������ ������������ | "SERVER"�������� ������", string, "�������", "<< �����");
					}
				    case 13: // �������� �������
				    {
						format(string, sizeof(string), "{FFFFFF}\
							������� ����� �������� �������.\n\
							�������� ������� ������� ������� ��� �����������.\n\n\
							�������� ������� ������ ���� �� "SERVER"1{FFFFFF} �� "SERVER"10{FFFFFF}\n\n\
							������� �������� �������: "SERVER"%i",
						SI[sBonusLevel]);
						SPD(playerid, dSettingServerBonusLevel, d_input, "{FFFFFF}������ ������������ | "SERVER"�������� �������", string, "�������", "<< �����");
					}
				    case 14: // �������� �����
				    {
						format(string, sizeof(string), "{FFFFFF}\
							������� ����� ����� ��������� ������.\n\
							�������� ����� �������� ������� ��� �����������.\n\n\
							����� ������ ���� �� "SERVER"500 ��{FFFFFF} �� "SERVER"1.500 ��{FFFFFF}\n\n\
							������� ����� ��������� ������: "SERVER"%s ��",
						ConvertCash(SI[sBonusDonat]));
						SPD(playerid, dSettingServerBonusDonat, d_input, "{FFFFFF}������ ������������ | "SERVER"�������� �����", string, "�������", "<< �����");
					}
				    case 15: // �������� �� �������
				    {
						format(string, sizeof(string), "{FFFFFF}\
						X1\n\
						X2\n\
						X3\n\
						X4",
						SI[sX_Server]);
						SPD(playerid, dSettingServerXServer, d_list, "{FFFFFF}������ ������������ | "SERVER"�������� �� �������", string, "�������", "<< �����");
					}
				    case 16: // �������� �����
				    {
						format(string, sizeof(string), "{FFFFFF}\
						X1\n\
						X2\n\
						X3\n\
						X4",
						SI[sX_Exp]);
						SPD(playerid, dSettingServerXexp, d_list, "{FFFFFF}������ ������������ | "SERVER"�������� �����", string, "�������", "<< �����");
					}
				    case 17: // �������� ������� �� �������
				    {
						format(string, sizeof(string), "{FFFFFF}\
						X1\n\
						X2\n\
						X3\n\
						X4",
						SI[sX_JobPay]);
						SPD(playerid, dSettingServerXjobPay, d_list, "{FFFFFF}������ ������������ | "SERVER"�������� ������� �� �������", string, "�������", "<< �����");
					}
				    case 18: // �������� ������� � ������������
				    {
						format(string, sizeof(string), "{FFFFFF}\
						X1\n\
						X2\n\
						X3\n\
						X4",
						SI[sX_PayDay]);
						SPD(playerid, dSettingServerXfracPay, d_list, "{FFFFFF}������ ������������ | "SERVER"�������� ������� � ������������", string, "�������", "<< �����");
					}
				    case 19: // �������� ������
				    {
						format(string, sizeof(string), "{FFFFFF}\
						X1\n\
						X2\n\
						X3\n\
						X4",
						SI[sX_Donat]);
						SPD(playerid, dSettingServerXdonat, d_list, "{FFFFFF}������ ������������ | "SERVER"�������� ������", string, "�������", "<< �����");
					}
					case 20: // ����������� �����
					{
						if(!SI[sEvent]) SI[sEvent] = 1;
                        else if(SI[sEvent] == 1) SI[sEvent] = 2;
                        else if(SI[sEvent] == 2) SI[sEvent] = 3;
                        else if(SI[sEvent] == 3) SI[sEvent] = 0;
                        {
			                update_int_mysql(T_SERVER, "sEvent", SI[sEvent], "sNumber", 1);
			                return callcmd::ss(playerid);
						}
					}
				}
			}
		}
		case dSettingServerNameProject: // �������� �������
	    {
            if(!response) return callcmd::ss(playerid);
			{
				new NameProject = strlen(inputtext);
				if(!(4 <= NameProject <= 32))
				{
				    new string[1024];
                    format(string, sizeof(string), "{FFFFFF}\
						������� ����� �������� �������.\n\n\
						�������� ������� ������ ���� �� "SERVER"4-��{FFFFFF} �� "SERVER"32-��{FFFFFF} ��������.\n\
						�������� ������� �� ����� ��������� �������������� �����.\n\n\
						������� �������� �������: "SERVER"%s",
					SI[sName]);
					return SPD(playerid, dSettingServerNameProject, d_input, "{FFFFFF}������ ������������ | "SERVER"�������� �������", string, "�������", "<< �����");
				}
				FSCM(playerid, -1, "�� ������� ������� �������� ������� � "SERVER"%s{FFFFFF} �� "GREEN"%s{FFFFFF}", SI[sName], inputtext);

				new nam[80];
				SetString(SI[sName], inputtext);
                update_str_mysql(T_SERVER, "sName", SI[sName], "sNumber", 1);

				if(!GetString(SI[sObnova], "None") && SI[sX_PayDay] == 1) format(nam, sizeof(nam), "hostname %s | %s", SI[sName], SI[sObnova]); // �������� �������
			    else if(GetString(SI[sObnova], "None") && SI[sX_PayDay] > 1) format(nam, sizeof(nam), "hostname %s | X%i PayDay", SI[sName], SI[sX_PayDay]);
			    else if(!GetString(SI[sObnova], "None") && SI[sX_PayDay] > 1) format(nam, sizeof(nam), "hostname %s | %s | X%i PayDay", SI[sName], SI[sObnova], SI[sX_PayDay]); // �������� �������
				else format(nam, sizeof(nam), "hostname %s", SI[sName]);
				SendRconCommand(nam);
			}
		}
	    case dSettingServerNumber: // ����� �������
	    {
            if(!response) return callcmd::ss(playerid);
			{
				new ServerNumber = strval(inputtext);
				if(!(1 <= ServerNumber <= 5))
				{
				    new string[1024];
					format(string, sizeof(string), "{FFFFFF}\
						������� ����� ����� �������.\n\n\
						������� ����� �������: "SERVER"%i",
					SI[sNumber]);
					return SPD(playerid, dSettingServerNumber, d_input, "{FFFFFF}������ ������������ | "SERVER"����� �������", string, "�������", "<< �����");
				}
				FSCM(playerid, -1, "�� ������� ������� ����� ������� � "SERVER"%i{FFFFFF} �� "GREEN"%i{FFFFFF}", SI[sNumber], ServerNumber);
				SI[sNumber] = ServerNumber;
                update_int_mysql(T_SERVER, "sNumber", SI[sNumber], "sNumber", 1);
			}
		}
	    case dSettingServerName: // �������� �������
	    {
            if(!response) return callcmd::ss(playerid);
			{
				new NameServer = strlen(inputtext);
				if(!(4 <= NameServer <= 32))
				{
				    new string[1024];
					format(string, sizeof(string), "{FFFFFF}\
						������� ����� �������� �������.\n\n\
						�������� ������� ������ ���� �� "SERVER"4-��{FFFFFF} �� "SERVER"12-��{FFFFFF} ��������.\n\
						�������� ������� �� ����� ��������� �������������� �����.\n\n\
						������� �������� �������: "SERVER"%s",
					SI[sNameServer]);
					return SPD(playerid, dSettingServerName, d_input, "{FFFFFF}������ ������������ | "SERVER"�������� �������", string, "�������", "<< �����");
				}
				FSCM(playerid, -1, "�� ������� ������� �������� ������� � "SERVER"%s{FFFFFF} �� "GREEN"%s{FFFFFF}", SI[sNameServer], inputtext);
				SetString(SI[sNameServer], inputtext);

                update_str_mysql(T_SERVER, "sNameServer", SI[sNameServer], "sNumber", 1);
			}
		}
	    case dSettingServerNameUpdate: // �������� ����������
	    {
            if(!response) return callcmd::ss(playerid);
			{
				new NameUpdate = strlen(inputtext);
				if(!(4 <= NameUpdate <= 32))
				{
				    new string[1024], stringObnova[32];
			        if(GetString(SI[sObnova], "None")) stringObnova = ""GREEN"�����������";
    				else format(stringObnova, sizeof(stringObnova), "%s", SI[sObnova]);

                    format(string, sizeof(string), "{FFFFFF}\
						������� ����� �������� ����������.\n\n\
						�������� ���������� ������ ���� �� "SERVER"4-��{FFFFFF} �� "SERVER"32-��{FFFFFF} ��������.\n\
						�������� ���������� �� ����� ��������� �������������� �����.\n\
						������� "SERVER"None{FFFFFF} ���� ������ ����� ������ �������� ����������.\n\n\
						������� �������� ����������: "SERVER"%s",
					stringObnova);
					return SPD(playerid, dSettingServerNameUpdate, d_input, "{FFFFFF}������ ������������ | "SERVER"�������� ����������", string, "�������", "<< �����");
				}
				FSCM(playerid, -1, "�� ������� ������� �������� ���������� � "SERVER"%s{FFFFFF} �� "GREEN"%s{FFFFFF}", SI[sObnova], inputtext);
				SetString(SI[sObnova], inputtext);
                update_str_mysql(T_SERVER, "sObnova", SI[sObnova], "sNumber", 1);

				new nam[80];
				if(!GetString(SI[sObnova], "None") && SI[sX_PayDay] == 1) format(nam, sizeof(nam), "hostname %s | %s", SI[sName], SI[sObnova]); // �������� �������
			    else if(GetString(SI[sObnova], "None") && SI[sX_PayDay] > 1) format(nam, sizeof(nam), "hostname %s | X%i PayDay", SI[sName], SI[sX_PayDay]);
			    else if(!GetString(SI[sObnova], "None") && SI[sX_PayDay] > 1) format(nam, sizeof(nam), "hostname %s | %s | X%i PayDay", SI[sName], SI[sObnova], SI[sX_PayDay]); // �������� �������
				else format(nam, sizeof(nam), "hostname %s", SI[sName]);
				SendRconCommand(nam);
			}
		}
		case dSettingServerUpdate: // ������ ����������
	    {
            if(!response) return callcmd::ss(playerid);
			{
				new NameVersion = strlen(inputtext);
				if(!(6 <= NameVersion <= 12))
				{
				    new string[1024];
					format(string, sizeof(string), "{FFFFFF}\
						������� ����� ������ ����������.\n\n\
						������ ���������� ������ ���� ������: "SERVER"v 0.0.1\n\
						������� ������ ����������: "SERVER"%s",
					SI[sVersion]);
					return SPD(playerid, dSettingServerUpdate, d_input, "{FFFFFF}������ ������������ | "SERVER"������ ����������", string, "�������", "<< �����");
				}
				FSCM(playerid, -1, "�� ������� ������� ������ ���������� � "SERVER"%s{FFFFFF} �� "GREEN"%s{FFFFFF}", SI[sVersion], inputtext);
				new ver[32];
				SetString(SI[sVersion], inputtext);
                update_str_mysql(T_SERVER, "sVersion", SI[sVersion], "sNumber", 1);
				format(ver, sizeof(ver), "%s", SI[sVersion]);
				SetGameModeText(ver); // ������ ���������� - ����
			}
		}
	    case dSettingServerWeb: // ���� �������
	    {
            if(!response) return callcmd::ss(playerid);
			{
				new NameWeb = strlen(inputtext);
				if(!(6 <= NameWeb <= 32))
				{
				    new string[1024];
                    format(string, sizeof(string), "{FFFFFF}\
						������� ����� "SERVER"URL{FFFFFF} ����� �������.\n\
						"SERVER"URL{FFFFFF} �� ������ ��������� ��������� �������� ("SERVER"http://{FFFFFF} ��� "SERVER"https://{FFFFFF}).\n\n\
						������� "SERVER"URL{FFFFFF} ����� �������: "SERVER"%s",
					SI[sWeb]);
					return SPD(playerid, dSettingServerWeb, d_input, "{FFFFFF}������ ������������ | "SERVER"���� �������", string, "�������", "<< �����");
				}
				FSCM(playerid, -1, "�� ������� ������� URL ����� ������� � "SERVER"%s{FFFFFF} �� "GREEN"%s{FFFFFF}", SI[sWeb], inputtext);
				new web[32];
				SetString(SI[sWeb], inputtext);
                update_str_mysql(T_SERVER, "sWeb", SI[sWeb], "sNumber", 1);
				format(web, sizeof(web), "weburl %s", SI[sWeb]);
				SendRconCommand(web); // URL ����� �������
			}
		}
	    case dSettingServerWebDonat: // ���� ������ �������
	    {
            if(!response) return callcmd::ss(playerid);
			{
				new NameWebDonat = strlen(inputtext);
				if(!(6 <= NameWebDonat <= 32))
				{
				    new string[1024];
                    format(string, sizeof(string), "{FFFFFF}\
						������� ����� "SERVER"URL{FFFFFF} ����� � ������� �������.\n\
						"SERVER"URL{FFFFFF} �� ������ ��������� ��������� �������� ("SERVER"http://{FFFFFF} ��� "SERVER"https://{FFFFFF}).\n\n\
						������� "SERVER"URL{FFFFFF} ����� � ������� �������: "SERVER"%s",
					SI[sDonate]);
					return SPD(playerid, dSettingServerWebDonat, d_input, "{FFFFFF}������ ������������ | "SERVER"���� ������ �������", string, "�������", "<< �����");
				}
				FSCM(playerid, -1, "�� ������� ������� URL ����� � ������� ������� � "SERVER"%s{FFFFFF} �� "GREEN"%s{FFFFFF}", SI[sDonate], inputtext);
				SetString(SI[sDonate], inputtext);
                update_str_mysql(T_SERVER, "sDonate", SI[sDonate], "sNumber", 1);
			}
		}
	    case dSettingServerForum: // ����� �������
	    {
            if(!response) return callcmd::ss(playerid);
			{
				new NameForum = strlen(inputtext);
				if(!(6 <= NameForum <= 32))
				{
				    new string[1024];
                    format(string, sizeof(string), "{FFFFFF}\
						������� ����� "SERVER"URL{FFFFFF} ������ �������.\n\
						"SERVER"URL{FFFFFF} �� ������ ��������� ��������� �������� ("SERVER"http://{FFFFFF} ��� "SERVER"https://{FFFFFF}).\n\n\
						������� "SERVER"URL{FFFFFF} ������ �������: "SERVER"%s",
					SI[sForum]);
					return SPD(playerid, dSettingServerForum, d_input, "{FFFFFF}������ ������������ | "SERVER"����� �������", string, "�������", "<< �����");
				}
				FSCM(playerid, -1, "�� ������� ������� URL ������ ������� � "SERVER"%s{FFFFFF} �� "GREEN"%s{FFFFFF}", SI[sForum], inputtext);
				SetString(SI[sForum], inputtext);
                update_str_mysql(T_SERVER, "sForum", SI[sForum], "sNumber", 1);
			}
		}
	    case dSettingServerGroup: // ������ ��������� �������
	    {
            if(!response) return callcmd::ss(playerid);
			{
				new NameGroup = strlen(inputtext);
				if(!(6 <= NameGroup <= 32))
				{
				    new string[1024];
                    format(string, sizeof(string), "{FFFFFF}\
						������� ����� "SERVER"URL{FFFFFF} ������ "SERVER"��{FFFFFF} �������.\n\
						"SERVER"URL{FFFFFF} �� ������ ��������� ��������� �������� ("SERVER"http://{FFFFFF} ��� "SERVER"https://{FFFFFF}).\n\n\
						������� "SERVER"URL{FFFFFF} ������ "SERVER"��{FFFFFF} �������: "SERVER"%s",
					SI[sGroup]);
					return SPD(playerid, dSettingServerGroup, d_input, "{FFFFFF}������ ������������ | "SERVER"������ ��������� �������", string, "�������", "<< �����");
				}
				FSCM(playerid, -1, "�� ������� ������� URL ������ �� ������� � "SERVER"%s{FFFFFF} �� "GREEN"%s{FFFFFF}", SI[sGroup], inputtext);
				SetString(SI[sGroup], inputtext);
                update_str_mysql(T_SERVER, "sGroup", SI[sGroup], "sNumber", 1);
			}
		}
	    case dSettingServerNameMap: // �������� �����
	    {
            if(!response) return callcmd::ss(playerid);
			{
				new NameMap = strlen(inputtext);
				if(!(4 <= NameMap <= 12))
				{
				    new string[1024];
                    format(string, sizeof(string), "{FFFFFF}\
						������� ����� �������� �����.\n\n\
						�������� ����� ������ ���� �� "SERVER"4-��{FFFFFF} �� "SERVER"12-��{FFFFFF} ��������.\n\
						�������� ����� �� ����� ��������� �������������� �����.\n\n\
						������� �������� �����: "SERVER"%s",
					SI[sMapName]);
					return SPD(playerid, dSettingServerNameMap, d_input, "{FFFFFF}������ ������������ | "SERVER"�������� �����", string, "�������", "<< �����");
				}
				FSCM(playerid, -1, "�� ������� ������� �������� ����� � "SERVER"%s{FFFFFF} �� "GREEN"%s{FFFFFF}", SI[sMapName], inputtext);
				new map[32];
				SetString(SI[sMapName], inputtext);
                update_str_mysql(T_SERVER, "sMapName", SI[sMapName], "sNumber", 1);
				format(map, sizeof(map), "mapname %s", SI[sMapName]);
				SendRconCommand(map); // �������� �����
			}
		}
	    case dSettingServerPassword: // ������ �������
	    {
            if(!response) return callcmd::ss(playerid);
			{
				new ServerPass = strlen(inputtext);
				if(!(4 <= ServerPass <= 32))
				{
				    new string[1024], stringPass[32];
					if(GetString(SI[sPassword], "None")) stringPass = ""GREEN"�����������";
			        else format(stringPass, sizeof(stringPass), "%s", SI[sPassword]);

					format(string, sizeof(string), "{FFFFFF}\
						������� ����� ������ �������.\n\
						������ ������� ����� ��� �������� ������� ��� ����� ������ ����������.\n\
						���-�� ������ ��������� ��� ����������� ����� �� �������.\n\n\
      					������� ������ ���� ������ �� ��������� ("SERVER"En{FFFFFF}) �������� � ���� �� "SERVER"5-��{FFFFFF} �� "SERVER"32-��{FFFFFF} ��������.\n\
	  					������� "SERVER"None{FFFFFF} ���� ������ ����� ������ � �������.\n\
						������� ������ �� �������: "SERVER"%s",
					stringPass);
					return SPD(playerid, dSettingServerPassword, d_input, "{FFFFFF}������ ������������ | "SERVER"������ �������", string, "�������", "<< �����");
				}
				FSCM(playerid, -1, "�� ������� ������� ������ ������� � "SERVER"%s{FFFFFF} �� "GREEN"%s{FFFFFF}", SI[sPassword], inputtext);
				SetString(SI[sPassword], inputtext);
                update_str_mysql(T_SERVER, "sPassword", SI[sPassword], "sNumber", 1);
			}
		}
	    case dSettingServerBonusCash: // �������� ������
	    {
            if(!response) return callcmd::ss(playerid);
			{
				new BonusMoney = strval(inputtext);
				if(!(15000 <= BonusMoney <= 1500000))
				{
				    new string[1024];
                    format(string, sizeof(string), "{FFFFFF}\
						������� ����� ����� �������� ������.\n\
						�������� ������ �������� ������� ��� �����������.\n\n\
						����� ������ ���� �� "GREEN"15.000 ������{FFFFFF} �� "GREEN"1.500.000 ������{FFFFFF}\n\n\
						������� ����� �������� ������: "GREEN"%s ������",
					ConvertCash(SI[sBonusMoney]));
					return SPD(playerid, dSettingServerBonusCash, d_input, "{FFFFFF}������ ������������ | "SERVER"�������� ������", string, "�������", "<< �����");
				}
				FSCM(playerid, -1, "�� ������� �������� ����� �������� ������ � "SERVER"%s ������{FFFFFF} �� "GREEN"%s ������{FFFFFF}", ConvertCash(SI[sBonusMoney]), ConvertCash(BonusMoney));
				SI[sBonusMoney] = BonusMoney;
                update_int_mysql(T_SERVER, "sBonusMoney", SI[sBonusMoney], "sNumber", 1);
			}
		}
	    case dSettingServerBonusLevel: // �������� �������
	    {
            if(!response) return callcmd::ss(playerid);
			{
				new BonusLevel = strval(inputtext);
				if(!(1 <= BonusLevel <= 10))
				{
				    new string[1024];
                    format(string, sizeof(string), "{FFFFFF}\
						������� ����� �������� �������.\n\
						�������� ������� ������� ������� ��� �����������.\n\n\
						�������� ������� ������ ���� �� "SERVER"1{FFFFFF} �� "SERVER"10{FFFFFF}\n\n\
						������� �������� �������: "SERVER"%i",
					SI[sBonusLevel]);
					return SPD(playerid, dSettingServerBonusLevel, d_input, "{FFFFFF}������ ������������ | "SERVER"�������� �������", string, "�������", "<< �����");
				}
				FSCM(playerid, -1, "�� ������� �������� �������� ������� � "SERVER"%i{FFFFFF} �� "GREEN"%i{FFFFFF}", SI[sBonusLevel], BonusLevel);
				SI[sBonusLevel] = BonusLevel;
                update_int_mysql(T_SERVER, "sBonusLevel", SI[sBonusLevel], "sNumber", 1);
			}
		}
	    case dSettingServerBonusDonat: // �������� �����
	    {
            if(!response) return callcmd::ss(playerid);
			{
				new BonusDonat = strval(inputtext);
				if(!(0 <= BonusDonat <= 1500))
				{
				    new string[1024];
                    format(string, sizeof(string), "{FFFFFF}\
						������� ����� ����� ��������� ������.\n\
						�������� ����� �������� ������� ��� �����������.\n\n\
						����� ������ ���� �� "SERVER"1 ��{FFFFFF} �� "SERVER"1.500 ��{FFFFFF}\n\n\
						������� ����� ��������� ������: "SERVER"%s ��",
					ConvertCash(SI[sBonusDonat]));
					return SPD(playerid, dSettingServerBonusDonat, d_input, "{FFFFFF}������ ������������ | "SERVER"�������� �����", string, "�������", "<< �����");
				}
				FSCM(playerid, -1, "�� ������� �������� �������� ����� � "SERVER"%s ��{FFFFFF} �� "GREEN"%s ��{FFFFFF}", ConvertCash(SI[sBonusDonat]), ConvertCash(BonusDonat));
				SI[sBonusDonat] = BonusDonat;
                update_int_mysql(T_SERVER, "sBonusDonat", SI[sBonusDonat], "sNumber", 1);
			}
		}
	    case dSettingServerXServer: // �������� �� �������
	    {
            if(!response) return callcmd::ss(playerid);
			{
				FSCM(playerid, -1, "�� ������� �������� �������� �� ������� � "SERVER"X%i{FFFFFF} �� "GREEN"X%i{FFFFFF}", SI[sX_Server], listitem+1);
                SI[sX_Server] = SI[sX_Exp] = SI[sX_JobPay] = SI[sX_PayDay] = SI[sX_Donat] = listitem+1;
                update_int_mysql(T_SERVER, "sX_Server", SI[sX_Server], "sNumber", 1);
                update_int_mysql(T_SERVER, "sX_Exp", SI[sX_Exp], "sNumber", 1);
                update_int_mysql(T_SERVER, "sX_JobPay", SI[sX_JobPay], "sNumber", 1);
                update_int_mysql(T_SERVER, "sX_PayDay", SI[sX_PayDay], "sNumber", 1);
                update_int_mysql(T_SERVER, "sX_Donat", SI[sX_Donat], "sNumber", 1);

                new nam[80];
				if(!GetString(SI[sObnova], "None") && SI[sX_PayDay] == 1) format(nam, sizeof(nam), "hostname %s | %s", SI[sName], SI[sObnova]); // �������� �������
			    else if(GetString(SI[sObnova], "None") && SI[sX_PayDay] > 1) format(nam, sizeof(nam), "hostname %s | X%i PayDay", SI[sName], SI[sX_PayDay]);
			    else if(!GetString(SI[sObnova], "None") && SI[sX_PayDay] > 1) format(nam, sizeof(nam), "hostname %s | %s | X%i PayDay", SI[sName], SI[sObnova], SI[sX_PayDay]); // �������� �������
				else format(nam, sizeof(nam), "hostname %s", SI[sName]);
				SendRconCommand(nam);

                return callcmd::ss(playerid);
			}
		}
	    case dSettingServerXexp: // �������� �����
	    {
            if(!response) return callcmd::ss(playerid);
			{
				FSCM(playerid, -1, "�� ������� �������� �������� ����� � "SERVER"X%i{FFFFFF} �� "GREEN"X%i{FFFFFF}", SI[sX_Exp], listitem+1);
                SI[sX_Exp] = listitem+1;
                update_int_mysql(T_SERVER, "sX_Exp", SI[sX_Exp], "sNumber", 1);
                return callcmd::ss(playerid);
			}
		}
	    case dSettingServerXjobPay: // �������� ������� �� �������
	    {
            if(!response) return callcmd::ss(playerid);
			{
				FSCM(playerid, -1, "�� ������� �������� �������� ������� �� ������� � "SERVER"X%i{FFFFFF} �� "GREEN"X%i{FFFFFF}", SI[sX_JobPay], listitem+1);
                SI[sX_JobPay] = listitem+1;
                update_int_mysql(T_SERVER, "sX_JobPay", SI[sX_JobPay], "sNumber", 1);
                return callcmd::ss(playerid);
			}
		}
	    case dSettingServerXfracPay: // �������� ������� � ������������
	    {
            if(!response) return callcmd::ss(playerid);
			{
				FSCM(playerid, -1, "�� ������� �������� �������� ������� � ������������ � "SERVER"X%i{FFFFFF} �� "GREEN"X%i{FFFFFF}", SI[sX_PayDay], listitem+1);
                SI[sX_PayDay] = listitem+1;
                update_int_mysql(T_SERVER, "sX_PayDay", SI[sX_PayDay], "sNumber", 1);

                new nam[80];
				if(!GetString(SI[sObnova], "None") && SI[sX_PayDay] == 1) format(nam, sizeof(nam), "hostname %s | %s", SI[sName], SI[sObnova]); // �������� �������
			    else if(GetString(SI[sObnova], "None") && SI[sX_PayDay] > 1) format(nam, sizeof(nam), "hostname %s | X%i PayDay", SI[sName], SI[sX_PayDay]);
			    else if(!GetString(SI[sObnova], "None") && SI[sX_PayDay] > 1) format(nam, sizeof(nam), "hostname %s | %s | X%i PayDay", SI[sName], SI[sObnova], SI[sX_PayDay]); // �������� �������
				else format(nam, sizeof(nam), "hostname %s", SI[sName]);
				SendRconCommand(nam);

                return callcmd::ss(playerid);
			}
		}
	    case dSettingServerXdonat: // �������� ������
	    {
            if(!response) return callcmd::ss(playerid);
			{
				FSCM(playerid, -1, "�� ������� �������� �������� ������ � "SERVER"X%i{FFFFFF} �� "GREEN"X%i{FFFFFF}", SI[sX_Donat], listitem+1);
                SI[sX_Donat] = listitem+1;
                update_int_mysql(T_SERVER, "sX_Donat", SI[sX_Donat], "sNumber", 1);
                return callcmd::ss(playerid);
			}
		}
		//
	}
	return 1;
}

public OnPlayerClickPlayer(playerid, clickedplayerid, source)
{
	return 1;
}

public OnPlayerClickMap(playerid, Float:fX, Float:fY, Float:fZ)
{
	return 1;
}

public OnPlayerEditAttachedObject(playerid, response, index, modelid, boneid, Float:fOffsetX, Float:fOffsetY, Float:fOffsetZ, Float:fRotX, Float:fRotY, Float:fRotZ, Float:fScaleX, Float:fScaleY, Float:fScaleZ)
{
	return 1;
}

public OnPlayerEditObject(playerid, playerobject, objectid, response, Float:fX, Float:fY, Float:fZ, Float:fRotX, Float:fRotY, Float:fRotZ)
{
	return 1;
}

public OnPlayerEditDynamicObject(playerid, objectid, response, Float:x, Float:y, Float:z, Float:rx, Float:ry, Float:rz)
{
	return 1;
}

public OnPlayerTakeDamage(playerid, issuerid, Float:amount, weaponid, bodypart) //  publics
{
	return 1;
}

public OnPlayerGiveDamage(playerid, damagedid, Float:amount, weaponid)
{
	return 1;
}

public OnPlayerClickTextDraw(playerid, Text:clickedid) // TextDraw ����������
{
    if(_:clickedid == INVALID_TEXT_DRAW)
    {
	}
	return 1;
}

public OnPlayerClickPlayerTextDraw(playerid, PlayerText:playertextid) // TextDraw ��� ������
{
	return 1;
}

public OnPlayerEnterDynamicArea(playerid, areaid)
{
	return 1;
}

public OnPlayerLeaveDynamicArea(playerid, areaid)
{
	return 1;
}
/* ============================== [ ����� �������� ] ======================== */

// ============================== [ ����� �������� ] ======================== //

stock LoadMySQLSettings() // �������� � ����� ������ MySQL
{
	new FileID = ini_openFile("mysql_connect.ini"), errCode;
	if(FileID < 0)
	{
		printf("������ ��� �������� ����� �������� MySQL. ��� ������: %d", FileID);
		return 0;
	}
	errCode = ini_getString(FileID,"mysql_host",MySQLSettings[mysql_Host]);

	if(errCode < 0) printf("������ ��� ������ ����� �������� MySQL (����). ��� ������: %d", errCode);
	errCode = ini_getString(FileID,"mysql_name",MySQLSettings[mysql_Name]);

	if(errCode < 0) printf("������ ��� ������ ����� �������� MySQL (������). ��� ������: %d", errCode);
	errCode = ini_getString(FileID,"mysql_pass",MySQLSettings[mysql_Pass]);

	if(errCode < 0) printf("������ ��� ������ ����� �������� MySQL (��� ������������). ��� ������: %d", errCode);
	errCode = ini_getString(FileID,"mysql_baza",MySQLSettings[mysql_Baza]);

	if(errCode < 0) printf("������ ��� ������ ����� �������� MySQL (���� ������). ��� ������: %d", errCode);
	ini_closeFile(FileID);
	return 1;
}

// ============================== [ ����� ���������� ] ====================== //

// ���������� ������
stock update_int_mysql(table[], strint[], sint, tableid[], id)
{
	new string[128];
	f("UPDATE %s SET `%s` = '%d' WHERE `%s` = '%d' LIMIT 1", table, strint, sint, tableid, id);
	mysql_tquery(mysql, string);
	return 1;
}

stock update_str_mysql(table[], strstrings[], strings[], tableid[], id)
{
	new string[128];
	f("UPDATE %s SET `%s` = '%s' WHERE `%s` = '%d' LIMIT 1", table, strstrings, strings, tableid, id);
	mysql_tquery(mysql, string);
	return 1;
}

stock update_float_mysql(table[], strfloat[], Float:faloat, tableid[], id)
{
	new string[128];
	format(string, sizeof(string), "UPDATE %s SET `%s` = '%f' WHERE `%s` = '%d' LIMIT 1", table, strfloat, faloat, tableid, id);
	mysql_tquery(mysql, string);
	return 1;
}

stock acc_int_strcat(query[], len, name[], number) // ��� Save
{
	new string[128];
    f("`%s` = '%d',", name, number);
	strcat(query, string, len);
    return 1;
}

stock acc_str_strcat(query[], len, name[], str[])  // ��� Save
{
	new string[128];
    f("`%s` = '%s',",name, str);
    strcat(query, string, len);
    return 1;
}

stock acc_float_strcat(query[], len, name[], Float:number)  // ��� Save
{
	new string[128];
    f("`%s` = '%f',", name, number);
    strcat(query, string, len);
    return 1;
}

// ============================== [ ����� ������ ] ========================== //

stock SetString(param_1[], param_2[], size = 300) return strmid(param_1, param_2, 0, strlen(param_2), size); // ������ ���������

stock GetString(param1[],param2[]) return !strcmp(param1, param2, false); // ������ ���������

stock Tkick(playerid)
{
	SetTimerEx("KickExx", 100, false, "d", playerid);
	return SCM(playerid, 0xFF0000AA, !"������� F6 � �������: /q (/quit) ��� ������ �� ����.");
}
publics KickExx(playerid) return Kick(playerid);

stock ConvertTime(number)
{
 	new hours = 0, mins = 0, secs = 0, string[30];
	hours = floatround(number / 3600);
	mins = floatround((number / 60) - (hours * 60));
	secs = floatround(number - ((hours * 3600) + (mins * 60)));
	if(hours > 0) format(string, 30, "%02d:%02d:%02d", hours, mins, secs);
	else format(string, 30, "%02d:%02d", mins, secs);
	// else if(secs > 0) format(string, 30, "%d �. %02d �.", mins, secs);
	return string;
}

stock ConvertCash(value)
{
    new string[24];
    format(string,sizeof(string), "%d" ,value);
    for(new i = (strlen(string) - 3); i > (value < 0 ? 1 : 0); i -= 3 ) strins(string[i], ".", 0);
    return string;
}

// ============================== [ ������� �������� ] ====================== //

publics LoadSettingServer()
{
	new time = GetTickCount();
	cache_get_row_count(rows);
	if(!rows)
	{
		mysql_tquery(mysql, "INSERT INTO "T_SERVER" \
		(`sName`, `sNumber`, `sObnova`, `sVersion`, `sWeb`, `sDonate`, `sForum`, `sGroup`, `sMapName`, `sLanguage`, `sPassword`, `sRconPass`, `sBonusMoney`, `sBonusLevel`, `sBonusDonat`) VALUES \
		('None RP', '1', 'None', 'v 0.0.1', 'none-rp.com', 'none-rp.com/donate', 'forum.none-rp.com', 'vk.com/none_rp', 'Criminal Russia', 'Russian', 'None', 'AWdawdawGJjk68AW55gtt', '5000', '1', '0')");
	}
	else
	{
        cache_get_value_name(0, "sName", SI[sName], 32);
        cache_get_value_name_int(0, "sNumber", SI[sNumber]);
        cache_get_value_name(0, "sNameServer", SI[sNameServer], 32);
        cache_get_value_name(0, "sObnova", SI[sObnova], 32);
        cache_get_value_name(0, "sVersion", SI[sVersion], 32);
        cache_get_value_name(0, "sWeb", SI[sWeb], 32);
        cache_get_value_name(0, "sDonate", SI[sDonate], 32);
        cache_get_value_name(0, "sForum", SI[sForum], 32);
        cache_get_value_name(0, "sGroup", SI[sGroup], 32);
        cache_get_value_name(0, "sMapName", SI[sMapName], 32);
        cache_get_value_name(0, "sLanguage", SI[sLanguage], 32);
        cache_get_value_name(0, "sPassword", SI[sPassword], 32);
        cache_get_value_name(0, "sRconPass", SI[sRconPass], 32);
        cache_get_value_name_int(0, "sBonusMoney", SI[sBonusMoney]);
        cache_get_value_name_int(0, "sBonusLevel", SI[sBonusLevel]);
        cache_get_value_name_int(0, "sBonusDonat", SI[sBonusDonat]);
        cache_get_value_name_int(0, "sX_Server", SI[sX_Server]);
        cache_get_value_name_int(0, "sX_Exp", SI[sX_Exp]);
        cache_get_value_name_int(0, "sX_JobPay", SI[sX_JobPay]);
        cache_get_value_name_int(0, "sX_PayDay", SI[sX_PayDay]);
        cache_get_value_name_int(0, "sX_Donat", SI[sX_Donat]);
        cache_get_value_name_int(0, "sEvent", SI[sEvent]);

		new nam[80], ver[32], web[32], r_pass[32], map[32], lan[32];
		print("\n  ______________________ [ �������� ���� ������� MySQL ] _____________________\n");

		if(GetString(SI[sObnova], "None")) format(nam, sizeof(nam), "hostname %s", SI[sName]);
	    else if(GetString(SI[sObnova], "None") && SI[sX_PayDay] >= 2) format(nam, sizeof(nam), "hostname %s | X%i PayDay", SI[sName], SI[sX_PayDay]);
	    else if(!GetString(SI[sObnova], "None") && SI[sX_PayDay] >= 2) format(nam, sizeof(nam), "hostname %s | %s | X%i PayDay", SI[sName], SI[sObnova], SI[sX_PayDay]);
		else format(nam, sizeof(nam), "hostname %s | %s", SI[sName], SI[sObnova]); // �������� �������
		SendRconCommand(nam);

		format(ver, sizeof(ver), "%s", SI[sVersion]);
		SetGameModeText(ver); // ������ ���������� - ����

		format(web, sizeof(web), "weburl %s", SI[sWeb]);
		SendRconCommand(web); // URL ����� �������

		format(r_pass, sizeof(r_pass), "rcon_password %s", SI[sRconPass]);
		SendRconCommand(r_pass); // ������� ������ �������

		format(map, sizeof(map), "mapname %s", SI[sMapName]);
		SendRconCommand(map); // �������� �����

		format(lan, sizeof(lan), "language %s", SI[sLanguage]);
		SendRconCommand(lan); // ���� �������
	}
	return printf("-> ��������� ������� ���������: %i ��%s", GetTickCount() - time, (!GetString(SI[sPassword], "None"))?(" - ������ ������ �� ����������� ������!"):(" "));
}

// ============================== [ ������� ��� ��������������� ] =========== //

CMD:settingserver(playerid)
{
	/*if(GetAdmin(playerid) < 12 && !FAI[playerid][faName]) return SEM(playerid, CMDOff);
	if(AI[playerid][aBlock]) return SEM(playerid, AdminBlock);
	if(!AdminLogin[playerid]) return SEM(playerid, AdminLoginOff);*/
	{
		new string[2048], str[1024], stringPass[32], stringObnova[32];
		if(GetString(SI[sPassword], "None")) stringPass = ""GREEN"�����������";
        else format(stringPass, sizeof(stringPass), "%s", SI[sPassword]);

		if(GetString(SI[sObnova], "None")) stringObnova = ""GREEN"�����������";
        else format(stringObnova, sizeof(stringObnova), "%s", SI[sObnova]);

		strcat(string, "�. ������������\t����������\n");
		format(str, sizeof(str), ""SERVER"1. {FFFFFF}�������� �������\t%s\n", SI[sName]); strcat(string, str);
		format(str, sizeof(str), ""SERVER"2. {FFFFFF}����� �������\t%i\n", SI[sNumber]); strcat(string, str);
		format(str, sizeof(str), ""SERVER"3. {FFFFFF}�������� �������\t%s\n", SI[sNameServer]); strcat(string, str);
		format(str, sizeof(str), ""SERVER"4. {FFFFFF}�������� ����������\t%s\n", stringObnova); strcat(string, str);
		format(str, sizeof(str), ""SERVER"5. {FFFFFF}������ ����������\t%s\n", SI[sVersion]); strcat(string, str);
		format(str, sizeof(str), ""SERVER"6. {FFFFFF}���� �������\t%s\n", SI[sWeb]); strcat(string, str);
		format(str, sizeof(str), ""SERVER"7. {FFFFFF}����� �������\t%s\n", SI[sDonate]); strcat(string, str);
		format(str, sizeof(str), ""SERVER"8. {FFFFFF}����� �������\t%s\n", SI[sForum]); strcat(string, str);
		format(str, sizeof(str), ""SERVER"9. {FFFFFF}������ �������\t%s\n", SI[sGroup]); strcat(string, str);
		format(str, sizeof(str), ""SERVER"10. {FFFFFF}�������� �����\t%s\n", SI[sMapName]); strcat(string, str);
		format(str, sizeof(str), ""SERVER"11. {FFFFFF}����\t%s\n", SI[sLanguage]); strcat(string, str);
		format(str, sizeof(str), ""SERVER"12. {FFFFFF}������ �������\t%s\n", stringPass); strcat(string, str);
		format(str, sizeof(str), ""SERVER"13. {FFFFFF}�������� ������\t%s ������\n", ConvertCash(SI[sBonusMoney])); strcat(string, str);
		format(str, sizeof(str), ""SERVER"14. {FFFFFF}�������� �������\t%i\n", SI[sBonusLevel]); strcat(string, str);
		format(str, sizeof(str), ""SERVER"15. {FFFFFF}�������� �����\t%s R-Coins\n", ConvertCash(SI[sBonusDonat])); strcat(string, str);
		format(str, sizeof(str), ""SERVER"16. {FFFFFF}�������� �� �������\tx%i\n", SI[sX_Server]); strcat(string, str);
		format(str, sizeof(str), ""SERVER"17. {FFFFFF}�������� �����\tx%i\n", SI[sX_Exp]); strcat(string, str);
		format(str, sizeof(str), ""SERVER"18. {FFFFFF}�������� ������� �� �������\tx%i\n", SI[sX_JobPay]); strcat(string, str);
		format(str, sizeof(str), ""SERVER"19. {FFFFFF}�������� ������� � ������������\tx%i\n", SI[sX_PayDay]); strcat(string, str);
		format(str, sizeof(str), ""SERVER"20. {FFFFFF}�������� ������\tx%i\n", SI[sX_Donat]); strcat(string, str);
		format(str, sizeof(str), ""SERVER"21. {FFFFFF}����������� �����\t%s\n", (!SI[sEvent])?(""GREY"��������"):(SI[sEvent]==1)?(""GREEN"����� ���"):(SI[sEvent]==2)?(""SERVER"9 ���"):(""PURPLE"��������")); strcat(string, str);
		SPD(playerid, dSettingServerMenu, d_tlisth, ""SERVER"������ ������������ - ��������� �������", string, "�������", "�������");
	}
	return 1;
}
CMD:ss(playerid) return callcmd::settingserver(playerid);

