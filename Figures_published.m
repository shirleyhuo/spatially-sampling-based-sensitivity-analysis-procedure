%% Figure 1
figure();
Xticks=[1,6,11,16,21,26,30];
XTickLabels=[1982,1987,1992,1997,2002,2007,2011];

subplot(2,1,1);
plot(1:30,AnnualpreciUS,'blue','LineWidth',1.5,'LineStyle','-');
hold on;
plot(1:30,AnnualmeanpreciUS,'black','LineWidth',1.5,'LineStyle','--');
set(gca,'XLim',[0,31],'FontName', 'Times New Roman',...
'FontSize',12,...
'XTick',Xticks, ...
'XTickLabel',num2str(XTickLabels'));
box off;
ylabel('(mm)','FontName', 'Times New Roman', 'FontSize',12);
xlabel('Year','FontName', 'Times New Roman', 'FontSize',12);
title('Annual precipitation','Fontsize',15);
text(0.5,940,'(a)','FontName', 'Times New Roman','Fontsize',15,'FontWeight','bold');

subplot(2,1,2);
plot(1:30,AnnualaiUS,'red','LineWidth',1.5,'LineStyle','-');
hold on;
plot(1:30,AnnualmeanaiUS,'black','LineWidth',1.5,'LineStyle','--');
set(gca,'XLim',[0,31],'FontName', 'Times New Roman',...
'FontSize',12,...
'XTick',Xticks, ...
'XTickLabel',num2str(XTickLabels'));
box off;
xlabel('Year','FontName', 'Times New Roman', 'FontSize',12);
title('Annual humidity index','Fontsize',15);
text(0.5,1.07,'(b)','FontName', 'Times New Roman','Fontsize',15,'FontWeight','bold');


%% Figure 2 
figure('position', [0 0 600 1000]);
% (a)
x = 1:1:16;
Yticks=0:2500:10000;
xlabels={'1';'2';'3';'5';'6';'7';'8';'9';'10';...
'11';'14';'18';'16';'18';'19';'21'};
subplot(3,1,1);
bar(veggridsnumber,1.0);
%axes('Units', 'points', 'Position', [70 50 460 230]);
%plot(x,veggridsnumber,'Color',[0.1 0.5 0.8],'LineWidth',2,'Marker','h');
%box off;
set(gca,'XLim',[0,17],'FontName', 'Times New Roman',...
'FontSize',15,...
'XTick',x,'YTick',Yticks, ...
'XTickLabel',xlabels);
ylabel('Number of grids','FontName', 'Times New Roman', 'FontSize',15,...
'FontWeight','bold');
xlh=xlabel('Vegetation type','FontName','Times New Roman','Fontsize',15,...
'FontWeight','bold');
pos1=get(xlh,'Position');
pos1(2)=pos1(2)+10;
set(xlh,'Position',pos1);
text(0.3,10800,'(a)','FontName', 'Times New Roman', 'FontSize',15,'FontWeight','bold');
% (b)
ytick1=0:0.0002:0.001;
ytick2=0:200:1000;
subplot(3,1,2);
bar(valigpp8211,1.0,'FaceColor',[0.4660 0.6740 0.1880]);
set(gca,'XLim',[0,17],'YLim',[0,0.00065],'FontName', 'Times New Roman',...
'FontSize',15,...
'XTick',x, ...
'XTickLabel',xlabels);
ylabel('GPP (g/m^2/s)','FontName', 'Times New Roman', 'FontSize',15,...
'FontWeight','bold');
xlh=xlabel('Vegetation type','FontName','Times New Roman','Fontsize',15,...
'FontWeight','bold');
pos1=get(xlh,'Position');
pos1(2)=pos1(2)+0.000005;
set(xlh,'Position',pos1);
text(0.3,0.00062,'(b)','FontName', 'Times New Roman', 'FontSize',15,'FontWeight','bold');
% (c)
ytick1=0:0.0002:0.001;
ytick2=0:200:1000;
subplot(3,1,3);
bar(valiflh8211,1.0,'FaceColor',[0.4940 0.1840 0.5560]);
set(gca,'XLim',[0,17],'YLim',[0,900],'FontName', 'Times New Roman',...
'FontSize',15,...
'XTick',x, ...
'XTickLabel',xlabels);
ylabel('FLH (W/m^2)','FontName', 'Times New Roman', 'FontSize',15,...
'FontWeight','bold');
xlh=xlabel('Vegetation type','FontName','Times New Roman','Fontsize',15,...
'FontWeight','bold');
pos1=get(xlh,'Position');
pos1(2)=pos1(2)+5;
set(xlh,'Position',pos1);
text(0.3,980,'(c)','FontName', 'Times New Roman', 'FontSize',15,'FontWeight','bold');
%
ha=get(gcf,'children');
set(ha(1),'position',[0.1528 0.08 0.7522 0.23]);
set(ha(2),'position',[0.1528 0.405 0.7522 0.23]);
set(ha(3),'position',[0.1528 0.735 0.7522 0.23]);


%% Figure 3 is ploted by ncl script



%% Fiugure 4 is ploted by PPT


%% Figure 5
Xticks=1:1:12;
XTickLabels={'smcwlt';'smcmax';'bexp';'dksat';'dwsat';'sla';'fragr';'ltovrc';'vcmx25';...
'rmf25';'tdlef';'dilefc'};
Yticks=1:1:4;
YTickLabels=[1 2 3 4];
figure('position', [0 0 1000 600]);
subplot(2,2,1);
bar(veg7gpps60');
box off;
set(gca,'XLim',[0,13],'YLim',[0.5,4.2],'FontName', 'Times New Roman',...
'FontSize',15,...
'XTick',Xticks,'YTick',Yticks, ...
'XTickLabel',XTickLabels,'YTickLabel',YTickLabels);
%box off;
xtb = get(gca,'XTickLabel');   % 获取横坐标轴标签句柄
xt = get(gca,'XTick');   % 获取横坐标轴刻度句柄
yt = get(gca,'YTick');    % 获取纵坐标轴刻度句柄          
xtextp=xt;    %每个标签放置位置的横坐标，这个自然应该和原来的一样了。
% 设置显示标签的位置，写法不唯一，这里其实是在为每个标签找放置位置的纵坐标                     
ytextp=yt(1)*ones(1,length(xt)); 
% rotation，正的旋转角度代表逆时针旋转，旋转轴可以由HorizontalAlignment属性来设定，
% 有3个属性值：left，right，center，这里可以改这三个值，以及rotation后的角度，这里写的是45
% 不同的角度对应不同的旋转位置了，依自己的需求而定了。
% ytextp - 0.5是让标签稍微下一移一点，显得不那么紧凑
text(xtextp,ytextp-0.6,xtb,'HorizontalAlignment','right','rotation',30,'fontsize',12,...
'FontName', 'Times New Roman'); 
set(gca,'xticklabel','');% 将原有的标签隐去
xlh=xlabel('Parameter','FontName', 'Times New Roman', 'FontSize',15);
pos1=get(xlh,'Position');
pos1(1)=pos1(1)-0.4;
pos1(2)=pos1(2)-0.3;
set(xlh,'Position',pos1);
ylabel('Importance group ranking','FontName', 'Times New Roman','Fontsize',15);
text(0.2,4.4,'(a) 60','FontName', 'Times New Roman','Fontsize',15,'FontWeight','bold');

subplot(2,2,2);
bar(veg7gpps120');
box off;
set(gca,'XLim',[0,13],'YLim',[0.5,4.2],'FontName', 'Times New Roman',...
'FontSize',15,...
'XTick',Xticks,'YTick',Yticks, ...
'XTickLabel',XTickLabels,'YTickLabel',YTickLabels);
%box off;
xtb = get(gca,'XTickLabel');   % 获取横坐标轴标签句柄
xt = get(gca,'XTick');   % 获取横坐标轴刻度句柄
yt = get(gca,'YTick');    % 获取纵坐标轴刻度句柄          
xtextp=xt;    %每个标签放置位置的横坐标，这个自然应该和原来的一样了。
% 设置显示标签的位置，写法不唯一，这里其实是在为每个标签找放置位置的纵坐标                     
ytextp=yt(1)*ones(1,length(xt)); 
% rotation，正的旋转角度代表逆时针旋转，旋转轴可以由HorizontalAlignment属性来设定，
% 有3个属性值：left，right，center，这里可以改这三个值，以及rotation后的角度，这里写的是45
% 不同的角度对应不同的旋转位置了，依自己的需求而定了。
% ytextp - 0.5是让标签稍微下一移一点，显得不那么紧凑
text(xtextp,ytextp-0.6,xtb,'HorizontalAlignment','right','rotation',30,'fontsize',12,...
'FontName', 'Times New Roman'); 
set(gca,'xticklabel','');% 将原有的标签隐去
xlh=xlabel('Parameter','FontName', 'Times New Roman', 'FontSize',15);
pos1=get(xlh,'Position');
pos1(1)=pos1(1)-0.4;
pos1(2)=pos1(2)-0.3;
set(xlh,'Position',pos1);
ylabel('Importance group ranking','FontName', 'Times New Roman','Fontsize',15);
text(0.2,4.4,'(b) 120','FontName', 'Times New Roman','Fontsize',15,'FontWeight','bold');
lh2=legend(' ',' ',' ',' ');
set(lh2,'FontName','Times New Roman','Fontsize',7,'FontWeight','bold');
set(lh2,'Box','Off');
text(12.3,5.05,'5%','FontName','Times New Roman','Fontsize',9,'FontWeight','bold');
text(12.3,4.8,'10%','FontName','Times New Roman','Fontsize',9,'FontWeight','bold');
text(12.3,4.55,'20%','FontName','Times New Roman','Fontsize',9,'FontWeight','bold');
text(12.3,4.3,'100%','FontName','Times New Roman','Fontsize',9,'FontWeight','bold');

subplot(2,2,3);
bar(veg7gpps180');
box off;
set(gca,'XLim',[0,13],'YLim',[0.5,4.2],'FontName', 'Times New Roman',...
'FontSize',15,...
'XTick',Xticks,'YTick',Yticks, ...
'XTickLabel',XTickLabels,'YTickLabel',YTickLabels);
%box off;
xtb = get(gca,'XTickLabel');   % 获取横坐标轴标签句柄
xt = get(gca,'XTick');   % 获取横坐标轴刻度句柄
yt = get(gca,'YTick');    % 获取纵坐标轴刻度句柄          
xtextp=xt;    %每个标签放置位置的横坐标，这个自然应该和原来的一样了。
% 设置显示标签的位置，写法不唯一，这里其实是在为每个标签找放置位置的纵坐标                     
ytextp=yt(1)*ones(1,length(xt)); 
% rotation，正的旋转角度代表逆时针旋转，旋转轴可以由HorizontalAlignment属性来设定，
% 有3个属性值：left，right，center，这里可以改这三个值，以及rotation后的角度，这里写的是45
% 不同的角度对应不同的旋转位置了，依自己的需求而定了。
% ytextp - 0.5是让标签稍微下一移一点，显得不那么紧凑
text(xtextp,ytextp-0.6,xtb,'HorizontalAlignment','right','rotation',30,'fontsize',12,...
'FontName', 'Times New Roman'); 
set(gca,'xticklabel','');% 将原有的标签隐去
xlh=xlabel('Parameter','FontName', 'Times New Roman', 'FontSize',15);
pos1=get(xlh,'Position');
pos1(1)=pos1(1)-0.4;
pos1(2)=pos1(2)-0.3;
set(xlh,'Position',pos1);
ylabel('Importance group ranking','FontName', 'Times New Roman','Fontsize',15);
text(0.2,4.4,'(c) 180','FontName', 'Times New Roman','Fontsize',15,'FontWeight','bold');


subplot(2,2,4);
bar(veg7gpps240');
box off;
set(gca,'XLim',[0,13],'YLim',[0.5,4.2],'FontName', 'Times New Roman',...
'FontSize',15,...
'XTick',Xticks,'YTick',Yticks, ...
'XTickLabel',XTickLabels,'YTickLabel',YTickLabels);
%box off;
xtb = get(gca,'XTickLabel');   % 获取横坐标轴标签句柄
xt = get(gca,'XTick');   % 获取横坐标轴刻度句柄
yt = get(gca,'YTick');    % 获取纵坐标轴刻度句柄          
xtextp=xt;    %每个标签放置位置的横坐标，这个自然应该和原来的一样了。
% 设置显示标签的位置，写法不唯一，这里其实是在为每个标签找放置位置的纵坐标                     
ytextp=yt(1)*ones(1,length(xt)); 
% rotation，正的旋转角度代表逆时针旋转，旋转轴可以由HorizontalAlignment属性来设定，
% 有3个属性值：left，right，center，这里可以改这三个值，以及rotation后的角度，这里写的是45
% 不同的角度对应不同的旋转位置了，依自己的需求而定了。
% ytextp - 0.5是让标签稍微下一移一点，显得不那么紧凑
text(xtextp,ytextp-0.6,xtb,'HorizontalAlignment','right','rotation',30,'fontsize',12,...
'FontName', 'Times New Roman'); 
set(gca,'xticklabel','');% 将原有的标签隐去
xlh=xlabel('Parameter','FontName', 'Times New Roman', 'FontSize',15);
pos1=get(xlh,'Position');
pos1(1)=pos1(1)-0.4;
pos1(2)=pos1(2)-0.3;
set(xlh,'Position',pos1);
ylabel('Importance group ranking','FontName', 'Times New Roman','Fontsize',15);
text(0.2,4.4,'(d) 240','FontName', 'Times New Roman','Fontsize',15,'FontWeight','bold');
spo=suptitle('Grassland: GPP');
set(spo,'FontName', 'Times New Roman','Fontsize',20,'FontWeight','bold');

ha=get(gcf,'children');
set(ha(1),'position',[0.55 0.0867 0.41 0.33]);
set(ha(3),'position',[0.06 0.0867 0.41 0.33]);
set(ha(5),'position',[0.55 0.53 0.41 0.33]);
set(ha(6),'position',[0.06 0.53 0.41 0.33]);
set(ha(2),'position',[0.0 1.02 1 1]); % Position of Total Title
set(ha(4),'position',[0.89 0.86 0.0670 0.0825]);% Position of Legend
%% Figure 6
Xticks=1:1:12;
XTickLabels={'smcwlt';'smcmax';'bexp';'dksat';'dwsat';'sla';'fragr';'ltovrc';'vcmx25';...
'rmf25';'tdlef';'dilefc'};
Yticks=1:1:4;
YTickLabels=[1 2 3 4];
figure('position', [0 0 1000 600]);
subplot(2,2,1);
bar(veg11gpps60');
box off;
set(gca,'XLim',[0,13],'YLim',[0.5,4.2],'FontName', 'Times New Roman',...
'FontSize',15,...
'XTick',Xticks,'YTick',Yticks, ...
'XTickLabel',XTickLabels,'YTickLabel',YTickLabels);
%box off;
xtb = get(gca,'XTickLabel');   % 获取横坐标轴标签句柄
xt = get(gca,'XTick');   % 获取横坐标轴刻度句柄
yt = get(gca,'YTick');    % 获取纵坐标轴刻度句柄          
xtextp=xt;    %每个标签放置位置的横坐标，这个自然应该和原来的一样了。
% 设置显示标签的位置，写法不唯一，这里其实是在为每个标签找放置位置的纵坐标                     
ytextp=yt(1)*ones(1,length(xt)); 
% rotation，正的旋转角度代表逆时针旋转，旋转轴可以由HorizontalAlignment属性来设定，
% 有3个属性值：left，right，center，这里可以改这三个值，以及rotation后的角度，这里写的是45
% 不同的角度对应不同的旋转位置了，依自己的需求而定了。
% ytextp - 0.5是让标签稍微下一移一点，显得不那么紧凑
text(xtextp,ytextp-0.6,xtb,'HorizontalAlignment','right','rotation',30,'fontsize',12,...
'FontName', 'Times New Roman'); 
set(gca,'xticklabel','');% 将原有的标签隐去
xlh=xlabel('Parameter','FontName', 'Times New Roman', 'FontSize',15);
pos1=get(xlh,'Position');
pos1(1)=pos1(1)-0.4;
pos1(2)=pos1(2)-0.3;
set(xlh,'Position',pos1);
ylabel('Importance group ranking','FontName', 'Times New Roman','Fontsize',15);
text(0.2,4.4,'(a) 60','FontName', 'Times New Roman','Fontsize',15,'FontWeight','bold');

subplot(2,2,2);
bar(veg11gpps120');
box off;
set(gca,'XLim',[0,13],'YLim',[0.5,4.2],'FontName', 'Times New Roman',...
'FontSize',15,...
'XTick',Xticks,'YTick',Yticks, ...
'XTickLabel',XTickLabels,'YTickLabel',YTickLabels);
%box off;
xtb = get(gca,'XTickLabel');   % 获取横坐标轴标签句柄
xt = get(gca,'XTick');   % 获取横坐标轴刻度句柄
yt = get(gca,'YTick');    % 获取纵坐标轴刻度句柄          
xtextp=xt;    %每个标签放置位置的横坐标，这个自然应该和原来的一样了。
% 设置显示标签的位置，写法不唯一，这里其实是在为每个标签找放置位置的纵坐标                     
ytextp=yt(1)*ones(1,length(xt)); 
% rotation，正的旋转角度代表逆时针旋转，旋转轴可以由HorizontalAlignment属性来设定，
% 有3个属性值：left，right，center，这里可以改这三个值，以及rotation后的角度，这里写的是45
% 不同的角度对应不同的旋转位置了，依自己的需求而定了。
% ytextp - 0.5是让标签稍微下一移一点，显得不那么紧凑
text(xtextp,ytextp-0.6,xtb,'HorizontalAlignment','right','rotation',30,'fontsize',12,...
'FontName', 'Times New Roman'); 
set(gca,'xticklabel','');% 将原有的标签隐去
xlh=xlabel('Parameter','FontName', 'Times New Roman', 'FontSize',15);
pos1=get(xlh,'Position');
pos1(1)=pos1(1)-0.4;
pos1(2)=pos1(2)-0.3;
set(xlh,'Position',pos1);
ylabel('Importance group ranking','FontName', 'Times New Roman','Fontsize',15);
text(0.2,4.4,'(b) 120','FontName', 'Times New Roman','Fontsize',15,'FontWeight','bold');
lh2=legend(' ',' ',' ',' ');
set(lh2,'FontName','Times New Roman','Fontsize',7,'FontWeight','bold');
set(lh2,'Box','Off');
text(12.3,5.05,'5%','FontName','Times New Roman','Fontsize',9,'FontWeight','bold');
text(12.3,4.8,'10%','FontName','Times New Roman','Fontsize',9,'FontWeight','bold');
text(12.3,4.55,'20%','FontName','Times New Roman','Fontsize',9,'FontWeight','bold');
text(12.3,4.3,'100%','FontName','Times New Roman','Fontsize',9,'FontWeight','bold');

subplot(2,2,3);
bar(veg11gpps180');
box off;
set(gca,'XLim',[0,13],'YLim',[0.5,4.2],'FontName', 'Times New Roman',...
'FontSize',15,...
'XTick',Xticks,'YTick',Yticks, ...
'XTickLabel',XTickLabels,'YTickLabel',YTickLabels);
%box off;
xtb = get(gca,'XTickLabel');   % 获取横坐标轴标签句柄
xt = get(gca,'XTick');   % 获取横坐标轴刻度句柄
yt = get(gca,'YTick');    % 获取纵坐标轴刻度句柄          
xtextp=xt;    %每个标签放置位置的横坐标，这个自然应该和原来的一样了。
% 设置显示标签的位置，写法不唯一，这里其实是在为每个标签找放置位置的纵坐标                     
ytextp=yt(1)*ones(1,length(xt)); 
% rotation，正的旋转角度代表逆时针旋转，旋转轴可以由HorizontalAlignment属性来设定，
% 有3个属性值：left，right，center，这里可以改这三个值，以及rotation后的角度，这里写的是45
% 不同的角度对应不同的旋转位置了，依自己的需求而定了。
% ytextp - 0.5是让标签稍微下一移一点，显得不那么紧凑
text(xtextp,ytextp-0.6,xtb,'HorizontalAlignment','right','rotation',30,'fontsize',12,...
'FontName', 'Times New Roman'); 
set(gca,'xticklabel','');% 将原有的标签隐去
xlh=xlabel('Parameter','FontName', 'Times New Roman', 'FontSize',15);
pos1=get(xlh,'Position');
pos1(1)=pos1(1)-0.4;
pos1(2)=pos1(2)-0.3;
set(xlh,'Position',pos1);
ylabel('Importance group ranking','FontName', 'Times New Roman','Fontsize',15);
text(0.2,4.4,'(c) 180','FontName', 'Times New Roman','Fontsize',15,'FontWeight','bold');


subplot(2,2,4);
bar(veg11gpps240');
box off;
set(gca,'XLim',[0,13],'YLim',[0.5,4.2],'FontName', 'Times New Roman',...
'FontSize',15,...
'XTick',Xticks,'YTick',Yticks, ...
'XTickLabel',XTickLabels,'YTickLabel',YTickLabels);
%box off;
xtb = get(gca,'XTickLabel');   % 获取横坐标轴标签句柄
xt = get(gca,'XTick');   % 获取横坐标轴刻度句柄
yt = get(gca,'YTick');    % 获取纵坐标轴刻度句柄          
xtextp=xt;    %每个标签放置位置的横坐标，这个自然应该和原来的一样了。
% 设置显示标签的位置，写法不唯一，这里其实是在为每个标签找放置位置的纵坐标                     
ytextp=yt(1)*ones(1,length(xt)); 
% rotation，正的旋转角度代表逆时针旋转，旋转轴可以由HorizontalAlignment属性来设定，
% 有3个属性值：left，right，center，这里可以改这三个值，以及rotation后的角度，这里写的是45
% 不同的角度对应不同的旋转位置了，依自己的需求而定了。
% ytextp - 0.5是让标签稍微下一移一点，显得不那么紧凑
text(xtextp,ytextp-0.6,xtb,'HorizontalAlignment','right','rotation',30,'fontsize',12,...
'FontName', 'Times New Roman'); 
set(gca,'xticklabel','');% 将原有的标签隐去
xlh=xlabel('Parameter','FontName', 'Times New Roman', 'FontSize',15);
pos1=get(xlh,'Position');
pos1(1)=pos1(1)-0.4;
pos1(2)=pos1(2)-0.3;
set(xlh,'Position',pos1);
ylabel('Importance group ranking','FontName', 'Times New Roman','Fontsize',15);
text(0.2,4.4,'(d) 240','FontName', 'Times New Roman','Fontsize',15,'FontWeight','bold');
spo=suptitle('Deciduous broadleaf forest: GPP');
set(spo,'FontName', 'Times New Roman','Fontsize',20,'FontWeight','bold');

ha=get(gcf,'children');
set(ha(1),'position',[0.55 0.0867 0.41 0.33]);
set(ha(3),'position',[0.06 0.0867 0.41 0.33]);
set(ha(5),'position',[0.55 0.53 0.41 0.33]);
set(ha(6),'position',[0.06 0.53 0.41 0.33]);
set(ha(2),'position',[0.0 1.02 1 1]); % Position of Total Title
set(ha(4),'position',[0.89 0.86 0.0670 0.0825]);% Position of Legend

%% Figure 7
Xticks=1:1:12;
XTickLabels={'smcwlt';'smcmax';'bexp';'dksat';'dwsat';'sla';'fragr';'ltovrc';'vcmx25';...
'rmf25';'tdlef';'dilefc'};
Yticks=1:1:4;
YTickLabels=[1 2 3 4];
figure('position', [0 0 1000 600]);
subplot(2,2,1);
bar(veg7flhs60');
box off;
set(gca,'XLim',[0,13],'YLim',[0.5,4.2],'FontName', 'Times New Roman',...
'FontSize',15,...
'XTick',Xticks,'YTick',Yticks, ...
'XTickLabel',XTickLabels,'YTickLabel',YTickLabels);
%box off;
xtb = get(gca,'XTickLabel');   % 获取横坐标轴标签句柄
xt = get(gca,'XTick');   % 获取横坐标轴刻度句柄
yt = get(gca,'YTick');    % 获取纵坐标轴刻度句柄          
xtextp=xt;    %每个标签放置位置的横坐标，这个自然应该和原来的一样了。
% 设置显示标签的位置，写法不唯一，这里其实是在为每个标签找放置位置的纵坐标                     
ytextp=yt(1)*ones(1,length(xt)); 
% rotation，正的旋转角度代表逆时针旋转，旋转轴可以由HorizontalAlignment属性来设定，
% 有3个属性值：left，right，center，这里可以改这三个值，以及rotation后的角度，这里写的是45
% 不同的角度对应不同的旋转位置了，依自己的需求而定了。
% ytextp - 0.5是让标签稍微下一移一点，显得不那么紧凑
text(xtextp,ytextp-0.6,xtb,'HorizontalAlignment','right','rotation',30,'fontsize',12,...
'FontName', 'Times New Roman'); 
set(gca,'xticklabel','');% 将原有的标签隐去
xlh=xlabel('Parameter','FontName', 'Times New Roman', 'FontSize',15);
pos1=get(xlh,'Position');
pos1(1)=pos1(1)-0.4;
pos1(2)=pos1(2)-0.3;
set(xlh,'Position',pos1);
ylabel('Importance group ranking','FontName', 'Times New Roman','Fontsize',15);
text(0.2,4.4,'(a) 60','FontName', 'Times New Roman','Fontsize',15,'FontWeight','bold');

subplot(2,2,2);
bar(veg7flhs120');
box off;
set(gca,'XLim',[0,13],'YLim',[0.5,4.2],'FontName', 'Times New Roman',...
'FontSize',15,...
'XTick',Xticks,'YTick',Yticks, ...
'XTickLabel',XTickLabels,'YTickLabel',YTickLabels);
%box off;
xtb = get(gca,'XTickLabel');   % 获取横坐标轴标签句柄
xt = get(gca,'XTick');   % 获取横坐标轴刻度句柄
yt = get(gca,'YTick');    % 获取纵坐标轴刻度句柄          
xtextp=xt;    %每个标签放置位置的横坐标，这个自然应该和原来的一样了。
% 设置显示标签的位置，写法不唯一，这里其实是在为每个标签找放置位置的纵坐标                     
ytextp=yt(1)*ones(1,length(xt)); 
% rotation，正的旋转角度代表逆时针旋转，旋转轴可以由HorizontalAlignment属性来设定，
% 有3个属性值：left，right，center，这里可以改这三个值，以及rotation后的角度，这里写的是45
% 不同的角度对应不同的旋转位置了，依自己的需求而定了。
% ytextp - 0.5是让标签稍微下一移一点，显得不那么紧凑
text(xtextp,ytextp-0.6,xtb,'HorizontalAlignment','right','rotation',30,'fontsize',12,...
'FontName', 'Times New Roman'); 
set(gca,'xticklabel','');% 将原有的标签隐去
xlh=xlabel('Parameter','FontName', 'Times New Roman', 'FontSize',15);
pos1=get(xlh,'Position');
pos1(1)=pos1(1)-0.4;
pos1(2)=pos1(2)-0.3;
set(xlh,'Position',pos1);
ylabel('Importance group ranking','FontName', 'Times New Roman','Fontsize',15);
text(0.2,4.4,'(b) 120','FontName', 'Times New Roman','Fontsize',15,'FontWeight','bold');
lh2=legend(' ',' ',' ',' ');
set(lh2,'FontName','Times New Roman','Fontsize',7,'FontWeight','bold');
set(lh2,'Box','Off');
text(12.3,5.05,'5%','FontName','Times New Roman','Fontsize',9,'FontWeight','bold');
text(12.3,4.8,'10%','FontName','Times New Roman','Fontsize',9,'FontWeight','bold');
text(12.3,4.55,'20%','FontName','Times New Roman','Fontsize',9,'FontWeight','bold');
text(12.3,4.3,'100%','FontName','Times New Roman','Fontsize',9,'FontWeight','bold');

subplot(2,2,3);
bar(veg7flhs180');
box off;
set(gca,'XLim',[0,13],'YLim',[0.5,4.2],'FontName', 'Times New Roman',...
'FontSize',15,...
'XTick',Xticks,'YTick',Yticks, ...
'XTickLabel',XTickLabels,'YTickLabel',YTickLabels);
%box off;
xtb = get(gca,'XTickLabel');   % 获取横坐标轴标签句柄
xt = get(gca,'XTick');   % 获取横坐标轴刻度句柄
yt = get(gca,'YTick');    % 获取纵坐标轴刻度句柄          
xtextp=xt;    %每个标签放置位置的横坐标，这个自然应该和原来的一样了。
% 设置显示标签的位置，写法不唯一，这里其实是在为每个标签找放置位置的纵坐标                     
ytextp=yt(1)*ones(1,length(xt)); 
% rotation，正的旋转角度代表逆时针旋转，旋转轴可以由HorizontalAlignment属性来设定，
% 有3个属性值：left，right，center，这里可以改这三个值，以及rotation后的角度，这里写的是45
% 不同的角度对应不同的旋转位置了，依自己的需求而定了。
% ytextp - 0.5是让标签稍微下一移一点，显得不那么紧凑
text(xtextp,ytextp-0.6,xtb,'HorizontalAlignment','right','rotation',30,'fontsize',12,...
'FontName', 'Times New Roman'); 
set(gca,'xticklabel','');% 将原有的标签隐去
xlh=xlabel('Parameter','FontName', 'Times New Roman', 'FontSize',15);
pos1=get(xlh,'Position');
pos1(1)=pos1(1)-0.4;
pos1(2)=pos1(2)-0.3;
set(xlh,'Position',pos1);
ylabel('Importance group ranking','FontName', 'Times New Roman','Fontsize',15);
text(0.2,4.4,'(c) 180','FontName', 'Times New Roman','Fontsize',15,'FontWeight','bold');


subplot(2,2,4);
bar(veg7flhs240');
box off;
set(gca,'XLim',[0,13],'YLim',[0.5,4.2],'FontName', 'Times New Roman',...
'FontSize',15,...
'XTick',Xticks,'YTick',Yticks, ...
'XTickLabel',XTickLabels,'YTickLabel',YTickLabels);
%box off;
xtb = get(gca,'XTickLabel');   % 获取横坐标轴标签句柄
xt = get(gca,'XTick');   % 获取横坐标轴刻度句柄
yt = get(gca,'YTick');    % 获取纵坐标轴刻度句柄          
xtextp=xt;    %每个标签放置位置的横坐标，这个自然应该和原来的一样了。
% 设置显示标签的位置，写法不唯一，这里其实是在为每个标签找放置位置的纵坐标                     
ytextp=yt(1)*ones(1,length(xt)); 
% rotation，正的旋转角度代表逆时针旋转，旋转轴可以由HorizontalAlignment属性来设定，
% 有3个属性值：left，right，center，这里可以改这三个值，以及rotation后的角度，这里写的是45
% 不同的角度对应不同的旋转位置了，依自己的需求而定了。
% ytextp - 0.5是让标签稍微下一移一点，显得不那么紧凑
text(xtextp,ytextp-0.6,xtb,'HorizontalAlignment','right','rotation',30,'fontsize',12,...
'FontName', 'Times New Roman'); 
set(gca,'xticklabel','');% 将原有的标签隐去
xlh=xlabel('Parameter','FontName', 'Times New Roman', 'FontSize',15);
pos1=get(xlh,'Position');
pos1(1)=pos1(1)-0.4;
pos1(2)=pos1(2)-0.3;
set(xlh,'Position',pos1);
ylabel('Importance group ranking','FontName', 'Times New Roman','Fontsize',15);
text(0.2,4.4,'(d) 240','FontName', 'Times New Roman','Fontsize',15,'FontWeight','bold');
spo=suptitle('Grassland: FLH');
set(spo,'FontName', 'Times New Roman','Fontsize',20,'FontWeight','bold');

ha=get(gcf,'children');
set(ha(1),'position',[0.55 0.0867 0.41 0.33]);
set(ha(3),'position',[0.06 0.0867 0.41 0.33]);
set(ha(5),'position',[0.55 0.53 0.41 0.33]);
set(ha(6),'position',[0.06 0.53 0.41 0.33]);
set(ha(2),'position',[0.0 1.02 1 1]); % Position of Total Title
set(ha(4),'position',[0.89 0.86 0.0670 0.0825]);% Position of Legend

%% Figure 8
Xticks=1:1:12;
XTickLabels={'smcwlt';'smcmax';'bexp';'dksat';'dwsat';'sla';'fragr';'ltovrc';'vcmx25';...
'rmf25';'tdlef';'dilefc'};
Yticks=1:1:4;
YTickLabels=[1 2 3 4];
figure('position', [0 0 1000 600]);
subplot(2,2,1);
bar(veg11flhs60');
box off;
set(gca,'XLim',[0,13],'YLim',[0.5,4.2],'FontName', 'Times New Roman',...
'FontSize',15,...
'XTick',Xticks,'YTick',Yticks, ...
'XTickLabel',XTickLabels,'YTickLabel',YTickLabels);
%box off;
xtb = get(gca,'XTickLabel');   % 获取横坐标轴标签句柄
xt = get(gca,'XTick');   % 获取横坐标轴刻度句柄
yt = get(gca,'YTick');    % 获取纵坐标轴刻度句柄          
xtextp=xt;    %每个标签放置位置的横坐标，这个自然应该和原来的一样了。
% 设置显示标签的位置，写法不唯一，这里其实是在为每个标签找放置位置的纵坐标                     
ytextp=yt(1)*ones(1,length(xt)); 
% rotation，正的旋转角度代表逆时针旋转，旋转轴可以由HorizontalAlignment属性来设定，
% 有3个属性值：left，right，center，这里可以改这三个值，以及rotation后的角度，这里写的是45
% 不同的角度对应不同的旋转位置了，依自己的需求而定了。
% ytextp - 0.5是让标签稍微下一移一点，显得不那么紧凑
text(xtextp,ytextp-0.6,xtb,'HorizontalAlignment','right','rotation',30,'fontsize',12,...
'FontName', 'Times New Roman'); 
set(gca,'xticklabel','');% 将原有的标签隐去
xlh=xlabel('Parameter','FontName', 'Times New Roman', 'FontSize',15);
pos1=get(xlh,'Position');
pos1(1)=pos1(1)-0.4;
pos1(2)=pos1(2)-0.3;
set(xlh,'Position',pos1);
ylabel('Importance group ranking','FontName', 'Times New Roman','Fontsize',15);
text(0.2,4.4,'(a) 60','FontName', 'Times New Roman','Fontsize',15,'FontWeight','bold');

subplot(2,2,2);
bar(veg11flhs120');
box off;
set(gca,'XLim',[0,13],'YLim',[0.5,4.2],'FontName', 'Times New Roman',...
'FontSize',15,...
'XTick',Xticks,'YTick',Yticks, ...
'XTickLabel',XTickLabels,'YTickLabel',YTickLabels);
%box off;
xtb = get(gca,'XTickLabel');   % 获取横坐标轴标签句柄
xt = get(gca,'XTick');   % 获取横坐标轴刻度句柄
yt = get(gca,'YTick');    % 获取纵坐标轴刻度句柄          
xtextp=xt;    %每个标签放置位置的横坐标，这个自然应该和原来的一样了。
% 设置显示标签的位置，写法不唯一，这里其实是在为每个标签找放置位置的纵坐标                     
ytextp=yt(1)*ones(1,length(xt)); 
% rotation，正的旋转角度代表逆时针旋转，旋转轴可以由HorizontalAlignment属性来设定，
% 有3个属性值：left，right，center，这里可以改这三个值，以及rotation后的角度，这里写的是45
% 不同的角度对应不同的旋转位置了，依自己的需求而定了。
% ytextp - 0.5是让标签稍微下一移一点，显得不那么紧凑
text(xtextp,ytextp-0.6,xtb,'HorizontalAlignment','right','rotation',30,'fontsize',12,...
'FontName', 'Times New Roman'); 
set(gca,'xticklabel','');% 将原有的标签隐去
xlh=xlabel('Parameter','FontName', 'Times New Roman', 'FontSize',15);
pos1=get(xlh,'Position');
pos1(1)=pos1(1)-0.4;
pos1(2)=pos1(2)-0.3;
set(xlh,'Position',pos1);
ylabel('Importance group ranking','FontName', 'Times New Roman','Fontsize',15);
text(0.2,4.4,'(b) 120','FontName', 'Times New Roman','Fontsize',15,'FontWeight','bold');
lh2=legend(' ',' ',' ',' ');
set(lh2,'FontName','Times New Roman','Fontsize',7,'FontWeight','bold');
set(lh2,'Box','Off');
text(12.3,5.05,'5%','FontName','Times New Roman','Fontsize',9,'FontWeight','bold');
text(12.3,4.8,'10%','FontName','Times New Roman','Fontsize',9,'FontWeight','bold');
text(12.3,4.55,'20%','FontName','Times New Roman','Fontsize',9,'FontWeight','bold');
text(12.3,4.3,'100%','FontName','Times New Roman','Fontsize',9,'FontWeight','bold');

subplot(2,2,3);
bar(veg11flhs180');
box off;
set(gca,'XLim',[0,13],'YLim',[0.5,4.2],'FontName', 'Times New Roman',...
'FontSize',15,...
'XTick',Xticks,'YTick',Yticks, ...
'XTickLabel',XTickLabels,'YTickLabel',YTickLabels);
%box off;
xtb = get(gca,'XTickLabel');   % 获取横坐标轴标签句柄
xt = get(gca,'XTick');   % 获取横坐标轴刻度句柄
yt = get(gca,'YTick');    % 获取纵坐标轴刻度句柄          
xtextp=xt;    %每个标签放置位置的横坐标，这个自然应该和原来的一样了。
% 设置显示标签的位置，写法不唯一，这里其实是在为每个标签找放置位置的纵坐标                     
ytextp=yt(1)*ones(1,length(xt)); 
% rotation，正的旋转角度代表逆时针旋转，旋转轴可以由HorizontalAlignment属性来设定，
% 有3个属性值：left，right，center，这里可以改这三个值，以及rotation后的角度，这里写的是45
% 不同的角度对应不同的旋转位置了，依自己的需求而定了。
% ytextp - 0.5是让标签稍微下一移一点，显得不那么紧凑
text(xtextp,ytextp-0.6,xtb,'HorizontalAlignment','right','rotation',30,'fontsize',12,...
'FontName', 'Times New Roman'); 
set(gca,'xticklabel','');% 将原有的标签隐去
xlh=xlabel('Parameter','FontName', 'Times New Roman', 'FontSize',15);
pos1=get(xlh,'Position');
pos1(1)=pos1(1)-0.4;
pos1(2)=pos1(2)-0.3;
set(xlh,'Position',pos1);
ylabel('Importance group ranking','FontName', 'Times New Roman','Fontsize',15);
text(0.2,4.4,'(c) 180','FontName', 'Times New Roman','Fontsize',15,'FontWeight','bold');


subplot(2,2,4);
bar(veg11flhs240');
box off;
set(gca,'XLim',[0,13],'YLim',[0.5,4.2],'FontName', 'Times New Roman',...
'FontSize',15,...
'XTick',Xticks,'YTick',Yticks, ...
'XTickLabel',XTickLabels,'YTickLabel',YTickLabels);
%box off;
xtb = get(gca,'XTickLabel');   % 获取横坐标轴标签句柄
xt = get(gca,'XTick');   % 获取横坐标轴刻度句柄
yt = get(gca,'YTick');    % 获取纵坐标轴刻度句柄          
xtextp=xt;    %每个标签放置位置的横坐标，这个自然应该和原来的一样了。
% 设置显示标签的位置，写法不唯一，这里其实是在为每个标签找放置位置的纵坐标                     
ytextp=yt(1)*ones(1,length(xt)); 
% rotation，正的旋转角度代表逆时针旋转，旋转轴可以由HorizontalAlignment属性来设定，
% 有3个属性值：left，right，center，这里可以改这三个值，以及rotation后的角度，这里写的是45
% 不同的角度对应不同的旋转位置了，依自己的需求而定了。
% ytextp - 0.5是让标签稍微下一移一点，显得不那么紧凑
text(xtextp,ytextp-0.6,xtb,'HorizontalAlignment','right','rotation',30,'fontsize',12,...
'FontName', 'Times New Roman'); 
set(gca,'xticklabel','');% 将原有的标签隐去
xlh=xlabel('Parameter','FontName', 'Times New Roman', 'FontSize',15);
pos1=get(xlh,'Position');
pos1(1)=pos1(1)-0.4;
pos1(2)=pos1(2)-0.3;
set(xlh,'Position',pos1);
ylabel('Importance group ranking','FontName', 'Times New Roman','Fontsize',15);
text(0.2,4.4,'(d) 240','FontName', 'Times New Roman','Fontsize',15,'FontWeight','bold');
spo=suptitle('Deciduous broadleaf forest: FLH');
set(spo,'FontName', 'Times New Roman','Fontsize',20,'FontWeight','bold');

ha=get(gcf,'children');
set(ha(1),'position',[0.55 0.0867 0.41 0.33]);
set(ha(3),'position',[0.06 0.0867 0.41 0.33]);
set(ha(5),'position',[0.55 0.53 0.41 0.33]);
set(ha(6),'position',[0.06 0.53 0.41 0.33]);
set(ha(2),'position',[0.0 1.02 1 1]); % Position of Total Title
set(ha(4),'position',[0.89 0.86 0.0670 0.0825]);% Position of Legend

%% Figure 9 for the most important parameters
Xticks=1:1:3;
XTickLabels={'bexp';'vcmx25';'rmf25'};
Yticks=0:0.2:1;
figure('position', [0 0 1000 600]);
subplot(2,2,1);
bar(gppv7aipa5s60p300pararoubsteachgridrankbootstraphi',1.0,'FaceColor','white','EdgeColor',[0.66 0.66 0.66]);
hold on;
bar(gppv7aipa5s60p300pararoubsteachgridrankbootstraphiforplot',1.0);
%box off;
set(gca,'XLim',[0,4],'YLim',[0,1],'FontName', 'Times New Roman',...
'FontSize',15,...
'XTick',Xticks,'YTick',Yticks, ...
'XTickLabel',XTickLabels);
%box off;
ylabel('Robustness','FontName', 'Times New Roman','Fontsize',15);
text(0.1,1.06,'(a)','FontName', 'Times New Roman','Fontsize',15,'FontWeight','bold');
text(1.2,1.06,'Grassland:GPP','FontName', 'Times New Roman','Fontsize',15,'FontWeight','bold');

subplot(2,2,2);
Xticks=1:1:2;
XTickLabels={'smcmax';'bexp'};
Yticks=0:0.2:1;
bar(flhv7aipa5s60p300pararoubsteachgridrankbootstraphi',1.0,'FaceColor','white','EdgeColor',[0.66 0.66 0.66]);
hold on;
bar(flhv7aipa5s60p300pararoubsteachgridrankbootstraphiforplot',1.0);
%box off;
set(gca,'XLim',[0,3],'YLim',[0,1],'FontName', 'Times New Roman',...
'FontSize',15,...
'XTick',Xticks,'YTick',Yticks, ...
'XTickLabel',XTickLabels);
%box off;
ylabel('Robustness','FontName', 'Times New Roman','Fontsize',15);
text(0.1,1.06,'(b)','FontName', 'Times New Roman','Fontsize',15,'FontWeight','bold');
text(1.0,1.06,'Grassland:FLH','FontName', 'Times New Roman','Fontsize',15,'FontWeight','bold');

subplot(2,2,3);
Xticks=1:1:2;
XTickLabels={'vcmx25';'rmf25'};
Yticks=0:0.2:1;
bar(gppv11aipa5s60p300pararoubsteachgridrankbootstraphi',1.0,'FaceColor','white','EdgeColor',[0.66 0.66 0.66]);
hold on;
bar(gppv11aipa5s60p300pararoubsteachgridrankbootstraphiforplot',1.0);
%box off;
set(gca,'XLim',[0,3],'YLim',[0,1],'FontName', 'Times New Roman',...
'FontSize',15,...
'XTick',Xticks,'YTick',Yticks, ...
'XTickLabel',XTickLabels);
%box off;
ylabel('Robustness','FontName', 'Times New Roman','Fontsize',15);
text(0.1,1.06,'(c)','FontName', 'Times New Roman','Fontsize',15,'FontWeight','bold');
text(1.1,1.06,'DBF:GPP','FontName', 'Times New Roman','Fontsize',15,'FontWeight','bold');


subplot(2,2,4);
Xticks=1:1:1;
XTickLabels={'bexp'};
Yticks=0:0.2:1;
bar(flhv11aipa5s60p300pararoubsteachgridrankbootstraphi',1.0,'FaceColor','white','EdgeColor',[0.66 0.66 0.66]);
hold on;
bar(flhv11aipa5s60p300pararoubsteachgridrankbootstraphiforplot',1.0);
%box off;
set(gca,'XLim',[0,3],'YLim',[0,1],'FontName', 'Times New Roman',...
'FontSize',15,...
'XTick',Xticks,'YTick',Yticks, ...
'XTickLabel',XTickLabels);
%box off;
ylabel('Robustness','FontName', 'Times New Roman','Fontsize',15);
text(0.1,1.06,'(d)','FontName', 'Times New Roman','Fontsize',15,'FontWeight','bold');
text(1.2,1.06,'DBF:FLH','FontName', 'Times New Roman','Fontsize',15,'FontWeight','bold');

ha=get(gcf,'children');
set(ha(1),'position',[0.57 0.1067 0.41 0.35]);
set(ha(2),'position',[0.06 0.1067 0.41 0.35]);
set(ha(3),'position',[0.57 0.6 0.41 0.35]);
set(ha(4),'position',[0.06 0.6 0.41 0.35]);
