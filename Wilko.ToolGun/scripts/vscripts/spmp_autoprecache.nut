global function MP_AutoPrecache

void function MP_AutoPrecache()
{
#if DEV
	#if SERVER
	SetAutoPrecacheVersion( 5 )
	// NPC spawners found:
	#endif

	AP_PrecacheWeapon( "melee_titan_punch_ion", 1 )
	AP_PrecacheWeapon( "melee_titan_punch_legion", 1 )
	AP_PrecacheWeapon( "melee_titan_punch_northstar", 1 )
	AP_PrecacheWeapon( "melee_titan_punch_scorch", 1 )
	AP_PrecacheWeapon( "melee_titan_punch_tone", 1 )
	AP_PrecacheWeapon( "melee_titan_punch_vanguard", 1 )
	AP_PrecacheWeapon( "melee_titan_sword", 1 )
	AP_PrecacheWeapon( "mp_titanability_ammo_swap", 1 )
	AP_PrecacheWeapon( "mp_titanability_basic_block", 1 )
	AP_PrecacheWeapon( "mp_titanability_gun_shield", 1 )
	AP_PrecacheWeapon( "mp_titanability_hover", 1 )
	AP_PrecacheWeapon( "mp_titanability_laser_trip", 1 )
	AP_PrecacheWeapon( "mp_titanability_particle_wall", 1 )
	AP_PrecacheWeapon( "mp_titanability_phase_dash", 1 )
	AP_PrecacheWeapon( "mp_titanability_power_shot", 1 )
	AP_PrecacheWeapon( "mp_titanability_rearm", 1 )
	AP_PrecacheWeapon( "mp_titanability_slow_trap", 1 )
	AP_PrecacheWeapon( "mp_titanability_sonar_pulse", 1 )
	AP_PrecacheWeapon( "mp_titanability_tether_trap", 1 )
	AP_PrecacheWeapon( "mp_titancore_flame_wave", 1 )
	AP_PrecacheWeapon( "mp_titancore_flight_core", 1 )
	AP_PrecacheWeapon( "mp_titancore_laser_cannon", 1 )
	AP_PrecacheWeapon( "mp_titancore_salvo_core", 1 )
	AP_PrecacheWeapon( "mp_titancore_shift_core", 1 )
	AP_PrecacheWeapon( "mp_titancore_siege_mode", 1 )
	AP_PrecacheWeapon( "mp_titancore_upgrade", 1 )
	AP_PrecacheWeapon( "mp_titanweapon_arc_wave", 1 )
	AP_PrecacheWeapon( "mp_titanweapon_dumbfire_rockets", 1 )
	AP_PrecacheWeapon( "mp_titanweapon_flame_wall", 1 )
	AP_PrecacheWeapon( "mp_titanweapon_heat_shield", 1 )
	AP_PrecacheWeapon( "mp_titanweapon_laser_lite", 1 )
	AP_PrecacheWeapon( "mp_titanweapon_leadwall", 1 )
	AP_PrecacheWeapon( "mp_titanweapon_meteor", 1 )
	AP_PrecacheWeapon( "mp_titanweapon_particle_accelerator", 1 )
	AP_PrecacheWeapon( "mp_titanweapon_predator_cannon", 1 )
	AP_PrecacheWeapon( "mp_titanweapon_salvo_rockets", 1 )
	AP_PrecacheWeapon( "mp_titanweapon_sniper", 1 )
	AP_PrecacheWeapon( "mp_titanweapon_sticky_40mm", 1 )
	AP_PrecacheWeapon( "mp_titanweapon_stun_laser", 1 )
	AP_PrecacheWeapon( "mp_titanweapon_tracker_rockets", 1 )
	AP_PrecacheWeapon( "mp_titanweapon_vortex_shield_ion", 1 )
	AP_PrecacheWeapon( "mp_titanweapon_xo16_vanguard", 1 )
	AP_PrecacheWeapon( "mp_weapon_frag_grenade", 2 )
	AP_PrecacheWeapon( "mp_weapon_spectre_spawner", 2 )
	AP_PrecacheWeapon( "mp_weapon_super_spectre", 2 )
	AP_PrecacheModel( $"models/Robots/turret_heavy/turret_heavy.mdl" )
	AP_PrecacheModel( $"models/gibs/human_gibs.mdl" )
	AP_PrecacheModel( $"models/gibs/titan_gibs/at_gib1.mdl" )
	AP_PrecacheModel( $"models/gibs/titan_gibs/at_gib7_r_shin.mdl" )
	AP_PrecacheModel( $"models/gibs/titan_gibs/at_gib8_l_thigh1.mdl" )
	AP_PrecacheModel( $"models/gibs/titan_gibs/at_gib8_l_thigh2.mdl" )
	AP_PrecacheModel( $"models/gibs/titan_gibs/at_gib9_l_bicep1.mdl" )
	AP_PrecacheModel( $"models/gibs/titan_gibs/at_gib_hatch_d.mdl" )
	AP_PrecacheModel( $"models/gibs/titan_gibs/at_gib_l_arm1_d.mdl" )
	AP_PrecacheModel( $"models/gibs/titan_gibs/at_gib_l_arm2_d.mdl" )
	AP_PrecacheModel( $"models/gibs/titan_gibs/at_gib_r_arm1_d.mdl" )
	AP_PrecacheModel( $"models/gibs/titan_gibs/at_gib_r_arm2_d.mdl" )
	AP_PrecacheModel( $"models/gibs/titan_gibs/og_gib_hatch_d.mdl" )
	AP_PrecacheModel( $"models/gibs/titan_gibs/og_gib_r_forarm_d.mdl" )
	AP_PrecacheModel( $"models/gibs/titan_gibs/stry_gib1.mdl" )
	AP_PrecacheModel( $"models/gibs/titan_gibs/stry_gib7_r_shin.mdl" )
	AP_PrecacheModel( $"models/gibs/titan_gibs/stry_gib8_l_thigh1.mdl" )
	AP_PrecacheModel( $"models/gibs/titan_gibs/stry_gib8_l_thigh2.mdl" )
	AP_PrecacheModel( $"models/gibs/titan_gibs/stry_gib9_l_bicep1.mdl" )
	AP_PrecacheModel( $"models/gibs/titan_gibs/stry_gib_hatch_d.mdl" )
	AP_PrecacheModel( $"models/gibs/titan_gibs/stry_gib_l_arm1_d.mdl" )
	AP_PrecacheModel( $"models/gibs/titan_gibs/stry_gib_l_arm2_d.mdl" )
	AP_PrecacheModel( $"models/gibs/titan_gibs/stry_gib_r_arm1_d.mdl" )
	AP_PrecacheModel( $"models/gibs/titan_gibs/stry_gib_r_arm2_d.mdl" )
	AP_PrecacheModel( $"models/humans/grunts/imc_grunt_rifle.mdl" )
	AP_PrecacheModel( $"models/humans/grunts/mlt_grunt_rifle.mdl" )
	AP_PrecacheModel( $"models/humans/pilots/pilot_heavy_drex_f.mdl" )
	AP_PrecacheModel( $"models/humans/pilots/pilot_heavy_drex_m.mdl" )
	AP_PrecacheModel( $"models/humans/pilots/pilot_heavy_roog_f.mdl" )
	AP_PrecacheModel( $"models/humans/pilots/pilot_heavy_roog_m.mdl" )
	AP_PrecacheModel( $"models/humans/pilots/pilot_light_ged_f.mdl" )
	AP_PrecacheModel( $"models/humans/pilots/pilot_light_ged_m.mdl" )
	AP_PrecacheModel( $"models/humans/pilots/pilot_light_ged_m_head_gib.mdl" )
	AP_PrecacheModel( $"models/humans/pilots/pilot_light_ged_m_l_arm_gib.mdl" )
	AP_PrecacheModel( $"models/humans/pilots/pilot_light_ged_m_l_leg_gib.mdl" )
	AP_PrecacheModel( $"models/humans/pilots/pilot_light_ged_m_r_arm_gib.mdl" )
	AP_PrecacheModel( $"models/humans/pilots/pilot_light_ged_m_r_leg_gib.mdl" )
	AP_PrecacheModel( $"models/humans/pilots/pilot_light_jester_f.mdl" )
	AP_PrecacheModel( $"models/humans/pilots/pilot_light_jester_m.mdl" )
	AP_PrecacheModel( $"models/humans/pilots/pilot_medium_geist_f.mdl" )
	AP_PrecacheModel( $"models/humans/pilots/pilot_medium_geist_m.mdl" )
	AP_PrecacheModel( $"models/humans/pilots/pilot_medium_reaper_f.mdl" )
	AP_PrecacheModel( $"models/humans/pilots/pilot_medium_reaper_m.mdl" )
	AP_PrecacheModel( $"models/humans/pilots/pilot_medium_stalker_f.mdl" )
	AP_PrecacheModel( $"models/humans/pilots/pilot_medium_stalker_m.mdl" )
	AP_PrecacheModel( $"models/robots/drone_frag/drone_frag.mdl" )
	AP_PrecacheModel( $"models/robots/marvin/marvin.mdl" )
	AP_PrecacheModel( $"models/robots/spectre/imc_spectre.mdl" )
	AP_PrecacheModel( $"models/robots/spectre/spectre_assault_d_gib_arm_l.mdl" )
	AP_PrecacheModel( $"models/robots/spectre/spectre_assault_d_gib_arm_r.mdl" )
	AP_PrecacheModel( $"models/robots/spectre/spectre_assault_d_gib_leg_l.mdl" )
	AP_PrecacheModel( $"models/robots/spectre/spectre_assault_d_gib_leg_r.mdl" )
	AP_PrecacheModel( $"models/robots/stalker/robot_stalker_l_arm_red_gib.mdl" )
	AP_PrecacheModel( $"models/robots/stalker/robot_stalker_l_leg_red_gib.mdl" )
	AP_PrecacheModel( $"models/robots/stalker/robot_stalker_r_arm_red_gib.mdl" )
	AP_PrecacheModel( $"models/robots/stalker/robot_stalker_r_leg_red_gib.mdl" )
	AP_PrecacheModel( $"models/robots/stalker/robot_stalker_red.mdl" )
	AP_PrecacheModel( $"models/robots/super_spectre/super_spectre_left_arm.mdl" )
	AP_PrecacheModel( $"models/robots/super_spectre/super_spectre_left_leg.mdl" )
	AP_PrecacheModel( $"models/robots/super_spectre/super_spectre_right_arm.mdl" )
	AP_PrecacheModel( $"models/robots/super_spectre/super_spectre_right_leg.mdl" )
	AP_PrecacheModel( $"models/robots/super_spectre/super_spectre_v1.mdl" )
	AP_PrecacheModel( $"models/titans/heavy/titan_heavy_deadbolt.mdl" )
	AP_PrecacheModel( $"models/titans/heavy/titan_heavy_legion_prime.mdl" )
	AP_PrecacheModel( $"models/titans/heavy/titan_heavy_ogre.mdl" )
	AP_PrecacheModel( $"models/titans/heavy/titan_heavy_rodeo_battery.mdl" )
	AP_PrecacheModel( $"models/titans/heavy/titan_heavy_scorch_prime.mdl" )
	AP_PrecacheModel( $"models/titans/light/titan_light_locust.mdl" )
	AP_PrecacheModel( $"models/titans/light/titan_light_northstar_prime.mdl" )
	AP_PrecacheModel( $"models/titans/light/titan_light_raptor.mdl" )
	AP_PrecacheModel( $"models/titans/light/titan_light_rodeo_battery.mdl" )
	AP_PrecacheModel( $"models/titans/light/titan_light_ronin_prime.mdl" )
	AP_PrecacheModel( $"models/titans/medium/titan_medium_ajax.mdl" )
	AP_PrecacheModel( $"models/titans/medium/titan_medium_ion_prime.mdl" )
	AP_PrecacheModel( $"models/titans/medium/titan_medium_rodeo_battery.mdl" )
	AP_PrecacheModel( $"models/titans/medium/titan_medium_tone_prime.mdl" )
	AP_PrecacheModel( $"models/titans/medium/titan_medium_vanguard.mdl" )
	AP_PrecacheModel( $"models/titans/medium/titan_medium_wraith.mdl" )
	AP_PrecacheModel( $"models/vehicle/crow_dropship/crow_dropship.mdl" )
	AP_PrecacheModel( $"models/vehicle/goblin_dropship/goblin_dropship.mdl" )
	AP_PrecacheModel( $"models/vehicle/hornet/hornet_fighter.mdl" )
	AP_PrecacheModel( $"models/vehicle/straton/straton_imc_gunship_01.mdl" )
	AP_PrecacheModel( $"models/weapons/arms/human_pov_cockpit.mdl" )
	AP_PrecacheModel( $"models/weapons/arms/pov_pilot_heavy_drex_f.mdl" )
	AP_PrecacheModel( $"models/weapons/arms/pov_pilot_heavy_drex_m.mdl" )
	AP_PrecacheModel( $"models/weapons/arms/pov_pilot_heavy_roog_f.mdl" )
	AP_PrecacheModel( $"models/weapons/arms/pov_pilot_heavy_roog_m.mdl" )
	AP_PrecacheModel( $"models/weapons/arms/pov_pilot_light_ged_f.mdl" )
	AP_PrecacheModel( $"models/weapons/arms/pov_pilot_light_ged_m.mdl" )
	AP_PrecacheModel( $"models/weapons/arms/pov_pilot_light_jester_f.mdl" )
	AP_PrecacheModel( $"models/weapons/arms/pov_pilot_light_jester_m.mdl" )
	AP_PrecacheModel( $"models/weapons/arms/pov_pilot_medium_geist_f.mdl" )
	AP_PrecacheModel( $"models/weapons/arms/pov_pilot_medium_geist_m.mdl" )
	AP_PrecacheModel( $"models/weapons/arms/pov_pilot_medium_reaper_f.mdl" )
	AP_PrecacheModel( $"models/weapons/arms/pov_pilot_medium_reaper_m.mdl" )
	AP_PrecacheModel( $"models/weapons/arms/pov_pilot_medium_stalker_f.mdl" )
	AP_PrecacheModel( $"models/weapons/arms/pov_pilot_medium_stalker_m.mdl" )
	AP_PrecacheModel( $"models/weapons/arms/pov_titan_heavy_cockpit.mdl" )
	AP_PrecacheModel( $"models/weapons/arms/pov_titan_heavy_deadbolt.mdl" )
	AP_PrecacheModel( $"models/weapons/arms/pov_titan_heavy_legion_prime.mdl" )
	AP_PrecacheModel( $"models/weapons/arms/pov_titan_heavy_ogre.mdl" )
	AP_PrecacheModel( $"models/weapons/arms/pov_titan_heavy_scorch_prime.mdl" )
	AP_PrecacheModel( $"models/weapons/arms/pov_titan_light_cockpit.mdl" )
	AP_PrecacheModel( $"models/weapons/arms/pov_titan_light_locust.mdl" )
	AP_PrecacheModel( $"models/weapons/arms/pov_titan_light_northstar_prime.mdl" )
	AP_PrecacheModel( $"models/weapons/arms/pov_titan_light_raptor.mdl" )
	AP_PrecacheModel( $"models/weapons/arms/pov_titan_light_ronin_prime.mdl" )
	AP_PrecacheModel( $"models/weapons/arms/pov_titan_medium_ajax.mdl" )
	AP_PrecacheModel( $"models/weapons/arms/pov_titan_medium_cockpit.mdl" )
	AP_PrecacheModel( $"models/weapons/arms/pov_titan_medium_ion_prime.mdl" )
	AP_PrecacheModel( $"models/weapons/arms/pov_titan_medium_tone_prime.mdl" )
	AP_PrecacheModel( $"models/weapons/arms/pov_titan_medium_vanguard.mdl" )
	AP_PrecacheModel( $"models/weapons/arms/pov_titan_medium_wraith.mdl" )
	AP_PrecacheModel( $"models/weapons/sentry_frag/sentry_frag.mdl" )
#endif

#if !DEV

	PrecacheWeapon( "melee_titan_punch_ion" )
	PrecacheWeapon( "melee_titan_punch_legion" )
	PrecacheWeapon( "melee_titan_punch_northstar" )
	PrecacheWeapon( "melee_titan_punch_scorch" )
	PrecacheWeapon( "melee_titan_punch_tone" )
	PrecacheWeapon( "melee_titan_punch_vanguard" )
	PrecacheWeapon( "melee_titan_sword" )
	PrecacheWeapon( "mp_titanability_ammo_swap" )
	PrecacheWeapon( "mp_titanability_basic_block" )
	PrecacheWeapon( "mp_titanability_gun_shield" )
	PrecacheWeapon( "mp_titanability_hover" )
	PrecacheWeapon( "mp_titanability_laser_trip" )
	PrecacheWeapon( "mp_titanability_particle_wall" )
	PrecacheWeapon( "mp_titanability_phase_dash" )
	PrecacheWeapon( "mp_titanability_power_shot" )
	PrecacheWeapon( "mp_titanability_rearm" )
	PrecacheWeapon( "mp_titanability_slow_trap" )
	PrecacheWeapon( "mp_titanability_sonar_pulse" )
	PrecacheWeapon( "mp_titanability_tether_trap" )
	PrecacheWeapon( "mp_titancore_flame_wave" )
	PrecacheWeapon( "mp_titancore_flight_core" )
	PrecacheWeapon( "mp_titancore_laser_cannon" )
	PrecacheWeapon( "mp_titancore_salvo_core" )
	PrecacheWeapon( "mp_titancore_shift_core" )
	PrecacheWeapon( "mp_titancore_siege_mode" )
	PrecacheWeapon( "mp_titancore_upgrade" )
	PrecacheWeapon( "mp_titanweapon_arc_wave" )
	PrecacheWeapon( "mp_titanweapon_dumbfire_rockets" )
	PrecacheWeapon( "mp_titanweapon_flame_wall" )
	PrecacheWeapon( "mp_titanweapon_heat_shield" )
	PrecacheWeapon( "mp_titanweapon_laser_lite" )
	PrecacheWeapon( "mp_titanweapon_leadwall" )
	PrecacheWeapon( "mp_titanweapon_meteor" )
	PrecacheWeapon( "mp_titanweapon_particle_accelerator" )
	PrecacheWeapon( "mp_titanweapon_predator_cannon" )
	PrecacheWeapon( "mp_titanweapon_salvo_rockets" )
	PrecacheWeapon( "mp_titanweapon_sniper" )
	PrecacheWeapon( "mp_titanweapon_sticky_40mm" )
	PrecacheWeapon( "mp_titanweapon_stun_laser" )
	PrecacheWeapon( "mp_titanweapon_tracker_rockets" )
	PrecacheWeapon( "mp_titanweapon_vortex_shield_ion" )
	PrecacheWeapon( "mp_titanweapon_xo16_vanguard" )
	PrecacheWeapon( "mp_weapon_frag_grenade" )
	PrecacheWeapon( "mp_weapon_spectre_spawner" )
	PrecacheWeapon( "mp_weapon_super_spectre" )
	PrecacheModel( $"models/Robots/turret_heavy/turret_heavy.mdl" )
	PrecacheModel( $"models/gibs/human_gibs.mdl" )
	PrecacheModel( $"models/gibs/titan_gibs/at_gib1.mdl" )
	PrecacheModel( $"models/gibs/titan_gibs/at_gib7_r_shin.mdl" )
	PrecacheModel( $"models/gibs/titan_gibs/at_gib8_l_thigh1.mdl" )
	PrecacheModel( $"models/gibs/titan_gibs/at_gib8_l_thigh2.mdl" )
	PrecacheModel( $"models/gibs/titan_gibs/at_gib9_l_bicep1.mdl" )
	PrecacheModel( $"models/gibs/titan_gibs/at_gib_hatch_d.mdl" )
	PrecacheModel( $"models/gibs/titan_gibs/at_gib_l_arm1_d.mdl" )
	PrecacheModel( $"models/gibs/titan_gibs/at_gib_l_arm2_d.mdl" )
	PrecacheModel( $"models/gibs/titan_gibs/at_gib_r_arm1_d.mdl" )
	PrecacheModel( $"models/gibs/titan_gibs/at_gib_r_arm2_d.mdl" )
	PrecacheModel( $"models/gibs/titan_gibs/og_gib_hatch_d.mdl" )
	PrecacheModel( $"models/gibs/titan_gibs/og_gib_r_forarm_d.mdl" )
	PrecacheModel( $"models/gibs/titan_gibs/stry_gib1.mdl" )
	PrecacheModel( $"models/gibs/titan_gibs/stry_gib7_r_shin.mdl" )
	PrecacheModel( $"models/gibs/titan_gibs/stry_gib8_l_thigh1.mdl" )
	PrecacheModel( $"models/gibs/titan_gibs/stry_gib8_l_thigh2.mdl" )
	PrecacheModel( $"models/gibs/titan_gibs/stry_gib9_l_bicep1.mdl" )
	PrecacheModel( $"models/gibs/titan_gibs/stry_gib_hatch_d.mdl" )
	PrecacheModel( $"models/gibs/titan_gibs/stry_gib_l_arm1_d.mdl" )
	PrecacheModel( $"models/gibs/titan_gibs/stry_gib_l_arm2_d.mdl" )
	PrecacheModel( $"models/gibs/titan_gibs/stry_gib_r_arm1_d.mdl" )
	PrecacheModel( $"models/gibs/titan_gibs/stry_gib_r_arm2_d.mdl" )
	PrecacheModel( $"models/humans/grunts/imc_grunt_rifle.mdl" )
	PrecacheModel( $"models/humans/grunts/mlt_grunt_rifle.mdl" )
	PrecacheModel( $"models/humans/pilots/pilot_heavy_drex_f.mdl" )
	PrecacheModel( $"models/humans/pilots/pilot_heavy_drex_m.mdl" )
	PrecacheModel( $"models/humans/pilots/pilot_heavy_roog_f.mdl" )
	PrecacheModel( $"models/humans/pilots/pilot_heavy_roog_m.mdl" )
	PrecacheModel( $"models/humans/pilots/pilot_light_ged_f.mdl" )
	PrecacheModel( $"models/humans/pilots/pilot_light_ged_m.mdl" )
	PrecacheModel( $"models/humans/pilots/pilot_light_ged_m_head_gib.mdl" )
	PrecacheModel( $"models/humans/pilots/pilot_light_ged_m_l_arm_gib.mdl" )
	PrecacheModel( $"models/humans/pilots/pilot_light_ged_m_l_leg_gib.mdl" )
	PrecacheModel( $"models/humans/pilots/pilot_light_ged_m_r_arm_gib.mdl" )
	PrecacheModel( $"models/humans/pilots/pilot_light_ged_m_r_leg_gib.mdl" )
	PrecacheModel( $"models/humans/pilots/pilot_light_jester_f.mdl" )
	PrecacheModel( $"models/humans/pilots/pilot_light_jester_m.mdl" )
	PrecacheModel( $"models/humans/pilots/pilot_medium_geist_f.mdl" )
	PrecacheModel( $"models/humans/pilots/pilot_medium_geist_m.mdl" )
	PrecacheModel( $"models/humans/pilots/pilot_medium_reaper_f.mdl" )
	PrecacheModel( $"models/humans/pilots/pilot_medium_reaper_m.mdl" )
	PrecacheModel( $"models/humans/pilots/pilot_medium_stalker_f.mdl" )
	PrecacheModel( $"models/humans/pilots/pilot_medium_stalker_m.mdl" )
	PrecacheModel( $"models/robots/drone_frag/drone_frag.mdl" )
	PrecacheModel( $"models/robots/marvin/marvin.mdl" )
	PrecacheModel( $"models/robots/spectre/imc_spectre.mdl" )
	PrecacheModel( $"models/robots/spectre/spectre_assault_d_gib_arm_l.mdl" )
	PrecacheModel( $"models/robots/spectre/spectre_assault_d_gib_arm_r.mdl" )
	PrecacheModel( $"models/robots/spectre/spectre_assault_d_gib_leg_l.mdl" )
	PrecacheModel( $"models/robots/spectre/spectre_assault_d_gib_leg_r.mdl" )
	PrecacheModel( $"models/robots/stalker/robot_stalker_l_arm_red_gib.mdl" )
	PrecacheModel( $"models/robots/stalker/robot_stalker_l_leg_red_gib.mdl" )
	PrecacheModel( $"models/robots/stalker/robot_stalker_r_arm_red_gib.mdl" )
	PrecacheModel( $"models/robots/stalker/robot_stalker_r_leg_red_gib.mdl" )
	PrecacheModel( $"models/robots/stalker/robot_stalker_red.mdl" )
	PrecacheModel( $"models/robots/super_spectre/super_spectre_left_arm.mdl" )
	PrecacheModel( $"models/robots/super_spectre/super_spectre_left_leg.mdl" )
	PrecacheModel( $"models/robots/super_spectre/super_spectre_right_arm.mdl" )
	PrecacheModel( $"models/robots/super_spectre/super_spectre_right_leg.mdl" )
	PrecacheModel( $"models/robots/super_spectre/super_spectre_v1.mdl" )
	PrecacheModel( $"models/titans/heavy/titan_heavy_deadbolt.mdl" )
	PrecacheModel( $"models/titans/heavy/titan_heavy_legion_prime.mdl" )
	PrecacheModel( $"models/titans/heavy/titan_heavy_ogre.mdl" )
	PrecacheModel( $"models/titans/heavy/titan_heavy_rodeo_battery.mdl" )
	PrecacheModel( $"models/titans/heavy/titan_heavy_scorch_prime.mdl" )
	PrecacheModel( $"models/titans/light/titan_light_locust.mdl" )
	PrecacheModel( $"models/titans/light/titan_light_northstar_prime.mdl" )
	PrecacheModel( $"models/titans/light/titan_light_raptor.mdl" )
	PrecacheModel( $"models/titans/light/titan_light_rodeo_battery.mdl" )
	PrecacheModel( $"models/titans/light/titan_light_ronin_prime.mdl" )
	PrecacheModel( $"models/titans/medium/titan_medium_ajax.mdl" )
	PrecacheModel( $"models/titans/medium/titan_medium_ion_prime.mdl" )
	PrecacheModel( $"models/titans/medium/titan_medium_rodeo_battery.mdl" )
	PrecacheModel( $"models/titans/medium/titan_medium_tone_prime.mdl" )
	PrecacheModel( $"models/titans/medium/titan_medium_vanguard.mdl" )
	PrecacheModel( $"models/titans/medium/titan_medium_wraith.mdl" )
	PrecacheModel( $"models/vehicle/crow_dropship/crow_dropship.mdl" )
	PrecacheModel( $"models/vehicle/goblin_dropship/goblin_dropship.mdl" )
	PrecacheModel( $"models/vehicle/hornet/hornet_fighter.mdl" )
	PrecacheModel( $"models/vehicle/straton/straton_imc_gunship_01.mdl" )
	PrecacheModel( $"models/weapons/arms/human_pov_cockpit.mdl" )
	PrecacheModel( $"models/weapons/arms/pov_pilot_heavy_drex_f.mdl" )
	PrecacheModel( $"models/weapons/arms/pov_pilot_heavy_drex_m.mdl" )
	PrecacheModel( $"models/weapons/arms/pov_pilot_heavy_roog_f.mdl" )
	PrecacheModel( $"models/weapons/arms/pov_pilot_heavy_roog_m.mdl" )
	PrecacheModel( $"models/weapons/arms/pov_pilot_light_ged_f.mdl" )
	PrecacheModel( $"models/weapons/arms/pov_pilot_light_ged_m.mdl" )
	PrecacheModel( $"models/weapons/arms/pov_pilot_light_jester_f.mdl" )
	PrecacheModel( $"models/weapons/arms/pov_pilot_light_jester_m.mdl" )
	PrecacheModel( $"models/weapons/arms/pov_pilot_medium_geist_f.mdl" )
	PrecacheModel( $"models/weapons/arms/pov_pilot_medium_geist_m.mdl" )
	PrecacheModel( $"models/weapons/arms/pov_pilot_medium_reaper_f.mdl" )
	PrecacheModel( $"models/weapons/arms/pov_pilot_medium_reaper_m.mdl" )
	PrecacheModel( $"models/weapons/arms/pov_pilot_medium_stalker_f.mdl" )
	PrecacheModel( $"models/weapons/arms/pov_pilot_medium_stalker_m.mdl" )
	PrecacheModel( $"models/weapons/arms/pov_titan_heavy_cockpit.mdl" )
	PrecacheModel( $"models/weapons/arms/pov_titan_heavy_deadbolt.mdl" )
	PrecacheModel( $"models/weapons/arms/pov_titan_heavy_legion_prime.mdl" )
	PrecacheModel( $"models/weapons/arms/pov_titan_heavy_ogre.mdl" )
	PrecacheModel( $"models/weapons/arms/pov_titan_heavy_scorch_prime.mdl" )
	PrecacheModel( $"models/weapons/arms/pov_titan_light_cockpit.mdl" )
	PrecacheModel( $"models/weapons/arms/pov_titan_light_locust.mdl" )
	PrecacheModel( $"models/weapons/arms/pov_titan_light_northstar_prime.mdl" )
	PrecacheModel( $"models/weapons/arms/pov_titan_light_raptor.mdl" )
	PrecacheModel( $"models/weapons/arms/pov_titan_light_ronin_prime.mdl" )
	PrecacheModel( $"models/weapons/arms/pov_titan_medium_ajax.mdl" )
	PrecacheModel( $"models/weapons/arms/pov_titan_medium_cockpit.mdl" )
	PrecacheModel( $"models/weapons/arms/pov_titan_medium_ion_prime.mdl" )
	PrecacheModel( $"models/weapons/arms/pov_titan_medium_tone_prime.mdl" )
	PrecacheModel( $"models/weapons/arms/pov_titan_medium_vanguard.mdl" )
	PrecacheModel( $"models/weapons/arms/pov_titan_medium_wraith.mdl" )
	PrecacheModel( $"models/weapons/sentry_frag/sentry_frag.mdl" )
#endif

#if CLIENT
	ClTitanAtlas_Init( $"models/titans/medium/titan_medium_ajax.mdl" )
	ClTitanAtlas_Init( $"models/titans/medium/titan_medium_ion_prime.mdl" )
	ClTitanAtlas_Init( $"models/titans/medium/titan_medium_tone_prime.mdl" )
	ClTitanAtlas_Init( $"models/titans/medium/titan_medium_vanguard.mdl" )
	ClTitanAtlas_Init( $"models/titans/medium/titan_medium_wraith.mdl" )
	ClTitanOgre_Init( $"models/titans/heavy/titan_heavy_deadbolt.mdl" )
	ClTitanOgre_Init( $"models/titans/heavy/titan_heavy_legion_prime.mdl" )
	ClTitanOgre_Init( $"models/titans/heavy/titan_heavy_ogre.mdl" )
	ClTitanOgre_Init( $"models/titans/heavy/titan_heavy_scorch_prime.mdl" )
	ClTitanStryder_Init( $"models/titans/light/titan_light_locust.mdl" )
	ClTitanStryder_Init( $"models/titans/light/titan_light_northstar_prime.mdl" )
	ClTitanStryder_Init( $"models/titans/light/titan_light_raptor.mdl" )
	ClTitanStryder_Init( $"models/titans/light/titan_light_ronin_prime.mdl" )
#endif

#if CLIENT || SERVER
	FlagSet( "FlightPath_TitanDrop" ) // Allows titanfall in level
#endif
}

