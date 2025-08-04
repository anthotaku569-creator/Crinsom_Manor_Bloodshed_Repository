#macro gnd_fric_1 4
#macro air_fric_1 0.5
#macro grav_1 1.2
#macro jmp_1 18.6
#macro jmp_2 15.2

enum states{
	idle,
	normal_atack,
	l_attack,
	m_attack,
	h_attack,
	landing,
	hitstun,
	knockdown,
	kdown_recovery,
	block,
	grab,
	dodge,
	special_atack,
	parry,
	air_dash,
	run,
	curse_eye,
	super_atack,
	enter_match,
	round_finish
}

enum blc_types{
	ovh,
	low,
	mid,
	pry,
	grb,
	push
}

enum protections{
	nothing,
	armor,
	hit_invul,
	low_invul,
	mid_invul,
	ovh_invul,
	proy_invul,
	grab_invul,
	full
}