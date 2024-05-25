def curve(t):
    if t < 1:
        return math.sin(t*math.pi/2)
    else:
        return math.sin((2-t)*math.pi/2) * 0.5 + 0.5
