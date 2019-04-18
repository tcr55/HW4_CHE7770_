function dxdt = Balances(t,x)
    
    %Define x species vector
   % E_O     = x(1)
   % E_1     = x(2)
   % E_1_S   = x(3)
   % B       = x(4)
   % B_p     = x(5)
   % E_1_B   = x(6)
   % E_1_B_p = x(7)

    %Setup Parameters
    Attractant   =  .1                           ;        
    a_1_plus    =  1 / (1+Attractant)            ;        
    a_1_minus     =  Attractant / (1 + Attractant) ;        
    a_b_p        =  0.1 ;        
    a_b          =  1 %1 ;        
    K_b_p        =  1 ;        
    K_b          =  0 ;        
    d_b_p        =  0.01 ;        
    d_b          =  1 ;        
    V_r_max      =  .02 ;        %(calcualed from zero order assumption )
    Beta_1       =  (2.5 * Attractant) / (1 + Attractant) ;        
    K_plus       =  1 % 1 ;        
    K_minus      =  1 %1 ;        


    %Setup Mass Balances
    dxdt = [ (- V_r_max) + K_b_p * x(7) + K_b * x(6) 
             V_r_max + a_1_minus * x(3) - (a_1_plus * x(2)) + (Beta_1 * x(6)) + (Beta_1 * x(7))
             (- a_1_minus * x(3)) + (a_1_plus * x(2)) + (d_b_p * x(7)) + (d_b * x(6)) - (a_b_p * x(3) * x(5)) - (a_b * x(3) * x(4))
             (d_b * x(6)) - (a_b * x(3) * x(4)) + (Beta_1 * x(6)) + (K_b * x(6)) - (K_plus * x(4) * x(3)) + (K_minus * x(5)) 
             (d_b_p* x(7)) - (a_b_p * x(3) * x(5)) + (Beta_1 * x(7)) + (K_b_p * x(7)) + (K_plus * x(4) * x(3)) - (K_minus * x(5)) 
             (- d_b * x(6)) + (a_b * x(3) * x(4)) - (Beta_1 * x(6)) - (K_b * x(6)) 
             (- d_b_p * x(7)) + (a_b_p * x(3) * x(5)) - (Beta_1 * x(7)) - (K_b_p * x(7))
             ] 
    
end