
global function Spawnmenu_Init
global function Spawnmenu_SelectTool
global function Spawnmenu_GiveWeapon
global function Spawnmenu_GiveAbility
global function Spawnmenu_GiveGrenade
global function Spawnmenu_GiveMelee
global function Spawnmenu_SpawnModel
global function Spawnmenu_SpawnNpc

struct
{
	bool isSpawnMenuOpen
} file


void function Spawnmenu_Init()
{
	#if CLIENT
	RegisterButtonPressedCallback( KEY_F1, Spawnmenu_ToggleOpen );
	#endif
	#if SERVER
	AddClientCommandCallback( "Spawnmenu_PerformSpawnModel", ClientCommand_Spawnmenu_PerformSpawnModel );
	AddClientCommandCallback( "Spawnmenu_PerformSpawnNpc", ClientCommand_Spawnmenu_PerformSpawnNpc );
	#endif
}

#if CLIENT
void function Spawnmenu_ToggleOpen( var button )
{
	file.isSpawnMenuOpen = !file.isSpawnMenuOpen;
	if( file.isSpawnMenuOpen )
	{
		ShowCursor();
	}
	else
	{
		HideCursor();
	}
}
#endif

void function Spawnmenu_SelectTool( string toolId )
{
#if CLIENT
	Toolgun_Client_SelectTool( toolId );
#endif
}

void function Spawnmenu_GiveWeapon( string weaponId )
{
#if SERVER
	entity player = GetPlayerByIndex( 0 );
	array<entity> weapons = player.GetMainWeapons()
	string weaponToSwitch = player.GetLatestPrimaryWeapon().GetWeaponClassName()

	if ( player.GetActiveWeapon() != player.GetAntiTitanWeapon() )
	{
		foreach ( weapon in weapons )
		{
			string weaponClassName = weapon.GetWeaponClassName()
			if ( weaponClassName == weaponId )
			{
				weaponToSwitch = weaponClassName
				break
			}
		}
	}

	player.TakeWeaponNow( weaponToSwitch )
	player.GiveWeapon( weaponId )
	player.SetActiveWeaponByName( weaponId )

#endif
}

void function Spawnmenu_GiveAbility( string abilityId )
{
#if SERVER
	entity player = GetPlayerByIndex( 0 );
	entity weapon = player.GetOffhandWeapon( OFFHAND_SPECIAL );
	player.TakeWeaponNow( weapon.GetWeaponClassName() );
	player.GiveOffhandWeapon( abilityId, OFFHAND_SPECIAL );
#endif
}

void function Spawnmenu_GiveGrenade( string abilityId )
{
#if SERVER
	entity player = GetPlayerByIndex( 0 );
	entity weapon = player.GetOffhandWeapon( OFFHAND_ORDNANCE );
	if( weapon.GetWeaponClassName() != abilityId )
	{
		player.TakeWeaponNow( weapon.GetWeaponClassName() );
		player.GiveOffhandWeapon( abilityId, OFFHAND_ORDNANCE );
	}
	else if( weapon.GetWeaponPrimaryClipCount() < weapon.GetWeaponPrimaryClipCountMax() )
	{
		weapon.SetWeaponPrimaryClipCount( weapon.GetWeaponPrimaryClipCount() + 1 );
	}
#endif
}

void function Spawnmenu_GiveMelee( string abilityId )
{
#if SERVER
	entity player = GetPlayerByIndex( 0 );
	entity weapon = player.GetOffhandWeapon( OFFHAND_MELEE );
	player.TakeWeaponNow( weapon.GetWeaponClassName() );
	player.GiveOffhandWeapon( abilityId, OFFHAND_MELEE );
#endif
}

void function Spawnmenu_SpawnModel( string modelName )
{
#if CLIENT
	// HACK: bullshit way to get around issue where spawning from SDK code directly doesn't override precaching
	GetLocalClientPlayer().ClientCommand( "Spawnmenu_PerformSpawnModel \"" + modelName + "\"" );
#endif
}

bool function ClientCommand_Spawnmenu_PerformSpawnModel( entity player, array<string> args )
{
#if SERVER
	string modelName = args[0];
	asset spawnAsset = $"";
	// HACK: Awful, slow way to find asset
	foreach( a in CurrentLevelSpawnList )
	{
		string assetName = "" + a;
		if( assetName.find( modelName ) != null )
		{
			spawnAsset = a;
		}
	}

	if( spawnAsset == $"" )
	{
		return false;
	}

	entity player = GetPlayerByIndex( 0 );
	vector origin = player.EyePosition();
	vector angles = player.EyeAngles();
	vector forward = AnglesToForward( angles );
	TraceResults traceResults = TraceLine( origin, angles + forward * 10000, player, TRACE_MASK_PLAYERSOLID | TRACE_MASK_TITANSOLID | TRACE_MASK_NPCWORLDSTATIC | TRACE_MASK_SHOT, TRACE_COLLISION_GROUP_NONE );

	vector Pos = traceResults.endPos;
	vector Ang = Vector( 0, player.EyeAngles().y, 0 );
	
	EnableExternalSpawnMode();

	entity prop_dynamic = CreateEntity( "prop_dynamic" );
	prop_dynamic.SetValueForModelKey( spawnAsset );
	prop_dynamic.kv.fadedist = -1;
	prop_dynamic.kv.renderamt = 255;
	prop_dynamic.kv.rendercolor = "255 255 255";
	prop_dynamic.kv.solid = 6; // 0 = no collision, 2 = bounding box, 6 = use vPhysics, 8 = hitboxes only
	SetTeam( prop_dynamic, TEAM_BOTH );	// need to have a team other then 0 or it won't take impact damage

	prop_dynamic.SetOrigin( Pos );
	prop_dynamic.SetAngles( Ang );
	DispatchSpawn( prop_dynamic );

	ToolgunData.SpawnedEntities.append( prop_dynamic );
	DisableExternalSpawnMode();
#endif
	return true;
}

void function Spawnmenu_SpawnNpc( string npcId )
{
#if CLIENT
	// HACK: bullshit way to get around issue where spawning from SDK code directly doesn't override precaching
	GetLocalClientPlayer().ClientCommand( "Spawnmenu_PerformSpawnNpc \"" + npcId + "\"" );
#endif
}

bool function ClientCommand_Spawnmenu_PerformSpawnNpc( entity player, array<string> args )
{
#if SERVER
	entity player = GetPlayerByIndex( 0 );
	vector origin = player.EyePosition();
	vector angles = player.EyeAngles();
	vector forward = AnglesToForward( angles );
	TraceResults result = TraceLine( origin, origin + forward * 2000, player );
	angles.x = 0;
	angles.z = 0;

	string npcId = args[0];
	vector spawnPos = result.endPos;
	vector spawnAng = angles;
	int team = TEAM_IMC;

	entity spawnNpc = null;
	switch( npcId )
	{
		case "npc_soldier":
			spawnNpc = CreateSoldier( team, spawnPos, spawnAng );
			break;
		case "npc_soldier_shotgun":
			spawnNpc = CreateSoldier( team, spawnPos, spawnAng );
			SetSpawnOption_Weapon( spawnNpc, "mp_weapon_shotgun" );
			break;
		case "npc_soldier_smg":
			spawnNpc = CreateSoldier( team, spawnPos, spawnAng );
			SetSpawnOption_Weapon( spawnNpc, "mp_weapon_car" );
			break;
		case "npc_soldier_sniper":
			spawnNpc = CreateSoldier( team, spawnPos, spawnAng );
			SetSpawnOption_Weapon( spawnNpc, "mp_weapon_dmr" );
			break;
		case "npc_spectre":
			spawnNpc = CreateSpectre( team, spawnPos, spawnAng );
			break;
		case "npc_stalker":
			spawnNpc = CreateStalker( team, spawnPos, spawnAng );
			break;
		case "npc_stalker_zombie":
			spawnNpc = CreateZombieStalker( team, spawnPos, spawnAng );
			break;
		case "npc_stalker_zombie_mossy":
			spawnNpc = CreateZombieStalkerMossy( team, spawnPos, spawnAng );
			break;
		case "npc_super_spectre":
			spawnNpc = CreateSuperSpectre( team, spawnPos, spawnAng );
			break;
		case "npc_frag_drone":
			spawnNpc = CreateFragDrone( team, spawnPos, spawnAng );
			break;
		case "npc_drone":
			spawnNpc = CreateGenericDrone( team, spawnPos, spawnAng );
			break;
		case "npc_drone_rocket":
			spawnNpc = CreateRocketDrone( team, spawnPos, spawnAng );
			break;
		case "npc_drone_shield":
			spawnNpc = CreateShieldDrone( team, spawnPos, spawnAng );
			break;
		case "npc_drone_plasma":
			spawnNpc = CreateRocketDrone( team, spawnPos, spawnAng );
			SetSpawnOption_Weapon( spawnNpc, "mp_weapon_droneplasma" );
			break;
		case "npc_drone_worker":
			spawnNpc = CreateWorkerDrone( team, spawnPos, spawnAng );
			break;
		case "npc_titan_bt":
			spawnNpc = CreateNPCTitan( "titan_buddy", TEAM_MILITIA, spawnPos, spawnAng, [] );
			SetSpawnOption_AISettings( spawnNpc, "npc_titan_buddy" );
			break;
		case "npc_titan_bt_spare":
			spawnNpc = CreateNPCTitan( "titan_buddy", TEAM_MILITIA, spawnPos, spawnAng, [] );
			SetSpawnOption_AISettings( spawnNpc, "npc_titan_buddy" );
			break;
		case "npc_titan_styder":
			spawnNpc = CreateNPCTitan( "titan_stryder", team, spawnPos, spawnAng, [] );
			SetSpawnOption_AISettings( spawnNpc, "npc_titan_stryder_rocketeer" );
			break;
		case "npc_titan_ogre":
			spawnNpc = CreateNPCTitan( "titan_ogre", team, spawnPos, spawnAng, [] );
			SetSpawnOption_AISettings( spawnNpc, "npc_titan_ogre" );
			break;
		case "npc_titan_atlas":
			spawnNpc = CreateNPCTitan( "titan_atlas", team, spawnPos, spawnAng, [] );
			SetSpawnOption_AISettings( spawnNpc, "npc_titan_atlas" );
			break;
	}
	DispatchSpawn( spawnNpc );
#endif
	return true;
}