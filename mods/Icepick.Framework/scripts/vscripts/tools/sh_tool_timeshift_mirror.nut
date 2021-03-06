untyped
global function Toolgun_RegisterTool_TimeshiftMirror;

// 14:38:17 | Location: <10672.7, -2002.8, -68.8177> // Present
// 14:38:22 | Location: <10672.7, -2002.8, 11451.2> // Past
const float TIMESHIFT_Z_OFFSET = 11520.0;

table ToolMirrorProp = {};

void function Toolgun_RegisterTool_TimeshiftMirror()
{
	// Create the tool
	ToolMirrorProp.id <- "mirror_prop";

	ToolMirrorProp.RegisterOptions <- function()
	{
		#if CLIENT
		AddTextOption( "mirror_prop", "This tool only functions in Effect and Cause." );
		#endif
	}

	ToolMirrorProp.GetName <- function()
	{
		return "Timeshift Prop";
	}

	ToolMirrorProp.GetHelp <- function()
	{
		return "Fire to place an identical prop in the other timeline.";
	}

	ToolMirrorProp.OnSelected <- function()
	{
	}

	ToolMirrorProp.OnDeselected <- function()
	{
	}

	ToolMirrorProp.OnFire <- function()
	{
	#if SERVER
		entity player = GetPlayerByIndex( 0 );
		vector eyePosition = player.EyePosition()
		vector viewVector = player.GetViewVector()
		TraceResults traceResults = TraceLine( eyePosition, eyePosition + viewVector * 10000, player, TRACE_MASK_PLAYERSOLID, TRACE_COLLISION_GROUP_PLAYER )

		if( traceResults.hitEnt )
		{
			Toolgun_Utils_FireToolTracer( player );
			if( traceResults.hitEnt.GetClassName() == "worldspawn" )
			{
				return false;
			}

			for( int i = 0; i < ToolgunData.SpawnedEntities.len(); ++i )
			{
				// Can only mirror props we've placed
				if( ToolgunData.SpawnedEntities[i] == traceResults.hitEnt )
				{				
					vector timeshiftOffet = (player.GetOrigin().z > 5000) ? Vector( 0, 0, TIMESHIFT_Z_OFFSET * -1 ) : Vector( 0, 0, TIMESHIFT_Z_OFFSET );
					asset targetAsset = traceResults.hitEnt.GetModelName();
					vector origin = traceResults.hitEnt.GetOrigin() + timeshiftOffet;
					vector angles = traceResults.hitEnt.GetAngles();
					Spawnmenu_SpawnModelAssetWithParams( targetAsset, origin, angles );
					return true;
				}
			}		
		}
		return false;
	#else
		return false;
	#endif
	}

	// Register the tool
	ToolGunTools.append( ToolMirrorProp );

}
