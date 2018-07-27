
global function Toolgun_RegisterTool_GauntletPlaceWeapon
#if SERVER
global function CustomGauntlet_SpawnRespawningWeapon
#endif

table ToolGauntletWeapon = {};

void function Toolgun_RegisterTool_GauntletPlaceWeapon()
{
	AddOnToolOptionUpdateCallback( ToolGauntletWeapon_UpdateToolOption );

	// Create the tool
	ToolGauntletWeapon.id <- "gauntlet_weapon";
	ToolGauntletWeapon.spawningId <- "mp_weapon_rspn101";

	ToolGauntletWeapon.GetName <- function()
	{
		return "Gauntlet Weapon Spawner";
	}

	ToolGauntletWeapon.GetHelp <- function()
	{
		string help = "Fire to place a respawning weapon in the world.\nShoot an existing respawner to update it.";
		#if CLIENT || UI
		help += "\nPlacing: " + Localize( expect string(ToolGauntletWeapon.spawningId) );
		#endif
		return help;
	}

	ToolGauntletWeapon.RegisterOptions <- function()
	{
		#if CLIENT
		AddTextOption( "gauntlet_weapon", "Primary Weapons" );
		AddButtonOption( "gauntlet_weapon", "mp_weapon_rspn101", Localize("#WPN_RSPN101") );
		AddButtonOption( "gauntlet_weapon", "mp_weapon_rspn101_og", Localize("#WPN_RSPN101_OG") );
		AddButtonOption( "gauntlet_weapon", "mp_weapon_hemlok", Localize("#WPN_HEMLOK") );
		AddButtonOption( "gauntlet_weapon", "mp_weapon_g2", Localize("#WPN_G2") );
		AddButtonOption( "gauntlet_weapon", "mp_weapon_vinson", Localize("#WPN_VINSON") );
		AddButtonOption( "gauntlet_weapon", "mp_weapon_car", Localize("#WPN_CAR") );
		AddButtonOption( "gauntlet_weapon", "mp_weapon_alternator_smg", Localize("#WPN_ALTERNATOR_SMG") );
		AddButtonOption( "gauntlet_weapon", "mp_weapon_hemlok_smg", Localize("#WPN_HEMLOK_SMG") );
		AddButtonOption( "gauntlet_weapon", "mp_weapon_r97", Localize("#WPN_R97") );
		AddButtonOption( "gauntlet_weapon", "mp_weapon_lmg", Localize("#WPN_LMG") );
		AddButtonOption( "gauntlet_weapon", "mp_weapon_lstar", Localize("#WPN_LSTAR") );
		AddButtonOption( "gauntlet_weapon", "mp_weapon_esaw", Localize("#WPN_ESAW") );
		AddButtonOption( "gauntlet_weapon", "mp_weapon_sniper", Localize("#WPN_SNIPER") );
		AddButtonOption( "gauntlet_weapon", "mp_weapon_doubletake", Localize("#WPN_DOUBLETAKE") );
		AddButtonOption( "gauntlet_weapon", "mp_weapon_dmr", Localize("#WPN_DMR") );
		AddButtonOption( "gauntlet_weapon", "mp_weapon_shotgun", Localize("#WPN_SHOTGUN") );
		AddButtonOption( "gauntlet_weapon", "mp_weapon_mastiff", Localize("#WPN_MASTIFF") );
		AddButtonOption( "gauntlet_weapon", "mp_weapon_smr", Localize("#WPN_SMR") );
		AddButtonOption( "gauntlet_weapon", "mp_weapon_epg", Localize("#WPN_EPG") );
		AddButtonOption( "gauntlet_weapon", "mp_weapon_softball", Localize("#WPN_SOFTBALL") );
		AddButtonOption( "gauntlet_weapon", "mp_weapon_pulse_lmg", Localize("#WPN_PULSE_LMG") );
		AddButtonOption( "gauntlet_weapon", "mp_weapon_wingman_n", Localize("#WPN_WINGMAN_N") );
		AddButtonOption( "gauntlet_weapon", "mp_weapon_shotgun_pistol", Localize("#WPN_SHOTGUN_PISTOL") );
		AddDividerOption( "gauntlet_weapon" );

		AddTextOption( "gauntlet_weapon", "Secondary Weapons" );
		AddButtonOption( "gauntlet_weapon", "mp_weapon_semipistol", Localize("#WPN_P2011") );
		AddButtonOption( "gauntlet_weapon", "mp_weapon_autopistol", Localize("#WPN_RE45_AUTOPISTOL") );
		AddButtonOption( "gauntlet_weapon", "mp_weapon_wingman", Localize("#WPN_WINGMAN") );
		AddButtonOption( "gauntlet_weapon", "mp_weapon_defender", Localize("#WPN_CHARGE_RIFLE") );
		AddButtonOption( "gauntlet_weapon", "mp_weapon_mgl", Localize("#WPN_MGL") );
		AddButtonOption( "gauntlet_weapon", "mp_weapon_arc_launcher", Localize("#WPN_ARC_LAUNCHER") );
		AddButtonOption( "gauntlet_weapon", "mp_weapon_rocket_launcher", Localize("#WPN_ROCKET_LAUNCHER") );
		AddButtonOption( "gauntlet_weapon", "mp_weapon_smart_pistol", Localize("#WPN_SMART_PISTOL") );
		AddDividerOption( "gauntlet_weapon" );

		AddTextOption( "gauntlet_weapon", "Ordance" );
		AddButtonOption( "gauntlet_weapon", "mp_weapon_frag_grenade", Localize("#WPN_FRAG_GRENADE") );
		AddButtonOption( "gauntlet_weapon", "mp_weapon_thermite_grenade", Localize("#WPN_THERMITE_GRENADE") );
		AddButtonOption( "gauntlet_weapon", "mp_weapon_grenade_electric_smoke", Localize("#WPN_GRENADE_ELECTRIC_SMOKE") );
		AddButtonOption( "gauntlet_weapon", "mp_weapon_grenade_emp", Localize("#WPN_GRENADE_EMP") );
		AddButtonOption( "gauntlet_weapon", "mp_weapon_grenade_gravity", Localize("#WPN_GRENADE_GRAVITY") );
		AddButtonOption( "gauntlet_weapon", "mp_weapon_satchel", Localize("#WPN_SATCHEL") );
		#endif
	}

	ToolGauntletWeapon.OnFire <- function()
	{
	#if SERVER
		entity player = GetPlayerByIndex( 0 );
		Toolgun_Utils_FireToolTracer( player );

		vector eyePosition = player.EyePosition();
		vector viewVector = player.GetViewVector();
		TraceResults traceResults = TraceLineHighDetail( eyePosition, eyePosition + viewVector * 10000, player, TRACE_MASK_PLAYERSOLID | TRACE_MASK_TITANSOLID | TRACE_MASK_NPCWORLDSTATIC, TRACE_COLLISION_GROUP_NONE );
		if( traceResults.hitEnt )
		{
			// Check if we're updating a spawner
			for( int i = CustomGauntletsGlobal.DevelopmentTrack.RespawningWeapons.len() - 1; i >= 0; --i )
			{
				GauntletWeapon respawningWeapon = CustomGauntletsGlobal.DevelopmentTrack.RespawningWeapons[i];
				if( traceResults.hitEnt == respawningWeapon.ReferenceEnt )
				{
					// This is an existing spawner, so update it with the new weapon class
					respawningWeapon.WeaponClass = expect string( ToolGauntletWeapon.spawningId );

					// Remove the existing weapon so a new one will spawn
					entity ent = respawningWeapon.ReferenceEnt;
					if( ent.e.attachedEnts.len() && IsValid( ent.e.attachedEnts[0] ) )
					{
						entity weaponEnt = ent.e.attachedEnts[0];
						if( IsValid( weaponEnt ) && !weaponEnt.GetOwner() )
						{
							weaponEnt.Destroy();
						}
					}

					return true;
				}
			}

			// Create a new spawner
			vector Pos = traceResults.endPos;
			vector Angles = Vector(0, player.EyeAngles().y + 90, 0);
			CustomGauntlet_SpawnRespawningWeapon( expect string( ToolGauntletWeapon.spawningId ), Pos, Angles );
		}

		return true;
	#else
		return false;
	#endif
	}

	// Register the tool
	ToolGunTools.append( ToolGauntletWeapon );

}

void function ToolGauntletWeapon_UpdateToolOption( string id, var value )
{
	switch( id )
	{
		case "mp_weapon_rspn101":
		case "mp_weapon_rspn101_og":
		case "mp_weapon_hemlok":
		case "mp_weapon_g2":
		case "mp_weapon_vinson":
		case "mp_weapon_car":
		case "mp_weapon_alternator_smg":
		case "mp_weapon_hemlok_smg":
		case "mp_weapon_r97":
		case "mp_weapon_lmg":
		case "mp_weapon_lstar":
		case "mp_weapon_esaw":
		case "mp_weapon_sniper":
		case "mp_weapon_doubletake":
		case "mp_weapon_dmr":
		case "mp_weapon_shotgun":
		case "mp_weapon_mastiff":
		case "mp_weapon_smr":
		case "mp_weapon_epg":
		case "mp_weapon_softball":
		case "mp_weapon_pulse_lmg":
		case "mp_weapon_wingman_n":
		case "mp_weapon_shotgun_pistol":
		case "mp_weapon_semipistol":
		case "mp_weapon_autopistol":
		case "mp_weapon_wingman":
		case "mp_weapon_defender":
		case "mp_weapon_mgl":
		case "mp_weapon_arc_launcher":
		case "mp_weapon_rocket_launcher":
		case "mp_weapon_frag_grenade":
		case "mp_weapon_thermite_grenade":
		case "mp_weapon_grenade_electric_smoke":
		case "mp_weapon_grenade_emp":
		case "mp_weapon_grenade_gravity":
		case "mp_weapon_satchel":
			ToolGauntletWeapon.spawningId = id;
			break;
	}
}

#if SERVER
void function CustomGauntlet_SpawnRespawningWeapon( string weaponClass, vector position, vector angles )
{
	GauntletWeapon newRespawningWeapon;
	newRespawningWeapon.WeaponClass = weaponClass;
	newRespawningWeapon.ReferenceEnt = ToolGauntlet_CreateTriggerEntity( position, angles, 0.0 );

	CustomGauntletsGlobal.DevelopmentTrack.RespawningWeapons.append( newRespawningWeapon );

	thread CustomGauntlet_MoveWeapon_Think( newRespawningWeapon );
	thread CustomGauntlet_RespawnWeapon_Think( newRespawningWeapon );
}

vector function GetSpawnLocation( entity parentEntity )
{
	return parentEntity.GetOrigin() + AnglesToUp( parentEntity.GetAngles() ) * 75;
}

vector function GetSpawnAngles( entity parentEntity )
{
	return parentEntity.GetAngles();
}

void function CustomGauntlet_MoveWeapon_Think( GauntletWeapon gauntletWeapon )
{
	EndSignal( gauntletWeapon.ReferenceEnt, "OnDestroy" );
	entity ent = gauntletWeapon.ReferenceEnt;

	while( IsValid( ent ) )
	{
		if( ent.e.attachedEnts.len() && IsValid( ent.e.attachedEnts[0] ) )
		{
			entity weaponEnt = ent.e.attachedEnts[0];
			if( IsValid( weaponEnt ) && !weaponEnt.GetOwner() )
			{
				weaponEnt.SetOrigin( GetSpawnLocation( ent ) );
				weaponEnt.SetAngles( Vector( 0, GetSpawnAngles( ent ).y, 0 ) );
			}
		}
		WaitFrame();
	}
}

// Nearly everything below here is taken from sp_training.nut Training_RecreateWeaponPickup_Think
void function CustomGauntlet_RespawnWeapon_Think( GauntletWeapon gauntletWeapon )
{
	EndSignal( gauntletWeapon.ReferenceEnt, "OnDestroy" );

	const float MATCHING_PICKUP_DIST = 0.5;
	const float NEARBY_SIMILAR_DIST = 200.0;

	string pickupEntWeaponClass = gauntletWeapon.WeaponClass;
	entity ent = gauntletWeapon.ReferenceEnt;

	// Spawn initial weapon
	entity newWeapon = CreateWeaponEntityByNameConstrained( gauntletWeapon.WeaponClass, GetSpawnLocation( ent ), GetSpawnAngles( ent ) );
	ent.e.attachedEnts.append( newWeapon );

	// Start watching for weapon changes
	while ( ent.e.attachedEnts.len() && IsValid( ent.e.attachedEnts[0] ) )
	{
		entity weaponEnt = ent.e.attachedEnts[0];
		while ( IsValid( weaponEnt ) && !weaponEnt.GetOwner() )
		{
			wait 0.1;
		}

		entity player = GetPlayerByIndex( 0 );

		// this is the most reliable way to get a good push vector for if we need to kick another weapon out (pickup ent angles are often not optimal)
		vector playerPos_onPickup = player.GetOrigin()
		vector vecToPlayer_whenPickedUp = Normalize( playerPos_onPickup - ent.GetOrigin() )

		ent.e.attachedEnts.remove( 0 )

		wait 2.2  // don't respawn it right away

		bool oldWeapon_similarPickupNearby = false
		bool pickupEnt_similarPickupNearby = false

		// previous player weapon may be here after swapping
		array<entity> allPickups = GetWeaponArray( true )
		entity oldWeapon
		foreach ( pickup in allPickups )
		{
			float distToThisPickup = Distance( pickup.GetOrigin(), GetSpawnLocation( ent ) )
			if ( distToThisPickup <= MATCHING_PICKUP_DIST )
			{
				oldWeapon = pickup
				break
			}
		}

		if ( IsValid( oldWeapon ) )
		{
			foreach ( pickup in allPickups )
			{
				if ( oldWeapon == pickup )
					continue

				float distToThisPickup = Distance( pickup.GetOrigin(), GetSpawnLocation( ent ) )
				if ( distToThisPickup <= NEARBY_SIMILAR_DIST )
				{
					string pickupWeaponClass = pickup.GetWeaponClassName()

					if ( pickupWeaponClass == oldWeapon.GetWeaponClassName() && !oldWeapon_similarPickupNearby )
					{
						//printt( "found similar pickup nearby to one the player dropped:", pickupWeaponClass )
						oldWeapon_similarPickupNearby = true
					}

					if ( pickupWeaponClass == pickupEntWeaponClass && !pickupEnt_similarPickupNearby )
					{
						//printt( "found similar pickup nearby to one that would be recreated:", pickupWeaponClass )
						pickupEnt_similarPickupNearby = true
					}
				}
			}
		}

		bool recreatePickup = true
		bool destroyOldWeapon = false
		if ( IsValid( oldWeapon ) )
		{
			if ( oldWeapon.GetWeaponClassName() == pickupEntWeaponClass )
			{
				printt( "old weapon that is here is the same kind of weapon as we would spawn, so don't recreate:", pickupEntWeaponClass )
				recreatePickup = false  // old weapon that is here is the same kind of weapon as we would spawn, so don't recreate
			}

			if ( oldWeapon_similarPickupNearby )
			{
				printt( "Old weapon can be destroyed, because a similar pickup is nearby:", oldWeapon.GetWeaponClassName() )
				destroyOldWeapon = true
			}

			if ( !oldWeapon_similarPickupNearby && pickupEnt_similarPickupNearby )
			{
				printt( "old weapon is unique to this area and pickup ent has a similar pickup nearby, so don't recreate pickup ent. Old weapon:", oldWeapon.GetWeaponClassName(), "/ pickup ent class:", pickupEntWeaponClass )
				recreatePickup = false
			}
		}

		if ( recreatePickup )
		{
			if ( IsValid( oldWeapon ) )
			{
				if ( destroyOldWeapon )
				{
					printt( "destroying old weapon because similar pickup is nearby:", oldWeapon.GetWeaponClassName() )
					oldWeapon.Destroy()
				}
				else
				{
					MoveOldWeapon( ent, oldWeapon, AnglesToUp( ent.GetAngles() ) )  // kick the old weapon out of this spot
				}
			}

			// cover respawn with a flash effect
			vector spawnLocation = GetSpawnLocation( ent );
			vector spawnAngles = GetSpawnAngles( ent );

			EmitSoundAtPosition( TEAM_UNASSIGNED, spawnLocation, "training_scr_rack_weapon_appear" )
			StartParticleEffectInWorld( GetParticleSystemIndex( GHOST_FLASH_EFFECT ), spawnLocation, spawnAngles )
			
			entity recreatedWeapon = CreateWeaponEntityByNameConstrained( gauntletWeapon.WeaponClass, spawnLocation, spawnAngles );
			ent.e.attachedEnts.append( recreatedWeapon );

			// defensive checks
			if ( !ent.e.attachedEnts.len() || !IsValid( ent.e.attachedEnts[0] ) )
			{
				printt( "WARNING! Recreated script pickup FAILED to recreate:", pickupEntWeaponClass, "on ent", ent )
				continue
			}

			entity recreatedPickup = ent.e.attachedEnts[0]
			printt( "training: recreated weapon pickup:", pickupEntWeaponClass, "by spawning:", recreatedPickup )
		}
		else
		{
			if ( IsValid( oldWeapon ) )
				ent.e.attachedEnts.append( oldWeapon )
		}
	}

	printt( "WARNING- Stopping think on respawning gauntlet weapon: ", gauntletWeapon.WeaponClass );

}

void function MoveOldWeapon( entity pickupEnt, entity oldWeapon, vector pushVec = <0,0,0> )
{
	// recreate weapon as unconstrained so we can physics push it
	entity recreatedOldWeapon = RecreatePlayerWeaponPickup( oldWeapon )
	string recreatedClassName = recreatedOldWeapon.GetWeaponClassName()

	float velocityScalar = 300.0

	var hasSubClass = GetWeaponInfoFileKeyField_Global( recreatedClassName, "weaponSubClass" )
	if ( hasSubClass )
	{
		string weaponSubClass = GetWeaponInfoFileKeyField_GlobalString( recreatedClassName, "weaponSubClass" )

		switch ( weaponSubClass )
		{
			case "offhand":
			case "pistol":
				velocityScalar = 200
				break

			case "smg":
				velocityScalar = 300
				break

			case "rifle":
				velocityScalar = 400
				break

			case "lmg":
			case "at":
				velocityScalar = 500
				break
		}
	}

	if ( pushVec == <0,0,0> )
		pushVec = AnglesToForward( pickupEnt.GetAngles() )

	//vector pushAng = VectorToAngles( pushVec )
	//vector addVec = AnglesToUp( pushAng ) * (velocityScalar * 0.2)
	//pushVec += addVec
	pushVec += <0,0,1>

	printt( "moving old weapon:", oldWeapon.GetWeaponClassName(), "with velocity scalar:", velocityScalar )
	recreatedOldWeapon.SetVelocity( pushVec * velocityScalar )
}

entity function RecreatePlayerWeaponPickup( entity oldWeapon )
{
	string oldWeaponClass = oldWeapon.GetWeaponClassName()

	entity weapon = CreateWeaponEntityByNameWithPhysics( oldWeaponClass, oldWeapon.GetOrigin(), oldWeapon.GetAngles() )
	weapon.SetVelocity( <0,0,0> )

	SetTargetName( weapon, "_old_player_weapon_" + oldWeaponClass )
	weapon.kv.fadedist = -1

	array<string> existingMods = oldWeapon.GetMods()
	weapon.SetMods( existingMods )

	bool doMarkAsLoadoutPickup = false
	if ( doMarkAsLoadoutPickup )
		weapon.MarkAsLoadoutPickup()

	HighlightWeapon( weapon )

	oldWeapon.Destroy()

	return weapon
}
#endif
