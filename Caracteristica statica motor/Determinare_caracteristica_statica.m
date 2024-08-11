% valorile factorilor de umplere ale semnalului PWM ce controleaza
% motorul, corespondente unor tensiuni de 5 * factor de umplere / 100 V
u = 30:2:100;

% turatia motorului in regim stationar pentru un factor de umplere dat
y = [0 0 0 8.5714283 10 11.4285717 14.2857151 15.71428594 19.4285717 22.2857151 25.1428585 27.4285736 32.5714302 33.1428604 37.1428604 37.7142868 38.285717 40.5714302 46.285717 49.1428604 51.4285736 53.1428604 56.5714302 75.4285736 74.2857208 75.4285736 75.4285736 75.4285736 76 75.4285736 76.571434 76.571434 76 76.571434 76 76];

% observam ca pentru comenzi mai mici de 36% curentul furnizat motorului nu
% este suficient de mare cat sa invinga frecarile statice, iar pentru
% comenzi mai mari de 74% motorul intra in saturatie. In rest,
% caracteristica statica motorului este liniara, asa ca vom opera in 
% intervalul 38% - 74%, alegand punctul static de functionare la mijlocul 
% acestui interval, si anume 58%

%calculam panta si offsetul aferente caracteristicii liniarizate
panta = (y(23) - y(5)) / (u(23) - u(5));
offset = y(5);
disp("Panta : " + panta);
disp("Offset : " + offset);


figure('Name',"Caracteristica statica a motorului", 'NumberTitle', 'off');
plot(u,y,'LineWidth',1.5,'Color','b');
hold on;
plot([u(5),u(23)],[y(5),y(23)],'LineWidth',2,'Color','r');
plot(u(15),offset + (u(15) - u(5)) * panta,"*g");
xlabel('Factor de umplere [ % din 5 V ]');
ylabel('Turatie rotor [ RPM ]');
legend('Masuratori','Liniarizare','PSF');
title('Caracteristica statica motor');
hold off;