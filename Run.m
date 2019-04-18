%Setup Time Vector
tStart = 0.0;
tStop = 100.0;
tSim = [tStart,tStop];

%Figure 1 is the original values 
%Figure 2 is negative x values which looks more like the activity curves in
%the paper

%Setup initial conditions
x0 = [5.0; %A
      4.5; %B
      0.5; %C
      2.0
      0.0
      0.0
      0.0];
  


%Solver
[t,X] = ode23(@(t,x) Balances(t,x),tSim,x0);

%plotting

figure(2)
hold on
plot(t,-X(:,3),'LineWidth',2)

figure(1)
hold on

%plot original activity curve
plot(t,X(:,3),'LineWidth',2)

%now change the system to a new ligand to show change
[t,X] = ode23(@(t,x) Balances2(t,x),tSim,x0);

plot(t,X(:,3),'LineWidth',2)

% now change the system to remove the inhibitor to compare to 3

x0 = [5.0; %A
      4.5; %B
      0.5; %C
      0.0
      2.0
      0.0
      0.0];
[t,X] = ode23(@(t,x) Balances3(t,x),tSim,x0);

plot(t,X(:,3),'LineWidth',2)

%plot(t,X(:,4),'LineWidth',2)
%plot(t,X(:,5),'LineWidth',2)
%plot(t,X(:,6),'LineWidth',2)
%plot(t,X(:,7),'LineWidth',2)
xlabel("time (s)")
ylabel("Concentration of E_1_star (activity) (mM)")
title("Original Activity curve (no inverting)")
legend("Original activity curve with l = 0.1", "Activity curve with ligand l increased to l = 1", "removal of the B inhibitor for l = 0.1")
hold off


   % E_O     = x(1)
   % E_1     = x(2)
   % E_1_S   = x(3)
   % B       = x(4)
   % B_p     = x(5)
   % E_1_B   = x(6)
   % E_1_B_p = x(7)
   
   % just to show how it appears to be exactly inverted from the original
   % paper
   
   figure(2)
hold on

%plot original activity curve
plot(t,-X(:,3),'LineWidth',2)

%now change the system to a new ligand to show change
[t,X] = ode23(@(t,x) Balances2(t,x),tSim,x0);

plot(t,-X(:,3),'LineWidth',2)

% now change the system to remove the inhibitor to compare to 3

x0 = [5.0; %A
      4.5; %B
      0.5; %C
      0.0
      2.0
      0.0
      0.0];
[t,X] = ode23(@(t,x) Balances3(t,x),tSim,x0);

plot(t,-X(:,3),'LineWidth',2)

%plot(t,X(:,4),'LineWidth',2)
%plot(t,X(:,5),'LineWidth',2)
%plot(t,X(:,6),'LineWidth',2)
%plot(t,X(:,7),'LineWidth',2)
xlabel("time (s)")
ylabel("Concentration of E_1_star (activity) (mM)")
title("Activity curve with inverted X to have activity decrease with ligand addition")
legend("Original activity curve with l = 0.1", "Activity curve with ligand l increased to l = 1", "removal of the B inhibitor for l = 0.1")
hold off

   
