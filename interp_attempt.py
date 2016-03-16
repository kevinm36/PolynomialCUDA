def MRC_alg(rvect,mvect,c):
    k = len(rvect)
    gamma = np.empty(k,dtype = np.int32)
    gamma[0] = rvect[0]
    #gamma[0] = rvect[0]
    M = np.ones(k,dtype=np.int32)

    for i in range(1,k):
        gamma[i] = ((rvect[i] - gamma[0])*c[i]) % mvect[i]
        M[i] = (mvect[0]*c[i]) % mvect[i]

    for i in range(1,k-1):
        for j in range(i+1,k):
            gamma[j] = (gamma[j] - gamma[i]*M[j]) % mvect[j]
            M[j] = (M[j]*mvect[i]) % mvect[j]
    return gamma,M

newton_interp_mod(alpha,)