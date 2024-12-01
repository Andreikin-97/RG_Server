main() {}
/* ___________________________________________________________________

Начало разработки проекта - (15.01.2020 в 19:16)
Название проекта: Redwich RolePlay

Разработчик (Основатель) проекта - Андрей Морозов - (Andreikin)

ГРП - (Главный разработчика проекта):
    1. Андрей Морозов (Andreikin)

Помощники ГРП:
    1. None - (None)
    2. None - (None)
    3. None - (None)
______________________________________________________________________ */

// Инклуды
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

// Дефайны сервера

#define  	sNAMES			"None RP" // - Название проекта
#define 	sSERVER_NAMES	"None" // - Название сервера
#define 	sNUMBER			"1" // - Номер сервера
#define 	sOBNOVA			"None" // - Название обновления
#define 	sVERSION 		"v 0.0.1" // - Версия мода (обновление) проекта
#define 	sWEBSITE 		"none-rp.com" // - Сайт проекта
#define 	sWEB_DONATE     "none-rp.com/donat" // - Донат проекта
#define 	sFORUM         	"forum.none-rp.com" // - Форум проекта
#define 	sGROUP         	"vk.com/none_rp" // - Группа проекта
#define 	sMAPNAME       	"Criminal Russia" // - Название карты
#define 	sLANGUAGE      	"Russian" // - Карта сервера
#define 	sRCON_PASS		"awldkawWAWdawWADWadawwd5648651654" // - RCON Пароль
#define 	sPASS 			"" // - Пароль сервера

// Таблицы сервера базы данных
#define     T_SERVER        "`server_setting`" //

// Цвета

#define 	cSERVER        	(0xFF9900FF)
#define 	SERVER         	"{FF9900}"

// Основной цвет
#define 	cWHITE        	0xFFFFFFAA // Белый
#define 	WHITE         	"{FFFFFF}"
#define 	cBLUE 			0x3399FFFF // Синий
#define     BLUE    		"{3399FF}"
#define 	cPURPLE 		0xDD90FFFF // Пурпурный
#define     PURPLE    		"{DD90FF}"
#define 	cLIME			0x66CC00FF // Салатовый
#define     LIME    		"{66CC00}"
#define 	cLIMEGREEN		0x32CD32FF // Салато-Зеленый
#define     LIMEGREEN    	"{32CD32}"
#define     cRED    		0xAA3333AA // Красный
#define     RED    			"{AA3333}"
#define 	cWAR	     	0xDF3C3CFF // Ошибка
#define 	WAR	        	"{DF3C3C}"
#define 	cGREEN 			0x63BD4EFF // Зеленый
#define     GREEN    		"{63BD4E}"
#define 	cGREY 			0xAFAFAFAA // Серый
#define     GREY    		"{AFAFAF}"
#define 	cYELLOW 		0xFFFF00FF // Желтый
#define     YELLOW    		"{FFFF00}"

// Макросы

#define	d_info 				DIALOG_STYLE_MSGBOX
#define	d_list 				DIALOG_STYLE_LIST
#define	d_pass 				DIALOG_STYLE_PASSWORD
#define	d_input         	DIALOG_STYLE_INPUT
// Только для 0.3.7 версии
#define d_tlist				DIALOG_STYLE_TABLIST
#define d_tlisth			DIALOG_STYLE_TABLIST_HEADERS
//

#define	SCM            		SendClientMessage
#define	SCMAll          	SendClientMessageToAll
#define	SPD             	ShowPlayerDialog
#define	FSCM(%1,%2,%3,%4)	do{new _s[128]; format(_s,128,%3,%4); SCM(%1,%2,_s); }while(FALSE)

#define	SEM     			SendErrorMessage
#define	SendErrorMessage(%0,%1) \
							SCM(%0, cWAR, "[ Ошибка ] {FFFFFF}"%1), PlayerPlaySound(playerid, 1085, 0.0, 0.0, 0.0)
#define	SCMInfo(%0,%1)		SCM(%0, cLIME, "[ Уведомление ] {FFFFFF}"%1), PlayerPlaySound(%0, 1083, 0.0, 0.0, 0.0)

#define for(%0,%1)   		for(new %0; %0 < %1; %0++)
#define f(  				format(string, sizeof(string),


#if !defined FALSE
							new stock bool:FALSE = false;
#endif
#if !defined IsValidVehicle
     						native IsValidVehicle(vehicleid);

#endif

#define LoginOff        	"Для начало авторезуйтесь!"
#define PlayerOff       	"Игрока нет на сервере!"
#define PlayerLoginOff  	"Игрок не авторизован!"
#define AdminLoginOff   	"Вы не авторизовались в админ - центре!"
#define AdminBlock          "Ваши права администратора заблокированы!"
#define PlayerID        	"Вы ввели свой ID!"
#define CMDOff          	"Команда не найдена! Все команды Вы найдете "SERVER"/mn(/menu){FFFFFF} > Команды сервера"
//
#define	OffStrelki(%0,%1)	TogglePlayerSpectating(%0, %1)
#define	Freeze(%0,%1)		TogglePlayerControllable(%0, %1)
#define	publics%0(%1)		forward%0(%1); public%0(%1)
//
#define PRESSED(%0) 		(((newkeys & (%0)) == (%0)) && ((oldkeys & (%0)) != (%0)))
#define RELEASED(%0) 		(((newkeys & (%0)) != (%0)) && ((oldkeys & (%0)) == (%0)))


// Переменные - простые
new
	MySQL: mysql, rows,
	year_s, month_s, day_s, // переменные даты
	hour_s, minute_s, second_s; // переменные времени

// Енумы
enum // Диалоги
{
    dNull,
    // Главные настройки сервера
    dSettingServerMenu, // Меню
    dSettingServerNameProject, // Название проекта
    dSettingServerNumber, // Номер сервера
    dSettingServerName, // Название сервера
    dSettingServerNameUpdate, // Название обновления
    dSettingServerUpdate, // Версия обновления
    dSettingServerWeb, // Сайт проекта
    dSettingServerWebDonat, // Сайт доната проекта
    dSettingServerForum, // Форум проекта
    dSettingServerGroup, // Группа ВКонтакте проекта
    dSettingServerNameMap, // Название карты
    dSettingServerPassword, // Пароль сервера
    dSettingServerBonusCash, // Бонусные деньги
    dSettingServerBonusLevel, // Бонусный уровень
    dSettingServerBonusDonat, // Бонусный донат
    dSettingServerXServer, // Удвоение на сервере
    dSettingServerXexp, // Удвоение опыта
    dSettingServerXjobPay, // Удвоение зарплат на работах
    dSettingServerXfracPay, // Удвоение зарплат в организациях
    dSettingServerXdonat // Удвоение доната
    //
};

enum MYSQL_SETTINGS // Подключение к базе данных MySQL
{
	mysql_Host, // Хостинг
	mysql_Name, // Имя пользователя
	mysql_Pass, // Пароль базы данных
	mysql_Baza // Имя базы данных
};
new MySQLSettings[MYSQL_SETTINGS][30];

enum Server_Info // Информацмя о проекте/сервере
{
	sName[32], // Название проекта
	sNumber, // Номер сервера
	sNameServer[12], // Название сервера
	sObnova[24], // Обнова сервера
	sVersion[12], // Версия сервера
	sWeb[24], // Сайт проекта
	sDonate[24], // Донат проекта
	sForum[24], // Форум проекта
	sGroup[24], // Группа проекта
	sMapName[24], // Название карты
	sLanguage[12], // Язык
	sPassword[32], // Пароль сервера
	sRconPass[32], // Главный пароль сервера
	// Бонус
	sBonusMoney, // Бонусные деньги
	sBonusLevel, // Бонусный уровень
	sBonusDonat, // Бонусный донат
	//
	sAdminPay, // Зарплата администратора
	sBankAdmin, // Банк администрации
	//
	sMineral, // Руды на шахте
	sMineralVagon, // Кол-во руды в вагоне на шахте
	sStatusVagon, // Статус вагона на шахте
	sDrova, //
	//
	sX_Server, // Удвоение на сервере
	sX_Exp, // Умножение опыта
	sX_JobPay, // Удвоение зарплат на работах
	sX_PayDay, // Удвоение зарплат в организациях
	sX_Donat, // Удвоение доната
 	//
 	sEvent, // Евент
};
new SI[Server_Info];

/* =========================== [ Начяло пабликов ] ============================ */
public OnGameModeInit()
{
	getdate(year_s, month_s, day_s); // Узнаем дату
	gettime(hour_s, minute_s, second_s); // Узнаем время
	SetWorldTime(hour_s); // Задаем время на сервере

	ShowNameTags(1); // Функция устанавливает видимость ников
	DisableInteriorEnterExits(); // Отключение всех стандартныых пикапов
	EnableStuntBonusForAll(0); // Отключение бонусы за прыжки и трюки
	SetNameTagDrawDistance(20.0); // Отображение имени игрока в радиусе
	SetGravity(0.008); // Стандартная гравитация сервера
	// ShowPlayerMarkers(1); Показать маркеры игроков на сервере
	// LimitPlayerMarkerRadius(100.0); Отображение маркера игрока на мини-карте в радиусе
	// ManualVehicleEngineAndLights(); Отключение автозаводка транспорта

	// Подключение к базе данных
	LoadMySQLSettings(); // Загрузка с базой данных MySQL

	mysql = mysql_connect(MySQLSettings[mysql_Host], MySQLSettings[mysql_Name], MySQLSettings[mysql_Pass], MySQLSettings[mysql_Baza]);
	mysql_log(WARNING | ERROR);// mysql_log(WARNING | ERROR);

	if(mysql_errno(mysql) != 0)
    {
    	printf("\nСервер не подключён к базе данных: %s", MySQLSettings[mysql_Baza]);
    	print("Запустите сервер с хостинга или с виртуальной машины!\n");
		SendRconCommand("exit");
    }
    else
	{
		printf("--- Соединение c MySQL базой данных [ %s ] подключено ---", MySQLSettings[mysql_Baza]);
		// Данные ниже не удолять!!!
		mysql_set_charset("cp1251");
		mysql_tquery(mysql, "SET CHARACTER SET 'utf8'", "", "");
		mysql_tquery(mysql, "SET NAMES 'utf8'", "", "");
		mysql_tquery(mysql, "SET character_set_client = 'cp1251'", "", "");
		mysql_tquery(mysql, "SET character_set_connection = 'cp1251'", "", "");
		mysql_tquery(mysql, "SET character_set_results = 'cp1251'", "", "");
		mysql_tquery(mysql, "SET SESSION collation_connection = 'utf8_general_ci'", "", "");
		//

        mysql_tquery(mysql, "SELECT * FROM "T_SERVER"", "LoadSettingServer", ""); // Настройки сервера
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
		// Главные настройки сервера
		case dSettingServerMenu: // Меню
	    {
	        if(!response)return 1;
	        {
				new string[512];
				switch(listitem)
				{
				    case 0: // Название проекта
				    {
						format(string, sizeof(string), "{FFFFFF}\
							Укажите новое название проекта.\n\n\
							Название проекта должно быть от "SERVER"4-ех{FFFFFF} до "SERVER"32-ух{FFFFFF} символов.\n\
							Название проекта не долно содержать оскорбительной формы.\n\n\
							Текущее название проекта: "SERVER"%s",
						SI[sName]);
						SPD(playerid, dSettingServerNameProject, d_input, "{FFFFFF}Панель разработчика | "SERVER"Название проекта", string, "Сменить", "<< Назад");
					}
				    case 1: // Номер сервера
				    {
						format(string, sizeof(string), "{FFFFFF}\
							Укажите новый номер сервера.\n\n\
							Текущий номер сервера: "SERVER"%i",
						SI[sNumber]);
						SPD(playerid, dSettingServerNumber, d_input, "{FFFFFF}Панель разработчика | "SERVER"Номер сервера", string, "Сменить", "<< Назад");
					}
				    case 2: // Название сервера
				    {
						format(string, sizeof(string), "{FFFFFF}\
							Укажите новое название сервера.\n\n\
							Название сервера должно быть от "SERVER"4-ех{FFFFFF} до "SERVER"12-ух{FFFFFF} символов.\n\
							Название сервера не долно содержать оскорбительной формы.\n\n\
							Текущее название сервера: "SERVER"%s",
						SI[sNameServer]);
						SPD(playerid, dSettingServerName, d_input, "{FFFFFF}Панель разработчика | "SERVER"Название сервера", string, "Сменить", "<< Назад");
					}
				    case 3: // Название обновления
				    {
				        new stringObnova[32];
				        if(GetString(SI[sObnova], "None")) stringObnova = ""GREEN"Отсутствует";
        				else format(stringObnova, sizeof(stringObnova), "%s", SI[sObnova]);

						format(string, sizeof(string), "{FFFFFF}\
							Укажите новое название обновления.\n\n\
							Название обновления должно быть от "SERVER"4-ех{FFFFFF} до "SERVER"32-ух{FFFFFF} символов.\n\
							Название обновления не долно содержать оскорбительной формы.\n\
							Укажите "SERVER"None{FFFFFF} если хотите снять убрать название обновления.\n\n\
							Текущее название обновления: "SERVER"%s",
						stringObnova);
						SPD(playerid, dSettingServerNameUpdate, d_input, "{FFFFFF}Панель разработчика | "SERVER"Название обновления", string, "Сменить", "<< Назад");
					}
				    case 4: // Версия обновления
				    {
						format(string, sizeof(string), "{FFFFFF}\
							Укажите новую версию обновления.\n\n\
							Версия обновления должна быть пример: "SERVER"v 0.0.1\n\
							Текущая версия обновления: "SERVER"%s",
						SI[sVersion]);
						SPD(playerid, dSettingServerUpdate, d_input, "{FFFFFF}Панель разработчика | "SERVER"Версия обновления", string, "Сменить", "<< Назад");
					}
				    case 5: // Сайт проекта
				    {
						format(string, sizeof(string), "{FFFFFF}\
							Укажите новый "SERVER"URL{FFFFFF} сайта проекта.\n\
							"SERVER"URL{FFFFFF} не должен содержать следующие элементы ("SERVER"http://{FFFFFF} или "SERVER"https://{FFFFFF}).\n\n\
							Текущий "SERVER"URL{FFFFFF} сайта проекта: "SERVER"%s",
						SI[sWeb]);
						SPD(playerid, dSettingServerWeb, d_input, "{FFFFFF}Панель разработчика | "SERVER"Сайт проекта", string, "Сменить", "<< Назад");
					}
				    case 6: // Сайт доната проекта
				    {
						format(string, sizeof(string), "{FFFFFF}\
							Укажите новый "SERVER"URL{FFFFFF} сайта с донатом проекта.\n\
							"SERVER"URL{FFFFFF} не должен содержать следующие элементы ("SERVER"http://{FFFFFF} или "SERVER"https://{FFFFFF}).\n\n\
							Текущий "SERVER"URL{FFFFFF} сайта с донатом проекта: "SERVER"%s",
						SI[sDonate]);
						SPD(playerid, dSettingServerWebDonat, d_input, "{FFFFFF}Панель разработчика | "SERVER"Сайт доната проекта", string, "Сменить", "<< Назад");
					}
				    case 7: // Форум проекта
				    {
						format(string, sizeof(string), "{FFFFFF}\
							Укажите новый "SERVER"URL{FFFFFF} форума проекта.\n\
							"SERVER"URL{FFFFFF} не должен содержать следующие элементы ("SERVER"http://{FFFFFF} или "SERVER"https://{FFFFFF}).\n\n\
							Текущий "SERVER"URL{FFFFFF} форума проекта: "SERVER"%s",
						SI[sForum]);
						SPD(playerid, dSettingServerForum, d_input, "{FFFFFF}Панель разработчика | "SERVER"Форум проекта", string, "Сменить", "<< Назад");
					}
				    case 8: // Группа ВКонтакте проекта
				    {
						format(string, sizeof(string), "{FFFFFF}\
							Укажите новый "SERVER"URL{FFFFFF} группы "SERVER"ВК{FFFFFF} проекта.\n\
							"SERVER"URL{FFFFFF} не должен содержать следующие элементы ("SERVER"http://{FFFFFF} или "SERVER"https://{FFFFFF}).\n\n\
							Текущий "SERVER"URL{FFFFFF} группы "SERVER"ВК{FFFFFF} проекта: "SERVER"%s",
						SI[sGroup]);
						SPD(playerid, dSettingServerGroup, d_input, "{FFFFFF}Панель разработчика | "SERVER"Группа ВКонтакте проекта", string, "Сменить", "<< Назад");
					}
				    case 9: // Название карты
				    {
						format(string, sizeof(string), "{FFFFFF}\
							Укажите новое название карты.\n\n\
							Название карты должно быть от "SERVER"4-ех{FFFFFF} до "SERVER"12-ух{FFFFFF} символов.\n\
							Название карты не долно содержать оскорбительной формы.\n\n\
							Текущее название карты: "SERVER"%s",
						SI[sMapName]);
						SPD(playerid, dSettingServerNameMap, d_input, "{FFFFFF}Панель разработчика | "SERVER"Название карты", string, "Сменить", "<< Назад");
					}
				    case 10: return callcmd::ss(playerid); // Язык
				    case 11: // Пароль сервера
				    {
						new stringPass[32];
						if(GetString(SI[sPassword], "None")) stringPass = ""GREEN"Отсутствует";
				        else format(stringPass, sizeof(stringPass), "%s", SI[sPassword]);

						format(string, sizeof(string), "{FFFFFF}\
							Укажите новый пароль сервера.\n\
							Пароль сервера нужен для закрытия сервера при вводе нового обновления.\n\
							Так-же пароль необходим для технических работ на сервере.\n\n\
	      					Паротль должен быть только из латинских ("SERVER"En{FFFFFF}) символов и цыфр от "SERVER"5-ти{FFFFFF} до "SERVER"32-ух{FFFFFF} символов.\n\
		  					Укажите "SERVER"None{FFFFFF} если хотите снять пароль с сервера.\n\n\
							Текущий пароль от сервера: "SERVER"%s",
						stringPass);
						SPD(playerid, dSettingServerPassword, d_input, "{FFFFFF}Панель разработчика | "SERVER"Пароль сервера", string, "Сменить", "<< Назад");
					}
				    case 12: // Бонусные деньги
				    {
						format(string, sizeof(string), "{FFFFFF}\
							Укажите новую сумму бонусных рублей.\n\
							Бонусные деньги выдаются игрокам при регистрации.\n\n\
							Сумма должна быть от "GREEN"15.000 рублей{FFFFFF} до "GREEN"1.500.000 рублей{FFFFFF}\n\n\
							Текущая сумма бонусных рублей: "GREEN"%s рублей",
						ConvertCash(SI[sBonusMoney]));
						SPD(playerid, dSettingServerBonusCash, d_input, "{FFFFFF}Панель разработчика | "SERVER"Бонусные деньги", string, "Сменить", "<< Назад");
					}
				    case 13: // Бонусный уровень
				    {
						format(string, sizeof(string), "{FFFFFF}\
							Укажите новый бонусный уровень.\n\
							Бонусный уровень выдаётся игрокам при регистрации.\n\n\
							Бонусный уровень должен быть от "SERVER"1{FFFFFF} до "SERVER"10{FFFFFF}\n\n\
							Текущий бонусный уровень: "SERVER"%i",
						SI[sBonusLevel]);
						SPD(playerid, dSettingServerBonusLevel, d_input, "{FFFFFF}Панель разработчика | "SERVER"Бонусный уровень", string, "Сменить", "<< Назад");
					}
				    case 14: // Бонусный донат
				    {
						format(string, sizeof(string), "{FFFFFF}\
							Укажите новую сумму бонусного доната.\n\
							Бонусный донат выдаются игрокам при регистрации.\n\n\
							Сумма должна быть от "SERVER"500 ДО{FFFFFF} до "SERVER"1.500 ДО{FFFFFF}\n\n\
							Текущая сумма бонусного доната: "SERVER"%s ДО",
						ConvertCash(SI[sBonusDonat]));
						SPD(playerid, dSettingServerBonusDonat, d_input, "{FFFFFF}Панель разработчика | "SERVER"Бонусный донат", string, "Сменить", "<< Назад");
					}
				    case 15: // Удвоение на сервере
				    {
						format(string, sizeof(string), "{FFFFFF}\
						X1\n\
						X2\n\
						X3\n\
						X4",
						SI[sX_Server]);
						SPD(playerid, dSettingServerXServer, d_list, "{FFFFFF}Панель разработчика | "SERVER"Удвоение на сервере", string, "Сменить", "<< Назад");
					}
				    case 16: // Удвоение опыта
				    {
						format(string, sizeof(string), "{FFFFFF}\
						X1\n\
						X2\n\
						X3\n\
						X4",
						SI[sX_Exp]);
						SPD(playerid, dSettingServerXexp, d_list, "{FFFFFF}Панель разработчика | "SERVER"Удвоение опыта", string, "Сменить", "<< Назад");
					}
				    case 17: // Удвоение зарплат на работах
				    {
						format(string, sizeof(string), "{FFFFFF}\
						X1\n\
						X2\n\
						X3\n\
						X4",
						SI[sX_JobPay]);
						SPD(playerid, dSettingServerXjobPay, d_list, "{FFFFFF}Панель разработчика | "SERVER"Удвоение зарплат на работах", string, "Сменить", "<< Назад");
					}
				    case 18: // Удвоение зарплат в организациях
				    {
						format(string, sizeof(string), "{FFFFFF}\
						X1\n\
						X2\n\
						X3\n\
						X4",
						SI[sX_PayDay]);
						SPD(playerid, dSettingServerXfracPay, d_list, "{FFFFFF}Панель разработчика | "SERVER"Удвоение зарплат в организациях", string, "Сменить", "<< Назад");
					}
				    case 19: // Удвоение доната
				    {
						format(string, sizeof(string), "{FFFFFF}\
						X1\n\
						X2\n\
						X3\n\
						X4",
						SI[sX_Donat]);
						SPD(playerid, dSettingServerXdonat, d_list, "{FFFFFF}Панель разработчика | "SERVER"Удвоение доната", string, "Сменить", "<< Назад");
					}
					case 20: // Праздничный Ивент
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
		case dSettingServerNameProject: // Название проекта
	    {
            if(!response) return callcmd::ss(playerid);
			{
				new NameProject = strlen(inputtext);
				if(!(4 <= NameProject <= 32))
				{
				    new string[1024];
                    format(string, sizeof(string), "{FFFFFF}\
						Укажите новое название проекта.\n\n\
						Название проекта должно быть от "SERVER"4-ех{FFFFFF} до "SERVER"32-ух{FFFFFF} символов.\n\
						Название проекта не долно содержать оскорбительной формы.\n\n\
						Текущее название проекта: "SERVER"%s",
					SI[sName]);
					return SPD(playerid, dSettingServerNameProject, d_input, "{FFFFFF}Панель разработчика | "SERVER"Название проекта", string, "Сменить", "<< Назад");
				}
				FSCM(playerid, -1, "Вы успешно сменили название проекта с "SERVER"%s{FFFFFF} на "GREEN"%s{FFFFFF}", SI[sName], inputtext);

				new nam[80];
				SetString(SI[sName], inputtext);
                update_str_mysql(T_SERVER, "sName", SI[sName], "sNumber", 1);

				if(!GetString(SI[sObnova], "None") && SI[sX_PayDay] == 1) format(nam, sizeof(nam), "hostname %s | %s", SI[sName], SI[sObnova]); // Название проекта
			    else if(GetString(SI[sObnova], "None") && SI[sX_PayDay] > 1) format(nam, sizeof(nam), "hostname %s | X%i PayDay", SI[sName], SI[sX_PayDay]);
			    else if(!GetString(SI[sObnova], "None") && SI[sX_PayDay] > 1) format(nam, sizeof(nam), "hostname %s | %s | X%i PayDay", SI[sName], SI[sObnova], SI[sX_PayDay]); // Название проекта
				else format(nam, sizeof(nam), "hostname %s", SI[sName]);
				SendRconCommand(nam);
			}
		}
	    case dSettingServerNumber: // Номер сервера
	    {
            if(!response) return callcmd::ss(playerid);
			{
				new ServerNumber = strval(inputtext);
				if(!(1 <= ServerNumber <= 5))
				{
				    new string[1024];
					format(string, sizeof(string), "{FFFFFF}\
						Укажите новый номер сервера.\n\n\
						Текущий номер сервера: "SERVER"%i",
					SI[sNumber]);
					return SPD(playerid, dSettingServerNumber, d_input, "{FFFFFF}Панель разработчика | "SERVER"Номер сервера", string, "Сменить", "<< Назад");
				}
				FSCM(playerid, -1, "Вы успешно сменили номер сервера с "SERVER"%i{FFFFFF} на "GREEN"%i{FFFFFF}", SI[sNumber], ServerNumber);
				SI[sNumber] = ServerNumber;
                update_int_mysql(T_SERVER, "sNumber", SI[sNumber], "sNumber", 1);
			}
		}
	    case dSettingServerName: // Название сервера
	    {
            if(!response) return callcmd::ss(playerid);
			{
				new NameServer = strlen(inputtext);
				if(!(4 <= NameServer <= 32))
				{
				    new string[1024];
					format(string, sizeof(string), "{FFFFFF}\
						Укажите новое название сервера.\n\n\
						Название сервера должно быть от "SERVER"4-ех{FFFFFF} до "SERVER"12-ух{FFFFFF} символов.\n\
						Название сервера не долно содержать оскорбительной формы.\n\n\
						Текущее название сервера: "SERVER"%s",
					SI[sNameServer]);
					return SPD(playerid, dSettingServerName, d_input, "{FFFFFF}Панель разработчика | "SERVER"Название сервера", string, "Сменить", "<< Назад");
				}
				FSCM(playerid, -1, "Вы успешно сменили название сервера с "SERVER"%s{FFFFFF} на "GREEN"%s{FFFFFF}", SI[sNameServer], inputtext);
				SetString(SI[sNameServer], inputtext);

                update_str_mysql(T_SERVER, "sNameServer", SI[sNameServer], "sNumber", 1);
			}
		}
	    case dSettingServerNameUpdate: // Название обновления
	    {
            if(!response) return callcmd::ss(playerid);
			{
				new NameUpdate = strlen(inputtext);
				if(!(4 <= NameUpdate <= 32))
				{
				    new string[1024], stringObnova[32];
			        if(GetString(SI[sObnova], "None")) stringObnova = ""GREEN"Отсутствует";
    				else format(stringObnova, sizeof(stringObnova), "%s", SI[sObnova]);

                    format(string, sizeof(string), "{FFFFFF}\
						Укажите новое название обновления.\n\n\
						Название обновления должно быть от "SERVER"4-ех{FFFFFF} до "SERVER"32-ух{FFFFFF} символов.\n\
						Название обновления не долно содержать оскорбительной формы.\n\
						Укажите "SERVER"None{FFFFFF} если хотите снять убрать название обновления.\n\n\
						Текущее название обновления: "SERVER"%s",
					stringObnova);
					return SPD(playerid, dSettingServerNameUpdate, d_input, "{FFFFFF}Панель разработчика | "SERVER"Название обновления", string, "Сменить", "<< Назад");
				}
				FSCM(playerid, -1, "Вы успешно сменили название обновления с "SERVER"%s{FFFFFF} на "GREEN"%s{FFFFFF}", SI[sObnova], inputtext);
				SetString(SI[sObnova], inputtext);
                update_str_mysql(T_SERVER, "sObnova", SI[sObnova], "sNumber", 1);

				new nam[80];
				if(!GetString(SI[sObnova], "None") && SI[sX_PayDay] == 1) format(nam, sizeof(nam), "hostname %s | %s", SI[sName], SI[sObnova]); // Название проекта
			    else if(GetString(SI[sObnova], "None") && SI[sX_PayDay] > 1) format(nam, sizeof(nam), "hostname %s | X%i PayDay", SI[sName], SI[sX_PayDay]);
			    else if(!GetString(SI[sObnova], "None") && SI[sX_PayDay] > 1) format(nam, sizeof(nam), "hostname %s | %s | X%i PayDay", SI[sName], SI[sObnova], SI[sX_PayDay]); // Название проекта
				else format(nam, sizeof(nam), "hostname %s", SI[sName]);
				SendRconCommand(nam);
			}
		}
		case dSettingServerUpdate: // Версия обновления
	    {
            if(!response) return callcmd::ss(playerid);
			{
				new NameVersion = strlen(inputtext);
				if(!(6 <= NameVersion <= 12))
				{
				    new string[1024];
					format(string, sizeof(string), "{FFFFFF}\
						Укажите новую версию обновления.\n\n\
						Версия обновления должна быть пример: "SERVER"v 0.0.1\n\
						Текущая версия обновления: "SERVER"%s",
					SI[sVersion]);
					return SPD(playerid, dSettingServerUpdate, d_input, "{FFFFFF}Панель разработчика | "SERVER"Версия обновления", string, "Сменить", "<< Назад");
				}
				FSCM(playerid, -1, "Вы успешно сменили версию обновления с "SERVER"%s{FFFFFF} на "GREEN"%s{FFFFFF}", SI[sVersion], inputtext);
				new ver[32];
				SetString(SI[sVersion], inputtext);
                update_str_mysql(T_SERVER, "sVersion", SI[sVersion], "sNumber", 1);
				format(ver, sizeof(ver), "%s", SI[sVersion]);
				SetGameModeText(ver); // Версия обновления - мода
			}
		}
	    case dSettingServerWeb: // Сайт проекта
	    {
            if(!response) return callcmd::ss(playerid);
			{
				new NameWeb = strlen(inputtext);
				if(!(6 <= NameWeb <= 32))
				{
				    new string[1024];
                    format(string, sizeof(string), "{FFFFFF}\
						Укажите новый "SERVER"URL{FFFFFF} сайта проекта.\n\
						"SERVER"URL{FFFFFF} не должен содержать следующие элементы ("SERVER"http://{FFFFFF} или "SERVER"https://{FFFFFF}).\n\n\
						Текущий "SERVER"URL{FFFFFF} сайта проекта: "SERVER"%s",
					SI[sWeb]);
					return SPD(playerid, dSettingServerWeb, d_input, "{FFFFFF}Панель разработчика | "SERVER"Сайт проекта", string, "Сменить", "<< Назад");
				}
				FSCM(playerid, -1, "Вы успешно сменили URL сайта проекта с "SERVER"%s{FFFFFF} на "GREEN"%s{FFFFFF}", SI[sWeb], inputtext);
				new web[32];
				SetString(SI[sWeb], inputtext);
                update_str_mysql(T_SERVER, "sWeb", SI[sWeb], "sNumber", 1);
				format(web, sizeof(web), "weburl %s", SI[sWeb]);
				SendRconCommand(web); // URL сайта проекта
			}
		}
	    case dSettingServerWebDonat: // Сайт доната проекта
	    {
            if(!response) return callcmd::ss(playerid);
			{
				new NameWebDonat = strlen(inputtext);
				if(!(6 <= NameWebDonat <= 32))
				{
				    new string[1024];
                    format(string, sizeof(string), "{FFFFFF}\
						Укажите новый "SERVER"URL{FFFFFF} сайта с донатом проекта.\n\
						"SERVER"URL{FFFFFF} не должен содержать следующие элементы ("SERVER"http://{FFFFFF} или "SERVER"https://{FFFFFF}).\n\n\
						Текущий "SERVER"URL{FFFFFF} сайта с донатом проекта: "SERVER"%s",
					SI[sDonate]);
					return SPD(playerid, dSettingServerWebDonat, d_input, "{FFFFFF}Панель разработчика | "SERVER"Сайт доната проекта", string, "Сменить", "<< Назад");
				}
				FSCM(playerid, -1, "Вы успешно сменили URL сайта с донатом проекта с "SERVER"%s{FFFFFF} на "GREEN"%s{FFFFFF}", SI[sDonate], inputtext);
				SetString(SI[sDonate], inputtext);
                update_str_mysql(T_SERVER, "sDonate", SI[sDonate], "sNumber", 1);
			}
		}
	    case dSettingServerForum: // Форум проекта
	    {
            if(!response) return callcmd::ss(playerid);
			{
				new NameForum = strlen(inputtext);
				if(!(6 <= NameForum <= 32))
				{
				    new string[1024];
                    format(string, sizeof(string), "{FFFFFF}\
						Укажите новый "SERVER"URL{FFFFFF} форума проекта.\n\
						"SERVER"URL{FFFFFF} не должен содержать следующие элементы ("SERVER"http://{FFFFFF} или "SERVER"https://{FFFFFF}).\n\n\
						Текущий "SERVER"URL{FFFFFF} форума проекта: "SERVER"%s",
					SI[sForum]);
					return SPD(playerid, dSettingServerForum, d_input, "{FFFFFF}Панель разработчика | "SERVER"Форум проекта", string, "Сменить", "<< Назад");
				}
				FSCM(playerid, -1, "Вы успешно сменили URL форума проекта с "SERVER"%s{FFFFFF} на "GREEN"%s{FFFFFF}", SI[sForum], inputtext);
				SetString(SI[sForum], inputtext);
                update_str_mysql(T_SERVER, "sForum", SI[sForum], "sNumber", 1);
			}
		}
	    case dSettingServerGroup: // Группа ВКонтакте проекта
	    {
            if(!response) return callcmd::ss(playerid);
			{
				new NameGroup = strlen(inputtext);
				if(!(6 <= NameGroup <= 32))
				{
				    new string[1024];
                    format(string, sizeof(string), "{FFFFFF}\
						Укажите новый "SERVER"URL{FFFFFF} группы "SERVER"ВК{FFFFFF} проекта.\n\
						"SERVER"URL{FFFFFF} не должен содержать следующие элементы ("SERVER"http://{FFFFFF} или "SERVER"https://{FFFFFF}).\n\n\
						Текущий "SERVER"URL{FFFFFF} группы "SERVER"ВК{FFFFFF} проекта: "SERVER"%s",
					SI[sGroup]);
					return SPD(playerid, dSettingServerGroup, d_input, "{FFFFFF}Панель разработчика | "SERVER"Группа ВКонтакте проекта", string, "Сменить", "<< Назад");
				}
				FSCM(playerid, -1, "Вы успешно сменили URL группы ВК проекта с "SERVER"%s{FFFFFF} на "GREEN"%s{FFFFFF}", SI[sGroup], inputtext);
				SetString(SI[sGroup], inputtext);
                update_str_mysql(T_SERVER, "sGroup", SI[sGroup], "sNumber", 1);
			}
		}
	    case dSettingServerNameMap: // Название карты
	    {
            if(!response) return callcmd::ss(playerid);
			{
				new NameMap = strlen(inputtext);
				if(!(4 <= NameMap <= 12))
				{
				    new string[1024];
                    format(string, sizeof(string), "{FFFFFF}\
						Укажите новое название карты.\n\n\
						Название карты должно быть от "SERVER"4-ех{FFFFFF} до "SERVER"12-ух{FFFFFF} символов.\n\
						Название карты не долно содержать оскорбительной формы.\n\n\
						Текущее название карты: "SERVER"%s",
					SI[sMapName]);
					return SPD(playerid, dSettingServerNameMap, d_input, "{FFFFFF}Панель разработчика | "SERVER"Название карты", string, "Сменить", "<< Назад");
				}
				FSCM(playerid, -1, "Вы успешно сменили название карты с "SERVER"%s{FFFFFF} на "GREEN"%s{FFFFFF}", SI[sMapName], inputtext);
				new map[32];
				SetString(SI[sMapName], inputtext);
                update_str_mysql(T_SERVER, "sMapName", SI[sMapName], "sNumber", 1);
				format(map, sizeof(map), "mapname %s", SI[sMapName]);
				SendRconCommand(map); // Название карты
			}
		}
	    case dSettingServerPassword: // Пароль сервера
	    {
            if(!response) return callcmd::ss(playerid);
			{
				new ServerPass = strlen(inputtext);
				if(!(4 <= ServerPass <= 32))
				{
				    new string[1024], stringPass[32];
					if(GetString(SI[sPassword], "None")) stringPass = ""GREEN"Отсутствует";
			        else format(stringPass, sizeof(stringPass), "%s", SI[sPassword]);

					format(string, sizeof(string), "{FFFFFF}\
						Укажите новый пароль сервера.\n\
						Пароль сервера нужен для закрытия сервера при вводе нового обновления.\n\
						Так-же пароль необходим для технических работ на сервере.\n\n\
      					Паротль должен быть только из латинских ("SERVER"En{FFFFFF}) символов и цыфр от "SERVER"5-ти{FFFFFF} до "SERVER"32-ух{FFFFFF} символов.\n\
	  					Укажите "SERVER"None{FFFFFF} если хотите снять пароль с сервера.\n\
						Текущий пароль от сервера: "SERVER"%s",
					stringPass);
					return SPD(playerid, dSettingServerPassword, d_input, "{FFFFFF}Панель разработчика | "SERVER"Пароль сервера", string, "Сменить", "<< Назад");
				}
				FSCM(playerid, -1, "Вы успешно сменили пароль сервера с "SERVER"%s{FFFFFF} на "GREEN"%s{FFFFFF}", SI[sPassword], inputtext);
				SetString(SI[sPassword], inputtext);
                update_str_mysql(T_SERVER, "sPassword", SI[sPassword], "sNumber", 1);
			}
		}
	    case dSettingServerBonusCash: // Бонусные деньги
	    {
            if(!response) return callcmd::ss(playerid);
			{
				new BonusMoney = strval(inputtext);
				if(!(15000 <= BonusMoney <= 1500000))
				{
				    new string[1024];
                    format(string, sizeof(string), "{FFFFFF}\
						Укажите новую сумму бонусных рублей.\n\
						Бонусные деньги выдаются игрокам при регистрации.\n\n\
						Сумма должна быть от "GREEN"15.000 рублей{FFFFFF} до "GREEN"1.500.000 рублей{FFFFFF}\n\n\
						Текущая сумма бонусных рублей: "GREEN"%s рублей",
					ConvertCash(SI[sBonusMoney]));
					return SPD(playerid, dSettingServerBonusCash, d_input, "{FFFFFF}Панель разработчика | "SERVER"Бонусные деньги", string, "Сменить", "<< Назад");
				}
				FSCM(playerid, -1, "Вы успешно изменили сумму бонусных рублей с "SERVER"%s рублей{FFFFFF} на "GREEN"%s рублей{FFFFFF}", ConvertCash(SI[sBonusMoney]), ConvertCash(BonusMoney));
				SI[sBonusMoney] = BonusMoney;
                update_int_mysql(T_SERVER, "sBonusMoney", SI[sBonusMoney], "sNumber", 1);
			}
		}
	    case dSettingServerBonusLevel: // Бонусный уровень
	    {
            if(!response) return callcmd::ss(playerid);
			{
				new BonusLevel = strval(inputtext);
				if(!(1 <= BonusLevel <= 10))
				{
				    new string[1024];
                    format(string, sizeof(string), "{FFFFFF}\
						Укажите новый бонусный уровень.\n\
						Бонусный уровень выдаётся игрокам при регистрации.\n\n\
						Бонусный уровень должен быть от "SERVER"1{FFFFFF} до "SERVER"10{FFFFFF}\n\n\
						Текущий бонусный уровень: "SERVER"%i",
					SI[sBonusLevel]);
					return SPD(playerid, dSettingServerBonusLevel, d_input, "{FFFFFF}Панель разработчика | "SERVER"Бонусный уровень", string, "Сменить", "<< Назад");
				}
				FSCM(playerid, -1, "Вы успешно изменили бонусный уровень с "SERVER"%i{FFFFFF} на "GREEN"%i{FFFFFF}", SI[sBonusLevel], BonusLevel);
				SI[sBonusLevel] = BonusLevel;
                update_int_mysql(T_SERVER, "sBonusLevel", SI[sBonusLevel], "sNumber", 1);
			}
		}
	    case dSettingServerBonusDonat: // Бонусный донат
	    {
            if(!response) return callcmd::ss(playerid);
			{
				new BonusDonat = strval(inputtext);
				if(!(0 <= BonusDonat <= 1500))
				{
				    new string[1024];
                    format(string, sizeof(string), "{FFFFFF}\
						Укажите новую сумму бонусного доната.\n\
						Бонусный донат выдаются игрокам при регистрации.\n\n\
						Сумма должна быть от "SERVER"1 ДО{FFFFFF} до "SERVER"1.500 ДО{FFFFFF}\n\n\
						Текущая сумма бонусного доната: "SERVER"%s ДО",
					ConvertCash(SI[sBonusDonat]));
					return SPD(playerid, dSettingServerBonusDonat, d_input, "{FFFFFF}Панель разработчика | "SERVER"Бонусный донат", string, "Сменить", "<< Назад");
				}
				FSCM(playerid, -1, "Вы успешно изменили бонусный донат с "SERVER"%s ДО{FFFFFF} на "GREEN"%s ДО{FFFFFF}", ConvertCash(SI[sBonusDonat]), ConvertCash(BonusDonat));
				SI[sBonusDonat] = BonusDonat;
                update_int_mysql(T_SERVER, "sBonusDonat", SI[sBonusDonat], "sNumber", 1);
			}
		}
	    case dSettingServerXServer: // Удвоение на сервере
	    {
            if(!response) return callcmd::ss(playerid);
			{
				FSCM(playerid, -1, "Вы успешно изменили удвоение на сервере с "SERVER"X%i{FFFFFF} на "GREEN"X%i{FFFFFF}", SI[sX_Server], listitem+1);
                SI[sX_Server] = SI[sX_Exp] = SI[sX_JobPay] = SI[sX_PayDay] = SI[sX_Donat] = listitem+1;
                update_int_mysql(T_SERVER, "sX_Server", SI[sX_Server], "sNumber", 1);
                update_int_mysql(T_SERVER, "sX_Exp", SI[sX_Exp], "sNumber", 1);
                update_int_mysql(T_SERVER, "sX_JobPay", SI[sX_JobPay], "sNumber", 1);
                update_int_mysql(T_SERVER, "sX_PayDay", SI[sX_PayDay], "sNumber", 1);
                update_int_mysql(T_SERVER, "sX_Donat", SI[sX_Donat], "sNumber", 1);

                new nam[80];
				if(!GetString(SI[sObnova], "None") && SI[sX_PayDay] == 1) format(nam, sizeof(nam), "hostname %s | %s", SI[sName], SI[sObnova]); // Название проекта
			    else if(GetString(SI[sObnova], "None") && SI[sX_PayDay] > 1) format(nam, sizeof(nam), "hostname %s | X%i PayDay", SI[sName], SI[sX_PayDay]);
			    else if(!GetString(SI[sObnova], "None") && SI[sX_PayDay] > 1) format(nam, sizeof(nam), "hostname %s | %s | X%i PayDay", SI[sName], SI[sObnova], SI[sX_PayDay]); // Название проекта
				else format(nam, sizeof(nam), "hostname %s", SI[sName]);
				SendRconCommand(nam);

                return callcmd::ss(playerid);
			}
		}
	    case dSettingServerXexp: // Удвоение опыта
	    {
            if(!response) return callcmd::ss(playerid);
			{
				FSCM(playerid, -1, "Вы успешно изменили удвоение опыта с "SERVER"X%i{FFFFFF} на "GREEN"X%i{FFFFFF}", SI[sX_Exp], listitem+1);
                SI[sX_Exp] = listitem+1;
                update_int_mysql(T_SERVER, "sX_Exp", SI[sX_Exp], "sNumber", 1);
                return callcmd::ss(playerid);
			}
		}
	    case dSettingServerXjobPay: // Удвоение зарплат на работах
	    {
            if(!response) return callcmd::ss(playerid);
			{
				FSCM(playerid, -1, "Вы успешно изменили удвоение зарплат на работах с "SERVER"X%i{FFFFFF} на "GREEN"X%i{FFFFFF}", SI[sX_JobPay], listitem+1);
                SI[sX_JobPay] = listitem+1;
                update_int_mysql(T_SERVER, "sX_JobPay", SI[sX_JobPay], "sNumber", 1);
                return callcmd::ss(playerid);
			}
		}
	    case dSettingServerXfracPay: // Удвоение зарплат в организациях
	    {
            if(!response) return callcmd::ss(playerid);
			{
				FSCM(playerid, -1, "Вы успешно изменили удвоение зарплат в организациях с "SERVER"X%i{FFFFFF} на "GREEN"X%i{FFFFFF}", SI[sX_PayDay], listitem+1);
                SI[sX_PayDay] = listitem+1;
                update_int_mysql(T_SERVER, "sX_PayDay", SI[sX_PayDay], "sNumber", 1);

                new nam[80];
				if(!GetString(SI[sObnova], "None") && SI[sX_PayDay] == 1) format(nam, sizeof(nam), "hostname %s | %s", SI[sName], SI[sObnova]); // Название проекта
			    else if(GetString(SI[sObnova], "None") && SI[sX_PayDay] > 1) format(nam, sizeof(nam), "hostname %s | X%i PayDay", SI[sName], SI[sX_PayDay]);
			    else if(!GetString(SI[sObnova], "None") && SI[sX_PayDay] > 1) format(nam, sizeof(nam), "hostname %s | %s | X%i PayDay", SI[sName], SI[sObnova], SI[sX_PayDay]); // Название проекта
				else format(nam, sizeof(nam), "hostname %s", SI[sName]);
				SendRconCommand(nam);

                return callcmd::ss(playerid);
			}
		}
	    case dSettingServerXdonat: // Удвоение доната
	    {
            if(!response) return callcmd::ss(playerid);
			{
				FSCM(playerid, -1, "Вы успешно изменили удвоение доната с "SERVER"X%i{FFFFFF} на "GREEN"X%i{FFFFFF}", SI[sX_Donat], listitem+1);
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

public OnPlayerClickTextDraw(playerid, Text:clickedid) // TextDraw глобальный
{
    if(_:clickedid == INVALID_TEXT_DRAW)
    {
	}
	return 1;
}

public OnPlayerClickPlayerTextDraw(playerid, PlayerText:playertextid) // TextDraw для игрока
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
/* ============================== [ Конец пабликов ] ======================== */

// ============================== [ Стоки загрузки ] ======================== //

stock LoadMySQLSettings() // Загрузка с базой данных MySQL
{
	new FileID = ini_openFile("mysql_connect.ini"), errCode;
	if(FileID < 0)
	{
		printf("Ошибка при открытии файла настроек MySQL. Код ошибки: %d", FileID);
		return 0;
	}
	errCode = ini_getString(FileID,"mysql_host",MySQLSettings[mysql_Host]);

	if(errCode < 0) printf("Ошибка при чтении файла настроек MySQL (хост). Код ошибки: %d", errCode);
	errCode = ini_getString(FileID,"mysql_name",MySQLSettings[mysql_Name]);

	if(errCode < 0) printf("Ошибка при чтении файла настроек MySQL (пароль). Код ошибки: %d", errCode);
	errCode = ini_getString(FileID,"mysql_pass",MySQLSettings[mysql_Pass]);

	if(errCode < 0) printf("Ошибка при чтении файла настроек MySQL (имя пользователя). Код ошибки: %d", errCode);
	errCode = ini_getString(FileID,"mysql_baza",MySQLSettings[mysql_Baza]);

	if(errCode < 0) printf("Ошибка при чтении файла настроек MySQL (базы данных). Код ошибки: %d", errCode);
	ini_closeFile(FileID);
	return 1;
}

// ============================== [ Стоки сохранения ] ====================== //

// Сохранение данных
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

stock acc_int_strcat(query[], len, name[], number) // Для Save
{
	new string[128];
    f("`%s` = '%d',", name, number);
	strcat(query, string, len);
    return 1;
}

stock acc_str_strcat(query[], len, name[], str[])  // Для Save
{
	new string[128];
    f("`%s` = '%s',",name, str);
    strcat(query, string, len);
    return 1;
}

stock acc_float_strcat(query[], len, name[], Float:number)  // Для Save
{
	new string[128];
    f("`%s` = '%f',", name, number);
    strcat(query, string, len);
    return 1;
}

// ============================== [ Стоки прочие ] ========================== //

stock SetString(param_1[], param_2[], size = 300) return strmid(param_1, param_2, 0, strlen(param_2), size); // Задаем параметры

stock GetString(param1[],param2[]) return !strcmp(param1, param2, false); // Узнаем параметры

stock Tkick(playerid)
{
	SetTimerEx("KickExx", 100, false, "d", playerid);
	return SCM(playerid, 0xFF0000AA, !"Нажмите F6 и введите: /q (/quit) для выхода из игры.");
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
	// else if(secs > 0) format(string, 30, "%d м. %02d с.", mins, secs);
	return string;
}

stock ConvertCash(value)
{
    new string[24];
    format(string,sizeof(string), "%d" ,value);
    for(new i = (strlen(string) - 3); i > (value < 0 ? 1 : 0); i -= 3 ) strins(string[i], ".", 0);
    return string;
}

// ============================== [ Паблики загрузки ] ====================== //

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
		print("\n  ______________________ [ Загрузка базы данныйх MySQL ] _____________________\n");

		if(GetString(SI[sObnova], "None")) format(nam, sizeof(nam), "hostname %s", SI[sName]);
	    else if(GetString(SI[sObnova], "None") && SI[sX_PayDay] >= 2) format(nam, sizeof(nam), "hostname %s | X%i PayDay", SI[sName], SI[sX_PayDay]);
	    else if(!GetString(SI[sObnova], "None") && SI[sX_PayDay] >= 2) format(nam, sizeof(nam), "hostname %s | %s | X%i PayDay", SI[sName], SI[sObnova], SI[sX_PayDay]);
		else format(nam, sizeof(nam), "hostname %s | %s", SI[sName], SI[sObnova]); // Название проекта
		SendRconCommand(nam);

		format(ver, sizeof(ver), "%s", SI[sVersion]);
		SetGameModeText(ver); // Версия обновления - мода

		format(web, sizeof(web), "weburl %s", SI[sWeb]);
		SendRconCommand(web); // URL сайта проекта

		format(r_pass, sizeof(r_pass), "rcon_password %s", SI[sRconPass]);
		SendRconCommand(r_pass); // Главный пароль сервера

		format(map, sizeof(map), "mapname %s", SI[sMapName]);
		SendRconCommand(map); // Название карты

		format(lan, sizeof(lan), "language %s", SI[sLanguage]);
		SendRconCommand(lan); // Язык проекта
	}
	return printf("-> Настройки сервера загружены: %i мс%s", GetTickCount() - time, (!GetString(SI[sPassword], "None"))?(" - Сервер закрыт на технические работы!"):(" "));
}

// ============================== [ Команды для администраторов ] =========== //

CMD:settingserver(playerid)
{
	/*if(GetAdmin(playerid) < 12 && !FAI[playerid][faName]) return SEM(playerid, CMDOff);
	if(AI[playerid][aBlock]) return SEM(playerid, AdminBlock);
	if(!AdminLogin[playerid]) return SEM(playerid, AdminLoginOff);*/
	{
		new string[2048], str[1024], stringPass[32], stringObnova[32];
		if(GetString(SI[sPassword], "None")) stringPass = ""GREEN"Отсутствует";
        else format(stringPass, sizeof(stringPass), "%s", SI[sPassword]);

		if(GetString(SI[sObnova], "None")) stringObnova = ""GREEN"Отсутствует";
        else format(stringObnova, sizeof(stringObnova), "%s", SI[sObnova]);

		strcat(string, "№. Наименование\tСодержание\n");
		format(str, sizeof(str), ""SERVER"1. {FFFFFF}Название проекта\t%s\n", SI[sName]); strcat(string, str);
		format(str, sizeof(str), ""SERVER"2. {FFFFFF}Номер сервера\t%i\n", SI[sNumber]); strcat(string, str);
		format(str, sizeof(str), ""SERVER"3. {FFFFFF}Название сервера\t%s\n", SI[sNameServer]); strcat(string, str);
		format(str, sizeof(str), ""SERVER"4. {FFFFFF}Название обновления\t%s\n", stringObnova); strcat(string, str);
		format(str, sizeof(str), ""SERVER"5. {FFFFFF}Версия обновления\t%s\n", SI[sVersion]); strcat(string, str);
		format(str, sizeof(str), ""SERVER"6. {FFFFFF}Сайт проекта\t%s\n", SI[sWeb]); strcat(string, str);
		format(str, sizeof(str), ""SERVER"7. {FFFFFF}Донат проекта\t%s\n", SI[sDonate]); strcat(string, str);
		format(str, sizeof(str), ""SERVER"8. {FFFFFF}Форум проекта\t%s\n", SI[sForum]); strcat(string, str);
		format(str, sizeof(str), ""SERVER"9. {FFFFFF}Группа проекта\t%s\n", SI[sGroup]); strcat(string, str);
		format(str, sizeof(str), ""SERVER"10. {FFFFFF}Название карты\t%s\n", SI[sMapName]); strcat(string, str);
		format(str, sizeof(str), ""SERVER"11. {FFFFFF}Язык\t%s\n", SI[sLanguage]); strcat(string, str);
		format(str, sizeof(str), ""SERVER"12. {FFFFFF}Пароль сервера\t%s\n", stringPass); strcat(string, str);
		format(str, sizeof(str), ""SERVER"13. {FFFFFF}Бонусные деньги\t%s рублей\n", ConvertCash(SI[sBonusMoney])); strcat(string, str);
		format(str, sizeof(str), ""SERVER"14. {FFFFFF}Бонусный уровень\t%i\n", SI[sBonusLevel]); strcat(string, str);
		format(str, sizeof(str), ""SERVER"15. {FFFFFF}Бонусный донат\t%s R-Coins\n", ConvertCash(SI[sBonusDonat])); strcat(string, str);
		format(str, sizeof(str), ""SERVER"16. {FFFFFF}Удвоение на сервере\tx%i\n", SI[sX_Server]); strcat(string, str);
		format(str, sizeof(str), ""SERVER"17. {FFFFFF}Удвоение опыта\tx%i\n", SI[sX_Exp]); strcat(string, str);
		format(str, sizeof(str), ""SERVER"18. {FFFFFF}Удвоение зарплат на работах\tx%i\n", SI[sX_JobPay]); strcat(string, str);
		format(str, sizeof(str), ""SERVER"19. {FFFFFF}Удвоение зарплат в организациях\tx%i\n", SI[sX_PayDay]); strcat(string, str);
		format(str, sizeof(str), ""SERVER"20. {FFFFFF}Удвоение доната\tx%i\n", SI[sX_Donat]); strcat(string, str);
		format(str, sizeof(str), ""SERVER"21. {FFFFFF}Праздничный Евент\t%s\n", (!SI[sEvent])?(""GREY"Отключен"):(SI[sEvent]==1)?(""GREEN"Новый год"):(SI[sEvent]==2)?(""SERVER"9 Мая"):(""PURPLE"Хэллоуин")); strcat(string, str);
		SPD(playerid, dSettingServerMenu, d_tlisth, ""SERVER"Панель разработчика - Настройки сервера", string, "Выбрать", "Закрыть");
	}
	return 1;
}
CMD:ss(playerid) return callcmd::settingserver(playerid);

