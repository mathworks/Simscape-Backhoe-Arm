% Copyright 2012-2025 The MathWorks(TM), Inc.

time = Bucket_Angle_DATA.time;
Angle_Data = Bucket_Angle_DATA.signals(1).values(:,1);
Ref_Data = Bucket_Angle_DATA.signals(1).values(:,2);
Force_Data = Tilt_Force_DATA.signals(1).values;

figure(1);
clf;
temp_colorOrder = get(gca,'DefaultAxesColorOrder');

%new_sb211_h = 400;
%set(gcf,'Position',[765   405   449   336]);
set(gcf,'Position',[552    50   472   301]);

%set(gca,'Position',[0.15 0.63/522*new_sb211_h 0.775 0.341163*522/new_sb211_h])
%POSITION_211 = [0.15 0.583837 0.775 0.341163*522/new_sb211_h];
subplot(211)
Ref_h = plot(time,Ref_Data,'color','k','LineWidth',3,'LineStyle','-.');
hold on; 
Angle_h = plot(time,Angle_Data,'Color',temp_colorOrder(1,:),'LineWidth',3);
hold off
title_h = title('Angle (deg)');
set(title_h,'FontSize',14);
%xlabel_h = xlabel('Time (s)');
%set(xlabel_h,'FontSize',12);
ylabel_h = ylabel('Angle (deg)','FontSize',12);
grid on
set(gca,'Box','on');
%legend('No Friction','Friction','Location','Best');
%legend('Rod','Piston','Location',[0.2128    0.4421    0.2691    0.1622]);
axis([time(1) time(end) -100 20]);

subplot(212)
patch_color = [239/256 241/256 227/256]*.8;patch1_x = [1 time(end) time(end) 1];patch1_y = [-5e5 -5e5 5e5 5e5];patch1_h = patch(patch1_x, patch1_y, patch_color);hold on
Force_h = plot(time,Force_Data,'LineWidth',3);

title_h = title('Actuator Force');
xlabel_h = xlabel('Time (s)');
ylabel_h = ylabel('Force');
set(title_h,'FontSize',14);
set(xlabel_h,'FontSize',12);
set(ylabel_h,'FontSize',12);
grid on
set(gca,'Box','on');
%legend('No Friction','Friction','Location','Best');
%legend('Rod','Piston','Location',[0.2128    0.4421    0.2691    0.1622]);
axis([time(1) time(end) -6e5 6e5]);





