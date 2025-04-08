function dydt = platoon_ode(t, y, u, dot_YAW0)
    dydt = platoon(t, y, u, dot_YAW0);
end